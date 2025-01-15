<%-- 
    Document   : login
    Created on : Sep 25, 2024, 4:51:07 PM
    Author     : hoadnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="includes/header.jsp" %>
<section class=" text-center text-lg-start">    
    <style>
        .rounded-t-5 {
            border-top-left-radius: 0.5rem;
            border-top-right-radius: 0.5rem;
        }

        @media (min-width: 1000px) {
            .rounded-tr-lg-0 {
                border-top-right-radius: 0;
            }

            .rounded-bl-lg-5 {
                border-bottom-left-radius: 0.5rem;
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
                <img src="img/shoeLogin.jpg" alt="Img"
                     class="w-100 rounded-t-5 rounded-tr-lg-0 rounded-bl-lg-5" />
            </div>
            <div class="col-lg-4">
                <div class="card-body py-5 px-md-5 ">

                    <form action="MainController" method="POST">

                        <div data-mdb-input-init class="form-outline mb-4">
                            <input class="form-control" type="text" name="userID" required=""/>
                            <label class="form-label">User ID</label>
                        </div>
                        <p style="color: red">${requestScope.ERROR}</p>
                        <div data-mdb-input-init class="form-outline mb-4">
                            <input class="form-control" type="password" name="password" required=""/>
                            <label class="form-label">Password</label>
                        </div>
                        <div class="col text-center">
                            <a href="forgotPassword.jsp">Forgot Password ?</a>  
                            <a href="login.jsp">Reset</a>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-primary btn-block" type="submit" name="action" value="Login">Đăng nhập </button>
<!--                            <input class="btn btn-primary" type="reset" value="Reset" />-->
                        </div>
                        <div class="col text-center">Chưa có tài khoản ?
                            <a href="createUser.jsp">Tạo tài khoản tại đây</a>
                        </div>


                    </form>
                </div>
            </div>
        </div>
    </div>

</section>   
<%@include file="includes/footer.jsp" %>
