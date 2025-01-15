
<!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shoe Town</title>
        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css""
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.3.2/mdb.min.css"
            rel="stylesheet"
            />
        <!--<link href="css/newcss.css" rel="stylesheet" />-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menucss.css" rel="stylesheet" />
        <link href="css/home.css" rel="stylesheet" />
        <style></style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-light  fixed-top"  style="background-color: #DEEBF3;">
            <div class="container">
                <!-- Brand -->
                <div style="    
                     height: 100px;
                     width: 100px;
                     border-radius: 50%;
                     background-color: #8ba39f52;
                     position: relative;
                     ">
                    <a class="navbar-brand me-auto" href="MainController?action=Home" style="position: absolute;top: 15%; right: 15%;">
                        <img
                            src="img/sneakerLogo.png"
                            height="60"
                            alt="Logo"
                            loading="lazy"
                            />
                    </a>
                </div>

                <div class="collapse navbar-collapse justify-content-evenly " id="navbarToggler">

                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="MainController?action=GetAllProducts">Collection</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="login.jsp">Login</a>
                        </li>
                        <c:url var="logoutlink" value="MainController">
                            <c:param name="action" value="Logout"></c:param>
                        </c:url>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="${logoutlink}">Logout</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="viewCart.jsp">Cart</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="orders.jsp">Order</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a
                                data-mdb-dropdown-init
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="navbarDropdown"
                                role="button"
                                aria-expanded="false"
                                >Discount
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li>
                                    <span class="dropdown-item" >SALE OFF</span>
                                </li>
                                <li><hr class="dropdown-divider" /></li>
                                <li>
                                    <a class="dropdown-item" href="#">10%</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">20%</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href="#">30%</a>
                                </li>                               
                            </ul>           
                        </li>

                    </ul>

                    <div class="d-flex input-group w-auto" action="viewCart.jsp"  method="post">
                        <input
                            id="searchInput"
                            type="text"
                            name="txt"
                            class="form-control"
                            placeholder="Search"
                            aria-label="Search"
                            oninput="searchByName(this)"
                            />
                        <button
                            data-mdb-ripple-init
                            class="btn btn-outline-primary"
                            type="button"   
                            data-mdb-ripple-color="dark"
                            >
                            Search
                        </button>
                    </div>
                </div>

                <div class="d-flex align-items-center ">
                    <t:Avatar></t:Avatar>

                </div>

            </div>
        </nav>
