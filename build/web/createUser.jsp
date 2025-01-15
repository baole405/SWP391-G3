<%-- 
    Document   : createUser
    Created on : Oct 9, 2024, 3:07:14 PM
    Author     : hoadnt
--%>

<%@page import="models.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="includes/header.jsp" %>
<section class=" text-center text-lg-start">
    <style>
        .rounded-t-5 {
            border-top-left-radius: 0.5rem;
            border-top-right-radius: 0.5rem;
        }

        @media (min-width: 992px) {
            .rounded-tr-lg-0 {
                border-top-right-radius: 0;
            }

            .rounded-bl-lg-5 {
                border-bottom-left-radius: 0.5 rem;
            }
            #loginform {
                margin-top: 200px; 
                margin-bottom: 200px;
            }
        }
    </style>
    <div class="card" id="loginform">
        <div class="row g-0 d-flex align-items-center">
            <div class="col-lg-3"></div>
            <div class="col-lg-2 d-none d-lg-flex">
                <img src="img/createUser.jpg" alt="Img"
                     class="w-100 rounded-t-5 rounded-tr-lg-0 rounded-bl-lg-5" />
            </div>
            <div class="col-lg-4">
                <div class="card-body py-5 px-md-5 ">
                    <form action="MainController" method="POST">

                        <div data-mdb-input-init class="form-outline mb-4">
                            <input class="form-control" type="text" name="userID" required="" /><p style="color: red">${requestScope.USER_ERROR.userIDError}</p>
                            <label class="form-label" >User ID</label>
                        </div>
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input class="form-control" type="text" name="fullName" required=""/><p style="color: red">${requestScope.USER_ERROR.fullNameError}</p>
                            <label class="form-label" >Full Name</label>
                        </div>
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input class="form-control" type="text" name="roleID" value="US"readonly=""/>
                        </div>
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input class="form-control" type="password" name="password" required=""/>
                            <label class="form-label" >Password</label>
                        </div>
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input class="form-control" type="password" name="confirm" required=""/><p style="color: red">${requestScope.USER_ERROR.confirmError}</p>
                            <label class="form-label" >Confirm</label>
                        </div>

                        <div class="text-center">
                            <button class="btn btn-primary btn-block" type="submit" name="action" value="Create">Create</button><p style="color: red">${requestScope.USER_ERROR.error}</p>
                        </div>  
                        <div class="col text-center">Đã có tài khoản ?
                            <a href="login.jsp">Login </a>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</section>  
<%@include file="includes/footer.jsp" %>