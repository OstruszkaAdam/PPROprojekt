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
        <h1><spring:message code="headline_graph_editor"/></h1>

        <form:form method="POST" modelAttribute="graphDto" enctype="multipart/form-data">
            <fieldset>
                <div class="form-group">
                    <label class="bmd-label-floating"><b><spring:message code="graph_name"/></b></label>
                    <form:input path="name" class="form-control" type="text" required="true"/>
                </div>

                <div class="form-group">
                    <label class="bmd-label-floating"><spring:message code="graph_file"/></label>
                    <form:input path="mpf" type="file" accept=".js" class="form-control-file" multiple="true"/>
                    <%--The accept attribute of the input tag is not supported in Internet Explorer 9 (and earlier versions), and Safari 5 (and earlier).--%>
                </div>

                <a class="btn btn-outline-secondary" role="button" href='<spring:url value="/" htmlEscape="true"/>'><spring:message code="button_cancel"/></a>
                <button type="submit" class="btn btn-primary btn-raised" role="button"><spring:message code="button_upload"/></button>

            </fieldset>
        </form:form>
    </div>
</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>
