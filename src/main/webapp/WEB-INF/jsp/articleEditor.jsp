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
        <h1><spring:message code="headline_add_or_edit_article"/></h1>

        <c:if test="${MESSAGE_CODE_ARTICLE ==0}">
            <jsp:include page="_alert_article_error.jsp"/>
        </c:if>

        <form:form method="POST" modelAttribute="articleDto" enctype="multipart/form-data">
            <fieldset>
                <div class="form-group">
                    <label class="bmd-label-floating"><b>Name</b></label>
                    <form:input path="name" class="form-control" type="text" required="true"/>
                </div>

                <div class="form-group">
                    <label class="bmd-label-floating"><b><spring:message code="article_topic"/></b></label>
                    <form:select name="topic" class="form-control" path="topic">
                        <c:forEach items="${topics}" var="temata">
                            <form:option value="${temata.name}"/>
                        </c:forEach>
                    </form:select>
                </div>

                <div class="form-group">
                    <label class="bmd-label-floating"><b><spring:message code="article_text"/></b></label>
                    <form:textarea path="text" class="form-control" required="true"/>
                </div>

                <div class="form-group">
                    <label class="bmd-label-floating"><spring:message code="article_images"/></label>
                    <form:input path="mpf" type="file" class="form-control-file" multiple="true"/>
                </div>
                <div class="clearfix"></div>

                <a class="btn btn-outline-secondary" role="button" href='<spring:url value="/" htmlEscape="true"/>'><spring:message code="button_cancel"/></a>
                <button type="submit" class="btn btn-primary btn-raised" role="button"><spring:message code="button_publish_article"/></button>

            </fieldset>
        </form:form>

    </div>

</main>

<jsp:include page="_footer.jsp"/>
</body>
</html>