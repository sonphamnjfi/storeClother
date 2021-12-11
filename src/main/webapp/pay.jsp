<%--
  Created by IntelliJ IDEA.
  User: sonph
  Date: 11-12-2021
  Time: 14:14
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
<%--navbar--%>
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
                        ${sessionScope.username}
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
<div class="px-4 px-lg-0">
    <div class="pb-5">
        <div class="container">
            <div class="row py-5 p-4 bg-white rounded shadow-sm">
                <div class="col-lg-12">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold " style="text-align: center">Hoá đơn</div>
                    <div class="p-4">
                        <ul class="list-unstyled mb-4">
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tên khách hàng</strong><strong>${sessionScope.ac.name}</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Số điện thoại</strong><strong>${sessionScope.ac.phone}</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Địa chỉ</strong><strong>${sessionScope.ac.address}</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                                <h5 class="font-weight-bold">${total} ₫</h5>
                            </li>
                            <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold " style="color: orangered; text-align: center">ĐẶT HÀNG THÀNH CÔNG</div>
                        </ul><a href="done" class="btn btn-dark rounded-pill py-2 btn-block">Đóng</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>