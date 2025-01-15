/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.OrderDAO;
import models.UserDTO;
import java.util.List;
import models.Order;

/**
 *
 * @author baolee baha
 */
@WebServlet(name = "CancelOrderController", urlPatterns = {"/CancelOrderController"})
public class CancelOrderController extends HttpServlet {
    private static final String ERROR = "orders.jsp";
    private static final String SUCCESS = "orders.jsp";
    private static final Logger log = Logger.getLogger(CancelOrderController.class.getName());

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            int orderID = Integer.parseInt(request.getParameter("orderID"));
            OrderDAO orderDAO = new OrderDAO();
            boolean checkCancel = orderDAO.cancelOrder(orderID);
            if (checkCancel) {
                request.setAttribute("MESSAGE", "Order cancelled successfully");
                // Refresh the order list
                String userID = ((UserDTO) request.getSession().getAttribute("LOGIN_USER")).getUserID();
                List<Order> orderList = orderDAO.getOrdersByUserID(userID);
                request.setAttribute("orderList", orderList);
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR", "Failed to cancel order");
            }
        } catch (Exception e) {
            log("Error at CancelOrderController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
