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
        <a href="/songs/new">Add New</a>
        <a href="/search/topten">Top Songs</a>
        <form:form action="/search" method="post" modelAttribute="songTitle">
            <form:input type="text" path="artist" />
            <button class="btn btn-outline-dark " type="submit">Search Artist</button>
        </form:form>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">Title</th>
                    <th scope="col">Artist</th>
                    <th scope="col">Rating</th>
                    <th scope="col">Actions</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach items='${ allSongs }' var='song'>
                    <tr>
                        <td><a href="/songs/${song.id}"></a>${song.title}</a></td>
                        <td>${song.artist}</td>
                        <td>${song.rating}</td>
                        <td><a href="/songs/${song.id}/edit">Edit</a> | <a href="/songs/${song.id}/delete">Delete</a>
                        </td>
                    </tr>

                </c:forEach>
            </tbody>
        </table>
    </div>
</body>

</html>