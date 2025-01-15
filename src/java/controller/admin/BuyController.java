package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Cart;
import models.Product;
import dao.OrderDAO;
import models.Order;
import models.UserDTO;
import java.util.List;

@WebServlet(name = "BuyController", urlPatterns = {"/BuyController"})
public class BuyController extends HttpServlet {

    private static final String ERROR = "viewCart.jsp";
    private static final String SUCCESS = "orders.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        try {
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String productId = request.getParameter("productId");

            if (loginUser == null) {
                request.setAttribute("ERROR", "Please login to buy products!");
            } else if (cart != null && cart.getCart().containsKey(productId)) {
                Product product = cart.getCart().get(productId);
                OrderDAO orderDAO = new OrderDAO();

                Order order = new Order(0, loginUser.getUserID(), new java.sql.Date(System.currentTimeMillis()), product.getPrice() * product.getQuantity());

                boolean checkCreate = orderDAO.create(order);
                if (checkCreate) {
                    cart.remove(productId);
                    if (cart.getCart().isEmpty()) {
                        session.removeAttribute("CART");
                    } else {
                        session.setAttribute("CART", cart);
                    }
                    List<Order> orderList = orderDAO.getOrdersByUserID(loginUser.getUserID());
                    request.setAttribute("orderList", orderList);
                    url = SUCCESS;
                } else {
                    request.setAttribute("ERROR", "Cannot create order!");
                }
            } else {
                request.setAttribute("ERROR", "Product not found in cart!");
            }
        } catch (Exception e) {
            log("Error at BuyController: " + e.toString());
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
