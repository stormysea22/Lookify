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
        <h1>Edit Song</h1>
        <form:form action="/songs/${song.id}/update" method="post" modelAttribute="song">
            <input type="hidden" name="_method" value="put">
            <p>
                <form:label path="title">Title</form:label>
                <form:errors path="title" />
                <form:input path="title" />
            </p>
            <p>
                <form:label path="artist">Artist</form:label>
                <form:errors path="artist" />
                <form:textarea path="artist" />
            </p>
            <p>
                <form:label path="rating">Rating</form:label>
                <form:errors path="rating" />
                <form:input type="number" path="rating" />
            </p>
            <input type="submit" value="Submit" />
        </form:form>
    </div>
</body>

</html>