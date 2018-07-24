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
    <jsp:include page="_header.jsp"/>
    <title><spring:message code="app_title_browser"/></title>
</head>

<body>
<jsp:include page="_menu.jsp"/>

<main role="main">

    <div class="container">
        <div class="col-md-4">
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
                <a href="/"> <button type="button"  class="btn btn-outline-secondary"><spring:message code="button_cancel"/></button></a>
                <button type="submit" class="btn btn-primary btn-raised"><spring:message code="button_login"/></button>
            </form>
        </div>
    </div>
</main>

<jsp:include page="_footer.jsp"/>
</body>
</html>