<%-- 
    Document   : admin
    Created on : Sep 25, 2024, 4:51:30 PM
    Author     : hoadnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="includes/header.jsp" %>
<section class=" text-center text-lg-start">
    <style>
        #admin-form{
            margin-top: 160px; 
            margin-bottom: 200px;
        }
    </style>
    <div class="card" id="admin-form">
        Welcome:<h1>${sessionScope.LOGIN_USER.fullName}</h1>

        <c:url var="logoutlink" value="MainController">
            <c:param name="action" value="Logout"></c:param>
        </c:url>
        <a href="${logoutlink}">Logout</a>
        <form action="MainController">
            Search:<input type="text" name="search" value="${param.search}"/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <p style="color: red">${requestScope.ERROR}</p>

        <c:if test="${requestScope.LIST_USER ne null}">
            <c:if test="${not empty requestScope.LIST_USER}">
                <div class="container">
                    <div class="card-header my-3">Result:</div>
                    <table class="table table-light">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>User ID</th>
                                <th>Full Name</th>
                                <th>Password</th>
                                <th>Role ID</th>
                                <th>Update</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${requestScope.LIST_USER}" varStatus="counter">
                            <form action="MainController" method="POST">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>
                                        <input type="text" name="userID" value="${user.userID}" readonly=""/>
                                    </td>
                                    <td>
                                        <input type="text" name="fullName" value="${user.fullName}" required=""/>
                                    </td>
                                    <td>${user.password}</td>
                                    <td>
                                        <input type="text" name="roleID" value="${user.roleID}" required=""/>
                                    </td>
                                    <td>
                                        <input type="submit" value="Update" name="action" />
                                        <input type="hidden" name="search" value="${param.search}"/>
                                    </td>
                                    <td>
                                        <c:url var="deleteLink" value="MainController">
                                            <c:param name="action" value="Delete"></c:param>
                                            <c:param name="userID" value="${user.userID}"></c:param>
                                            <c:param name="search" value="${param.search}"></c:param>
                                        </c:url>
                                        <a href="${deleteLink}">Delete</a>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                ${requestScope.MESSAGE}
            </c:if>
        </c:if>
    </div>
</section>
<%@include file="includes/footer.jsp" %>
