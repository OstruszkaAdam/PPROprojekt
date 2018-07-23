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
    <jsp:include page="template_header.jsp"/>
    <title><spring:message code="app_title_browser"/></title>
</head>

<body>
<jsp:include page="template_menu.jsp"/>

<main role="main">
    <div class="container">
        <h1>Oops, něco se pokazilo!</h1> <br>
        <div class="text-center">
        <img src="http://thinkspace.com/wp-content/uploads/2014/01/404.png">
        </div>
        <br><br>
        <a href="/" class="btn btn-large"><spring:message code="error_back_to_index"/></a>
    </div>


</main>

<jsp:include page="template_footer.jsp"/>
</body>
</html>