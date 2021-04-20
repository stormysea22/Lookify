<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Lookify</title>
    <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>

<body>
    <div class="container">
        <h1>Top Ten Songs</h1>
        <a href="/dashboard">Dashboard</a>
        <ol>
            <c:forEach items="${top}" var="top">
                <li>
                    <h4>${top.rating}- <a href="/songs/${top.id}">${top.title}</a>-${top.artist}</h4>
                </li>
            </c:forEach>
        </ol>
    </div>
</body>

</html>