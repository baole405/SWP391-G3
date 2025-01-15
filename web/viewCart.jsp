<%-- 
    Document   : viewCart
    Created on : Oct 12, 2024, 4:07:25 PM
    Author     : hoadnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/header.jsp" %>
        <title>View Cart Page</title>
    </head>
    <style>
        .checkout-button {
            display: block;
            width: 100%;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            padding: 15px;
            font-size: 1rem;
            text-decoration: none;
            border-radius: 8px;
            margin-top: 20px;
        }
        .order-summary {
        max-width: 400px;
        margin: auto;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        background-color: #f8f9fa;
    }
    </style>
    <body>
        <%@include file="includes/navbar.jsp" %>
        <c:if test="${sessionScope.CART ne null}">
            <c:if test="${not empty sessionScope.CART.cart}">
                <div class="container">
                    <div class="card-header my-3"><h1 style="color: blue"  >${sessionScope.LOGIN_USER.fullName}'s product</h1></div>
                    <table class="table table-light">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Id</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Edit</th>
                                <th>Buy</th>
                                <th>Remove</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="totalPrice" value="0"/>
                            <c:forEach var="product" items="${sessionScope.CART.cart.values()}" varStatus="counter">
                                <tr>
                            <form action="MainController" method="POST">
                                <td>${counter.count}</td>
                                <td>
                                    ${product.id}
                                    <input type="hidden" name="id" value="${product.id}"/>
                                </td>
                                <td>${product.name}</td>
                                <td>${product.price}</td>
                                <td>
                                    <input type="number" name="quantity" value="${product.quantity}" required="" min="1"/>
                                </td>
                                <td>${product.price * product.quantity}</td>
                                <!--edit-->
                                <td>
                                    <input type="submit" name="action" value="Edit"/>
                                </td>
                                <!--Buy-->
                                <td>
                                    <input type="submit" name="action" value="Buy"/>
                                    <input type="hidden" name="productId" value="${product.id}"/>
                                </td>
                                <!--Remove-->
                                <td>
                                    <input type="submit" name="action" value="Remove"/>
                                </td>
                            </form>
                            </tr>
                            <c:set var="totalPrice" value="${totalPrice + (product.price * product.quantity)}" />
                        </c:forEach>
                        </tbody>

                    </table>
                    <div class="container my-5">
                        <div class="order-summary">
                            <form action="MainController" method="POST"> 
                                <button type="submit" name="action" value="CheckOut" class="checkout-button">Check out</button>
                            </form></div>
                    </div>
                    <div class="col text-left"> 
                        <a href="shopping.jsp">Not Enough?</a>
                    </div>        
                    <div class="col text-left">
                        <h1>Total: ${totalPrice}$</h1>
                    </div>
                </div>
            </c:if>
        </c:if>
        <c:if test="${empty cart}">
            <div class="text-center"><h3>Nothing here</h3>
                <div class="col text-left"> 
                    <a href="shopping.jsp">Buy Now</a>
                </div>
            </div>
        </c:if>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
