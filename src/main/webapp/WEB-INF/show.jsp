<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <h1>Songs Details about ${showSong.title}</h1>

    <p>Artist:
        <c:out value="${showSongs.artist}" />
    </p>
    <p>Rating:
        <c:out value="${showSong.rating}" />
    </p>
    <a href="/songs/${showSong.id}/edit">Edit Song</a> | <a href="/songs/${showSong.id}/delete">Delete Song</a>
</body>

</html>