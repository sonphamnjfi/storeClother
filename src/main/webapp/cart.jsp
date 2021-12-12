<%--
  Created by IntelliJ IDEA.
  User: sonph
  Date: 09-12-2021
  Time: 23:36
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
    <script src="https://azvang.com/vendor/notify/notify.js"></script>
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
            <div class="row">
                <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">
                    <div class="table-responsive">
                        <table class="table" >
                            <thead>
                            <tr>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="p-2 px-3 text-uppercase">Sản Phẩm</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2 text-uppercase">Đơn Giá</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2 text-uppercase">Số Lượng</div>
                                </th>
                                <th scope="col" class="border-0 bg-light">
                                    <div class="py-2 text-uppercase">Xóa</div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listp}" var="o">
                                <tr>
                                    <th scope="row">
                                        <div class="p-2">
                                            <div class="ml-3 d-inline-block align-middle">
                                                <h5 class="mb-0">
                                                    <a href="#" class="text-dark d-inline-block">${o.name}</a></h5>
                                                <span class="text-muted font-weight-normal font-italic"></span>
                                            </div>
                                        </div>
                                    </th>
                                    <td class="align-middle"><strong>${o.price}</strong></td>
                                    <td class="align-middle"><strong>${o.size}</strong></td>
                                    <!-- <td><a href="delete?id=${o.id}">Delete</a></td> -->
                                    <td><button class="btn btn-sm btn-danger" onclick="fRemove(this, ${o.id})"><span class="fas fa-trash-alt"></span></button></td>
                                    </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row py-5 p-4 bg-white rounded shadow-sm">
                <div class="col-lg-6">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thông tin khách hàng</div>
                    <div class="p-4">
                        <div class="input-group mb-8 ">
                            <fieldset class="form-group col-lg-12">
                                <label>Name</label>
                                <input type="text" value="${sessionScope.ac.name}" class="form-control " name="name" required="required" >
                            </fieldset>
                            <fieldset class="form-group col-lg-12">
                                <label>Phone</label>
                                <input type="text" value="${sessionScope.ac.phone}" class="form-control" name="phone" required="required">
                            </fieldset>
                            <fieldset class="form-group col-lg-12">
                                <label>Address</label>
                                <input type="text" value="${sessionScope.ac.address}" class="form-control" name="address" required="required">
                            </fieldset>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Thành tiền</div>
                    <div class="p-4">
                        <ul class="list-unstyled mb-4">
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng tiền hàng</strong><strong class="total">${total}</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Phí vận chuyển</strong><strong>Free ship</strong></li>
                            <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Tổng thanh toán</strong>
                                <h5 class="font-weight-bold total">${total} ₫</h5>
                            </li>
                        </ul><a href="pay" class="btn btn-dark rounded-pill py-2 btn-block">Mua hàng</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    function fRemove(t, id){
        var tr = $(t).parent().parent();
        $.ajax({
            url: "delete?id=" + id,
            type: "get",
            success: function(res){
                $(".total").html(res);
                $.notify("Xóa khỏi giỏ hàng thành công", {
                    className: "success",
                    position: "top-right"
                });
                tr.html("");
            }
        })
    }
</script>
<script src="https://doinick.com/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>