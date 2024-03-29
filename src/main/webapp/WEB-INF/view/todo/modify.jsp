<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024-01-24
  Time: 오전 5:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">Navbar</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                            <a class="nav-link" href="#">Features</a>
                            <a class="nav-link" href="#">Pricing</a>
                            <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="row content">
        <div class="col">
            <div class="card">
                <div class="card-body">
                    <form action="/todo/modify" method="post">
                        <input type="hidden" name="page" value="${pageRequestDTO.page}">
                        <input type="hidden" name="size" value="${pageRequestDTO.size}">
                    <div class="input-group mb-3">
                        <span class="input-group-text">TNO</span>
                        <input type="text" name="tno" class="form-control" value="<c:out value="${dto.tno}"/>" readonly>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Title</span>
                        <input type="text" name="title" class="form-control" value="<c:out value="${dto.title}"/>" >
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">DueDate</span>
                        <input type="date" name="dueDate" class="form-control" value="<c:out value="${dto.dueDate}"/>">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Writer</span>
                        <input type="text" name="writer" class="form-control" value="<c:out value="${dto.writer}"/>" readonly>
                    </div>

                    <div class="form-check">
                        <label class="form-chec-label">
                            Finished &nbsp;
                        </label>
                        <input class="form-check-input" type="checkbox" name="finished" ${dto.finished?"checked":""} />
                    </div>
                        <div class="my-4">
                            <div class="float-end">
                                <button type="button" class="btn btn-danger">Remove</button>
                                <button type="button" class="btn btn-primary">Modify</button>
                                <button type="button" class="btn btn-secondary">List</button>
                            </div>
                        </div>

                    </form>
                        <script>
                            const formObj = document.querySelector("form")
                            document.querySelector(".btn-danger").addEventListener("click", function (e){
                                e.preventDefault()
                                e.stopPropagation()
                                formObj.action ="/todo/remove"
                                formObj.method ="post"
                                formObj.submit()
                            }, false)
                            document.querySelector(".btn-primary").addEventListener("click", function (e){
                                e.preventDefault()
                                e.stopPropagation()

                                formObj.action ="/todo/modify"
                                formObj.method ="post"
                                formObj.submit()
                                }, false)
                            document.querySelector(".btn-secondary").addEventListener("click", function (e){

                                e.preventDefault()
                                e.stopPropagation()

                                self.location = `/todo/list?${pageRequestDTO.link}`
                            },false)
                        </script>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row footer">
        <div class="row fixed-bottom" style="z-index: -100">
            <footer class="py-1 my-1">
                <p class="text-center text-muted">Footer</p>
            </footer>
        </div>
    </div>
    content
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
