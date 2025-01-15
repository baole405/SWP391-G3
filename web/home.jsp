<%-- 
    Document   : home
    Created on : Oct 22, 2024, 7:24:38 PM
    Author     : baolee baha
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.*"%>
<%@page import="utils.DBUtils"%>
<%@page import="dao.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="includes/header.jsp"%>
<style>
    .centered-heading {
        text-align: center;
        margin-top: 20px; 
        margin-bottom: 20px;
        color: blue;
    }
    .btn-black {
        background-color: black;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
    }

    .btn-black:hover {
        background-color: #333; /* Màu đen nhạt hơn khi hover */
        color: #ddd;
    }
</style>
<fmt:setLocale value="vi_VN"/>
<div id="carouselBanner" class="carousel slide " data-mdb-ride="carousel" data-mdb-carousel-init>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img/banner1.jpg" class="d-block w-100" alt=""/>
        </div>
        <div class="carousel-item">
            <img src="img/banner2.jpg" class="d-block w-100" alt=""/>
        </div>
        <div class="carousel-item">
            <img src="img/banner3.jpg" class="d-block w-100" alt=""/>
        </div>
    </div>
    <button
        class="carousel-control-prev"
        type="button"
        tabindex="0"
        data-mdb-slide="prev"
        data-mdb-target="#carouselBanner"
        >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    </button>
    <button
        class="carousel-control-next"
        type="button"
        tabindex="0"
        data-mdb-slide="next"
        data-mdb-target="#carouselBanner"
        >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
    </button>
</div>
<section>
    
    <h1 style="text-align: center" class="my-5">Chào mừng đến với Bảo's Shoes</h1>
    
<div class="container">
    <div class="card-header my-3"></div>    
    <div class="row">
        <c:if test="${not empty productList}">
            <c:forEach var="p" items="${productList}">
                <div class="col-md-3 my-3">
                    <div class="card w-100">
                        <img class="card-img-top" src="${p.img}" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">${p.name}</h5>
                            <h6 class="price">Price: ${p.price}$</h6>
                            <h6 class="category">Quantity: ${p.quantity}</h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a class="btn btn-primary" href="shopping.jsp">Shopping Now</a> 
                                <a class="btn btn-black" href="shopping.jsp">Buy Now</a>

                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty productList}">
            <div class=" text-center">
                <a href="MainController?action=GetAllProducts" class="btn btn-primary">Nhấn vào để xem sản phẩm</a>
            </div>
        </c:if>
        <br/>

    </div>
</div>

<div class="row container-fluid mt-5 " style="margin-bottom: 100px">
    <div class="col-md-4 text-center">
        <h4>Giao hàng tận nơi</h4>
        <i class="fas fa-box fa-4x"></i>
    </div>

    <div class="col-md-4  text-center">
        <h4>Đảm bảo sản phẩm còn nguyên mới</h4>
        <i class="fas fa-hand-holding-heart fa-4x"></i>

    </div>

    <div class="col-md-4  text-center">
        <h4>Bảo hành một tháng</h4>
        <i class="fas fa-face-grin-hearts fa-4x"></i>
    </div>
</div>
</section>
<%@include file="includes/footer.jsp"%>
