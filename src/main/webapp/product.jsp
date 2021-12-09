<%--
  Created by IntelliJ IDEA.
  User: sonph
  Date: 09-12-2021
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Store</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="home">Store Clother</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                    <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                    <li class="nav-item"><a class="nav-link " href="cart">Cart</a></li>
                    <li class="nav-item dropdown justify-content-end">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrops" data-toggle="dropdown">
                            ${ac.username}
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="editacc">Edit Account</a>
                            <a class="dropdown-item" href="editpass">Edit Password</a>
                            <a class="dropdown-item" href="logout">Log Out</a>
                        </div>
                    </li>
                </ul>

            </div>
        </div>
    </nav>
</header>
<div class="container">
    <div class="row">
            <div class="col-md-6">
                <img src="${p.description}" >
                <div>
                    <div class="panel-heading">${p.name}</div>
                    <p>${p.size}</p>
                    <div class="row">
                        <div class="col-md-6">
                            <p class="btn btn-danger">${p.price}</p>
                        </div>
                        <div class="col-md-6">
                            <a href="addcart?id=${p.id}&username=${ac.username}" class="btn btn-success ">Add to cart</a>
                        </div>

                    </div>
                </div>
            </div>
    </div>
</div>
</body>
</html>
