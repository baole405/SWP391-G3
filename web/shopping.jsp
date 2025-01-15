<%-- 
    Document   : shopping
    Created on : Oct 12, 2024, 3:28:58 PM
    Author     : hoadnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="includes/header.jsp" %>
<section class=" text-center text-lg-start">
    <style>
        #shopping-form{
            margin-top: 160px; 
            margin-bottom: 200px;
        }
    </style>
    <div class="card" id="shopping-form">
        <div class="container">
            <div class="card-header my-3"><h1>${sessionScope.LOGIN_USER.fullName}'s Cart</h1></div>
            <div class="card-body my-3 ">          
                <form action="MainController">
                    Name: <select name="shoeList">
                        <option value="T001-Bitis-100">Bitis-200$</option>
                        <option value="T002-Adidas-500">Adidas-150$</option>
                        <option value="T003-Thuong Dinh-400">Thuong Dinh-50$</option>
                        <option value="T005-BirkenStock-500">BirkenStock-500$</option>
                        <option value="T006-Crocs-20">Crocs-20$</option>
                        <option value="T007-Prada-2000">Prada-2000$</option>
                        <option value="T008-Puma-120">Puma-120$</option>
                        <option value="T009-Reebok-90">Reebok-90$</option>
                        <option value="T0010-New Balance-110">New Balance-110$</option>
                        

                    </select>

                    <select name="quantity">
                        <option value="1">1 items</option>
                        <option value="2">2 items</option>
                        <option value="3">3 items</option>
                        <option value="4">4 items</option>
                        <option value="5">5 items</option>
                        <option value="10">10 items</option>
                        <option value="20">20 items</option>
                    </select>
                    <input type="submit" name="action" value="Add"/>
            </div>
            <a href="viewCart.jsp">View Your Cart</a>

            </form>

        </div>
        ${requestScope.MESSAGE}

    </div>
</section>
<%@include file="includes/footer.jsp" %>
