<%--
  Created by IntelliJ IDEA.
  User: sonph
  Date: 01-12-2021
  Time: 13:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Store</title>
    <link rel="icon" href="https://doinick.com/image/nro1sao.png">
    <link href="https://doinick.com/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://doinick.com/css/main.css" rel="stylesheet" type="text/css">
    <script src="https://doinick.com/vendor/jquery/jquery.min.js"></script>
    <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
    <link href="https://doinick.com/css/nick.css" rel="stylesheet" type="text/css">
    <script src="https://azvang.com/vendor/notify/notify.js"></script>

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
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrops"  data-toggle="dropdown">
                            ${sessionScope.ac.username}
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="edit">Edit Account</a>
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
    <h2 class="text-center" style="margin-top: 100px">DANH SÁCH ÁO</h2>
    <hr style="width: 10%; height: 2px" class="bg-info">
    <div class="alert alert-info mt-2 mb-2">
        Cửa hàng đang ưu đãi giảm giá áo <span class="text-danger font-weigth-bold">30%</span>
    </div>
    <div class="row">
        <c:forEach items="${listP}" var="o" varStatus="loop">
            <c:if test="${loop.index < 6}">
            <div class="col-md-3 col-6" id="card-item" style="padding-right: 5px; padding-left: 5px">
                <a href="product?id=${o.id}" style="text-decoration" >
                    <input type="hidden" value="${o.id}" name="id" >
                    <div class="card mb-3 box-shadow" style="color: black">
                        <img class="card-img-top" src="${o.description}" alt="">
                        <div class="card-body text-center">
                            <p class="card-text font-weight-bold font-weight-bolder text-warning">${o.name}</p>
                            <p class="text-center">Giá: ${o.price}đ</p>
                            <a href="javascript:void(0);" class="btn btn-info form-control" onclick="fAddCard(this, ${o.id})"><i class='fas fa-shopping-cart'></i> Thêm vào giỏ hàng</a>
                        </div>
                    </div>
                </a>
            </div>
            </c:if>
        </c:forEach>
    </div>

    <h2 class="text-center  mt-4">DANH SÁCH QUẦN</h2>
    <hr style="width: 10%; height: 2px" class="bg-info">
    <div class="alert alert-info mt-2 mb-2">
        Cửa hàng đang ưu đãi giảm giá quần <span class="text-danger font-weigth-bold">30%</span>
    </div>
    <div class="row">
        <c:forEach items="${listP}" var="o" varStatus="loop">
            <c:if test="${loop.index >= 6}">
                <div class="col-md-3 col-6" id="card-item" style="padding-right: 5px; padding-left: 5px">
                    <a href="product?id=${o.id}" style="text-decoration">
                        <input type="hidden" value="${o.id}" name="id" >
                        <div class="card mb-3 box-shadow" style="color: black">
                            <img class="card-img-top" src="${o.description}" alt="">
                            <div class="card-body text-center">
                                <p class="card-text font-weight-bold font-weight-bolder text-warning">${o.name}</p>
                                <p class="text-center">Giá: ${o.price}đ</p>
                                <a href="javascript:void(0);" class="btn btn-info form-control" onclick="fAddCard(this, ${o.id})"><i class='fas fa-shopping-cart'></i> Thêm vào giỏ hàng</a>
                            </div>
                        </div>
                    </a>
                </div>
            </c:if>
        </c:forEach>
    </div>

    <!--
    <div class="row">
        <c:forEach items="${listP}" var="o">
            <div class="col-4">
                <img style="width:75% ; height:75%;" src="${o.description}" >
                <div>
                    <a class="panel-heading" href="product?id=${o.id}" title="view product">${o.name}</a>
                    <input type="hidden" value="${o.id}" name="id" >
                    <div class="row">
                        <div class="col-md-6">
                            <p class="btn btn-danger">${o.price}</p>
                        </div>
                        <div class="col-md-6">
                            <a href="addcart?id=${o.id}" class="btn btn-success ">Add to cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    -->
</div>
<script>
    function fAddCard(t, id){
        $.ajax({
            url: "addcart?id=" + id,
            type: "get",
            success: function(res){
                $.notify($(t), "Thêm vào giỏ hàng thành công", {
                    className: "success",
                    position: "top-center"
                });
            }
        })
    }
</script>
<script src="https://doinick.com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
