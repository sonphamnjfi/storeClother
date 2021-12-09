<%--
  Created by IntelliJ IDEA.
  User: sonph
  Date: 01/12/2021
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="editpass" method="get">
                <caption>
                    <h2 style="text-align:center" >Reset pass</h2>
                </caption>
                <fieldset class="form-group">
                    <label>Username</label>
                    <input type="text" value="<c:out value='${us}' />" class="form-control" name="us" required="required" readonly>
                </fieldset>
                <fieldset class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="pass" required="required">
                </fieldset>
                <fieldset class="form-group">
                    <label>New Password</label>
                    <input type="password" class="form-control" name="newpass" required="required">
                </fieldset>
                <fieldset class="form-group">
                    <label>Nhap lai Password</label>
                    <input type="password" class="form-control" name="newpass1" required="required">
                </fieldset>
                <p class="text-danger">${mess}</p>
                <button type="submit" class="btn btn-success">Reset</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
