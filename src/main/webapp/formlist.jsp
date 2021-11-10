<%--
  Created by IntelliJ IDEA.
  User: sonph
  Date: 11/1/2021
  Time: 9:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Code Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark"
         style="background-color: tomato">
        <div>
            <h3  class="navbar-brand"> Code Management </h3>
        </div>

        <ul class="navbar-nav">
            <li><a href="list" class="nav-link" >Codes</a></li>
            <li>
                <a href="newpass" class="nav-link text-right">Change Pass</a>
                <a href="logout" class="nav-link text-right">Log out</a>
                <input type="hidden" value="<c:out value='${us}' />" class="form-control" name="us" readonly>
            </li>
        </ul>
    </nav>
</header>
<br>

<div class="row">
    <div class="container">
        <h3 class="text-center">List of Codes</h3>
        <hr>
        <div class="container text-left">
            <a href="new" class="btn btn-success">Add New Code</a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Total</th>
                <th>Discount</th>
                <th>Begin</th>
                <th>End</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="code" items="${listcode}">
                <tr>
                    <td><c:out value="${code.id}" /></td>
                    <td><c:out value="${code.name}" /></td>
                    <td><c:out value="${code.total}" /></td>
                    <td><c:out value="${code.discount}" /></td>
                    <td><c:out value="${code.begin}" /></td>
                    <td><c:out value="${code.end}" /></td>
                    <td><a href="edit?id=<c:out value='${code.id}' />">Edit  </a>
                        <a href="delete?id=<c:out value='${code.id}' />">Delete</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

