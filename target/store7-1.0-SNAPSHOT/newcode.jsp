<%--
  Created by IntelliJ IDEA.
  User: sonph
  Date: 11/1/2021
  Time: 9:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
            <li><a href="list" class="nav-link">Codes</a></li>
        </ul>
    </nav>
</header>
<br>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
                <form action="add" method="get">
                    <caption>
                        <h2 style="text-align:center" >ADD NEW CODE</h2>
                    </caption>

                    <fieldset class="form-group">
                        <label>ID Code</label> <input type="text" class="form-control" name="idcode" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Code Name</label> <input type="text" class="form-control" name="name" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Total</label> <input type="text" class="form-control" name="total" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Discount</label> <input type="text" class="form-control" name="dis" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Begin</label> <input type="Date" class="form-control" name="begin" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>End</label> <input type="Date" class="form-control" name="end" required="required">
                    </fieldset>

                    <button type="submit" class="btn btn-success">Save</button>
                </form>
        </div>
    </div>
</div>
</body>
</html>

