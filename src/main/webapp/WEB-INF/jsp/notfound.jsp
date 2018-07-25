<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
    <jsp:include page="blocks/_header.jsp"/>
    <title><spring:message code="app_title_browser"/></title>
</head>

<body>
<jsp:include page="blocks/_menu.jsp"/>

<main role="main">

    <div class="container">
        <h1><spring:message code="headline_error"/></h1>
        <div class="text-center">
            <br>
            <a href="/" class="btn btn-outline-primary btn-large"><spring:message code="button_back_to_homepage"/></a>
            <br><br>
            <img src="http://thinkspace.com/wp-content/uploads/2014/01/404.png">
            <br><br>
        </div>

    </div>

</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>