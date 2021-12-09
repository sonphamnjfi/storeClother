<%--
  Created by IntelliJ IDEA.
  User: sonph
  Date: 01/12/2021
  Time: 12:07 AM
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
                    <label>ID Code</label> <input type="text" value="${ac.username}" class="form-control" name="us" required="required" readonly>
                </fieldset>
                <fieldset class="form-group">
                    <label>Code Name</label> <input type="text" value="${ac.name}" class="form-control" name="name" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Total</label> <input type="text" value="${ac.phone}" class="form-control" name="phone" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Discount</label> <input type="text" value="${ac.adress}" class="form-control" name="adress" required="required">
                </fieldset>

                <fieldset class="form-group">
                    <label>Password</label> <input type="hidden" name="password" class="form-control" value="${ac.pass}" required="required">
                </fieldset>

                <button type="submit" class="btn btn-success">Save</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
