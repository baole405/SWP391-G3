/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

/**
 *
 * @author hoadnt
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    private static final String ERROR="shopping.jsp";
    private static final String SUCCESS="shopping.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= ERROR;
        try {
            String shoeList= request.getParameter("shoeList");
            String[] tmp= shoeList.split("-");
            String id= tmp[0];
            String name= tmp[1];
            double price= Double.parseDouble(tmp[2]);
            int quantity= Integer.parseInt(request.getParameter("quantity"));
            HttpSession session= request.getSession();
            if(session!= null){
                Cart cart= (Cart) session.getAttribute("CART");
                if(cart== null){
                    cart= new Cart();
                }
                Product product= new Product(id, name, price, quantity);
                boolean check= cart.add(id, product);
                if(check){
                    session.setAttribute("CART", cart);
                    request.setAttribute("MESSAGE", "Added "+ name+", quantity= "+ quantity);
                    url= SUCCESS;
                } 
            }
        } catch (Exception e) {
            log("erro at AddController: "+ e.toString());
        }finally{
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
