package controller.admin;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Cart;
import models.Order;
import dao.OrderDAO;
import models.Product;
import models.UserDTO;

@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {
    
    private static final String ERROR = "orders.jsp";
    private static final String SUCCESS = "orders.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        
        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            
            if (loginUser == null) {
                request.setAttribute("ERROR", "Vui lòng đăng nhập để thực hiện thanh toán!");
            } else if (cart != null && !cart.getCart().isEmpty()) {
                String userID = loginUser.getUserID();
                OrderDAO orderDAO = new OrderDAO();
                
                double totalPrice = 0;
                for (Product product : cart.getCart().values()) {
                    totalPrice += product.getPrice() * product.getQuantity();
                }
                Order order = new Order(0, userID, new java.sql.Date(System.currentTimeMillis()), totalPrice);
                
                boolean checkCreate = orderDAO.create(order);
                if (checkCreate) {
                    session.removeAttribute("CART");
                    List<Order> orderList = orderDAO.getOrdersByUserID(userID);
                    request.setAttribute("orderList", orderList);
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Không thể tạo đơn hàng!");
                }
            } else {
                request.setAttribute("ERROR", "Giỏ hàng của bạn trống!");
            }
        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
}
