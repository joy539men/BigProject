<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Image Upload</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<div>
    <nav class="navbar navbar-expand-lg bg-success">
        <div class="container-fluid">
            <p style="color:white">Uploading Image File</p>
        </div>
    </nav>

    <div class="container">

        <form action="/pillowSurfing/imageUpload" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-md-6 offset-md-3 mt-4">
                    <div>
                        <p style="color:forestgreen" class="mt-4"><c:out value="${msg}" /></p>
                        <input type="file" name="img" class="form-control" required>
                    </div>

                    <div class="text-center mt-4">
                        <button class="btn btn-primary">Upload Image</button>
                        <%-- <a href="<c:url value='/viewAllImages' />" class="btn btn-primary" style="margin-left: 20px;">View All Images</a> --%>
                        <a class="col-primary" href="<c:url value="/viewAllImages"></c:url>">View All Images</a><br>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
    