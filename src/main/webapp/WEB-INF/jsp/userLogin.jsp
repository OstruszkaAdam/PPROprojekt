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
    <link type="text/css" rel="stylesheet" href="/resources/css/login.css"/>
    <title><spring:message code="app_title_browser"/></title>
</head>


<body class="text-center">
<jsp:include page="template_menu.jsp"/>
<form class="form-signin" method="POST" action="<c:url value='/login'/>">
    <%--<img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">--%>
    <h1 class="h3 mb-3 font-weight-normal"><spring:message code="headline_login"/></h1>


    <label for="inputUsername" class="sr-only"><spring:message code="username"/></label>
    <input name="username" type="text" id="inputUsername" class="form-control" placeholder="<spring:message code="username"/>" required autofocus>

    <label for="inputPassword" class="sr-only"><spring:message code="password"/></label>

    <input name="password" type="password" id="inputPassword" class="form-control" placeholder="<spring:message code="password"/>" required>

<%--
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
    </div>
--%>

    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

    <button class="btn btn btn-raised btn-lg btn-primary btn-block" type="submit"><spring:message code="button_login"/></button>
        <a href="/">
            <button type="button" class="btn btn-outline-secondary btn-lg btn-block"><spring:message code="button_cancel"/></button>
        </a>


    <%--    <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>--%>


</form>
</body>
</html>


<%--


        <form method="POST" action="<c:url value='/login'/>">
            <div class="form-group bmd-form-group">
                <label for="formGroupExampleInput2" class="bmd-label-floating"><spring:message code="username"/></label>
                <input name="username" type="text" class="form-control" id="formGroupExampleInput2">
            </div>

            <div class="form-group">
                <label for="exampleInputPassword1" class="bmd-label-floating"><spring:message code="password"/></label>
                <input name="password" type="password" class="form-control" id="exampleInputPassword1">
            </div>

            <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
            <a href="/"> <button type="button"  class="btn btn-default"><spring:message code="button_cancel"/></button></a>
            <button type="submit" class="btn btn-primary btn-raised"><spring:message code="button_login"/></button>
        </form>
--%>
