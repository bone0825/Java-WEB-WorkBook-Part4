<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024-01-24
  Time: 오전 4:27
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
<%--    검색 파트--%>
    <div class="row content">
        <div class="col">
            <div class="card-body">
                <h5 class="card-title">Search</h5>
                <form action="/todo/list" method="get">
                    <input type="hidden" name="size" value="${pageRequestDTO.size}">
                    <div class="mb-3">
                        <input type="checkbox" name="finished" ${pageRequestDTO.finished?"checked":""}> 완료여부
                    </div>
                    <div class="mb-3">
                        <input type="checkbox" name="types" value="t" ${pageRequestDTO.checkType("t")?"checked":""}> 제목
                        <input type="checkbox" name="types" value="w" ${pageRequestDTO.checkType("w")?"checked":""}> 작성자
                        <input type="text" name="keyword" class="form-control" value='<c:out value="${pageRequestDTO.keyword}"/> '>
                    </div>
                    <div class="input-group mb-3 dueDateDiv">
                        <input type="date" name="from" class="form-control" value="${pageRequestDTO.from}">
                        <input type="date" name="to" class="form-control" value="${pageRequestDTO.to}">
                    </div>
                    <div class="input-group mb-3 dueDateDiv">
                        <div class="input-group mb-3">
                            <div class="float-end">
                                <button class="btn btn-primary" type="submit" id="search-input">Search</button>
                                <button class="btn btn-info clearBtn" type="reset">Clear</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row content">
        <div class="col">
            <div class="card">
                <h5 class="card-header">Featured</h5>
                <div class="card-body">
                    <h5 class="card-title">Special title treatment</h5>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Tno</th>
                            <th scope="col">Title</th>
                            <th scope="col">Writer</th>
                            <th scope="col">DueDate</th>
                            <th scope="col">Finished</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${responseDTO.dtoList}" var="dto">
                            <tr>
                                <th scope="row"><c:out value="${dto.tno}"/></th>
                                <td>
                                    <a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration-none" data-tno="${dto.tno}">
                                        <c:out value="${dto.title}"/>
                                    </a>
                                </td>
                                <td><c:out value="${dto.writer}"/></td>
                                <td><c:out value="${dto.dueDate}"/></td>
                                <td><c:out value="${dto.finished}"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="float-end">
                        <nav aria-label="...">
                            <ul class="pagination">
                                <c:if test="${responseDTO.prev}">
                                <li class="page-item">
                                    <a class="page-link" data-num="${responseDTO.start -1}">Previous</a>
                                </li>
                                </c:if>
                                <c:forEach begin="${responseDTO.start}" end="${responseDTO.end}" var="num">
                                    <li class="page-item ${responseDTO.page == num ? "active": ""}">
                                        <a class="page-link" data-num="${num}">${num}</a>
                                    </li>
                                </c:forEach>
                                <c:if test="${responseDTO.next}">
                                    <li class="page-item">
                                        <a class="page-link" data-num="${responseDTO.end+1}">Next</a>
                                    </li>
                                </c:if>
                            </ul>
                        </nav>
                            <button type="button" class="btn btn-primary" id="regist-button">Regist Todo</button>
                    </div>
                    <script>
                        document.getElementById("regist-button").addEventListener("click",function (e){
                            e.preventDefault()
                            e.stopPropagation()

                            self.location = "/todo/register"
                        })
                        document.querySelector(".pagination").addEventListener("click",function(e){
                            e.preventDefault()
                            e.stopPropagation()
                            const target = e.target
                            if(target.tagName != 'A'){
                                return
                            }
                            const num = target.getAttribute("data-num")

                            self.location = `/todo/list?page=\${num}`
                        },false)
                        document.querySelector(".clearBtn").addEventListener("click",function (e){
                            e.preventDefault()
                            e.stopPropagation()

                            self.location =`/todo/list`
                        })
                    </script>
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
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>