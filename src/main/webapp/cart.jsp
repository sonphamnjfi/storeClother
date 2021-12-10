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
                    <li class="nav-item"><a class="nav-link " href="cart?id=${ac.username}">Cart</a></li>
                    <li class="nav-item dropdown justify-content-end">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrops"  data-toggle="dropdown">
                            ${ac.username}
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="formeditacc">Edit Account</a>
                            <a class="dropdown-item" href="editpass">Edit Password</a>
                            <a class="dropdown-item" href="logout">Log Out</a>
                        </div>
                    </li>
                </ul>

            </div>
        </div>
    </nav>

<table class="table table-bordered">
    <thead>
    <tr>
        <th>Name</th>
        <th>Price</th>
        <th>Amount</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="p" items="${listp}">
        <tr>
            <td><c:out value="${p.name}" /></td>
            <td><c:out value="${p.price}" /></td>
            <td><c:out value="${p.size}" /></td>
                <a href="delete?id=${p.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p>${total}</p>
</body>
</html>