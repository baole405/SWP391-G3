<%-- 
    Document   : orders
    Created on : Oct 26, 2024, 9:10:24 AM
    Author     : baolee baha
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <title>Order Page</title>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>
        <div class="container">
            <div class="card-header my-3"><h2>Order of ${sessionScope.LOGIN_USER.fullName}</h2></div>
            <table class="table table-light">
                <thead>
                    <tr>
                        <th>ID</th>
                        <!-- <th>Product Name</th> -->
                        <th>Date</th>
                        <th>Total</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                     <c:set var="totalPrice" value="0"/>
                    <c:forEach var="order" items="${orderList}">
                        <tr>
                            <td>${order.orderID}</td>
                            <!-- <td>${product.name}</td> -->
                            <td>${order.date}</td>
                            <td><fmt:formatNumber value="${product.price * product.quantity}" type="currency" currencySymbol="$"/></td>
                            <td>
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="orderID" value="${order.orderID}">
                                    <input type="submit" name="action" value="Cancel Order" class="btn btn-danger btn-sm">
                                </form>
                            </td>
                        </tr>
                        <c:set var="totalPrice" value="${totalPrice + (product.price * product.quantity)}" />
                    </c:forEach>
                </tbody>
            </table>
            <div class="col text-right">
                <h3>Total Orders: <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="$"/></h3>
            </div>
        </div>
    </body>
</html>
<%@include file="includes/footer.jsp" %>
