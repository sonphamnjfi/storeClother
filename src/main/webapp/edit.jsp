<%--
  Created by IntelliJ IDEA.
  User: sonph
  Date: 11-12-2021
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit customer</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<div class="container col-md-5">
    <div class="card">
        <div class="card-body">
            <form action="editacc" method="get">
                <caption>
                    <h2 style="text-align:center" >Edit Custumer</h2>
                </caption>
                <fieldset class="form-group">
                <label>Username</label>
                    <input type="text" value="${a.username}" class="form-control" name="us" required="required" readonly>
                </fieldset>
                <fieldset class="form-group">
                    <label>Name</label>
                    <input type="text" value="${a.name}" class="form-control" name="name" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Phone</label>
                    <input type="text" value="${a.phone}" class="form-control" name="phone" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Address</label>
                    <input type="text" value="${a.address}" class="form-control" name="address" required="required">
                </fieldset>
                <input type="hidden" name="password" class="form-control" value="${a.pass}" required="required">

                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>

