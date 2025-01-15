<%-- 
    Document   : forgotPassword
    Created on : Oct 25, 2024, 6:28:06 AM
    Author     : baolee baha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="includes/header.jsp"%>
    <title>Forgot Password</title>
</head>
<body>
    <%@include file="includes/navbar.jsp"%>

    <div class="container" style="margin-top: 100px;">
        <h3>Forgot Password</h3>
        <form action="MainController" method="POST">
            <div class="mb-3">
                <label for="userID" class="form-label">Enter your userID</label>
                <input type="text" class="form-control" name="userID" id="userID" required />
            </div>
            <div class="mb-3">
                <label for="newPassword" class="form-label">Enter new password</label>
                <input type="password" class="form-control" name="newPassword" id="newPassword" required />
            </div>
            <button type="submit" name="action" value="ForgotPassword" class="btn btn-primary">Reset Password</button>
        </form>
        <p style="color: red">${requestScope.ERROR}</p>
        <p style="color: green">${requestScope.SUCCESS}</p>
    </div>

    <%@include file="includes/footer.jsp"%>
</body>
</html>