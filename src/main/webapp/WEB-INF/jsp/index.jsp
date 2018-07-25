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

<main role="main" class="index">


    <div id="jumbotron">
        <div class="container">
            <div class="jumbotron-text">
                <h1 class="display-3 text-light"><spring:message code="headline_app_title"/></h1>
                <p><spring:message code="app_description"/></p>
                <%--<p class="text-light"><spring:message code="app_description"/></p>--%>
                <a class="btn btn-outline-light btn-lg" href="/articleLatest" role="button"><spring:message code="button_detail"/> &raquo;</a>
            </div>
        </div>
    </div>


    <div class="container">
        <!-- Example row of columns -->
        <c:if test="${MESSAGE_CODE_REGISTRATION != null}">
            <jsp:include page="blocks/_alert_registration_success.jsp"/>
        </c:if>

        <c:if test="${MESSAGE_CODE_ARTICLE != null}">
            <%--  <c:if test="${MESSAGE_CODE_ARTICLE ==1}"><jsp:include page="blocks/_alert_article_success.jsp"/></c:if>--%>
            <c:if test="${MESSAGE_CODE_ARTICLE ==2}">
                <jsp:include page="blocks/_alert_article_delete.jsp"/>
            </c:if>
        </c:if>

        <c:if test="${MESSAGE_CODE_GRAPH != null}">
            <jsp:include page="blocks/_alert_graph_success.jsp"/>
        </c:if>
    </div>
</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>