<%-- 
    Document   : user
    Created on : Sep 25, 2024, 4:51:21 PM
    Author     : hoadnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="includes/header.jsp" %>
<section class="text-center text-lg-start">
    <style>
        #user-form {
            margin-top: 160px; 
            margin-bottom: 100px;
            padding: 20px;
            background-color: #f8f9fa; /* Light background for contrast */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }
        h1 {
            color: #333; /* Darker color for the heading */
        }
        .user-info {
            font-size: 1.2em; /* Slightly larger font for user info */
            color: #555; /* Gray color for text */
            margin: 10px 0; /* Spacing between lines */
        }
    </style>
    <div class="card" id="user-form">
        <h1>Hello User: ${sessionScope.LOGIN_USER.fullName}</h1>
        <div class="user-info">User ID: ${sessionScope.LOGIN_USER.userID}</div>
        <div class="user-info">Full Name: ${sessionScope.LOGIN_USER.fullName}</div>
        <div class="user-info">Role ID: ${sessionScope.LOGIN_USER.roleID}</div>
        <div class="user-info">Password: ***</div>
    </div>
</section>
<%@include file="includes/footer.jsp" %>
