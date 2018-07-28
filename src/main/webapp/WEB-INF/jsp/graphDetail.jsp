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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cytoscape/3.2.15/cytoscape.js"></script>
    <script src='/resources/graphs/uploaded/${graph.name}.js'></script>
    <script src='/resources/graphs/graphView.js'></script>
</head>

<body>
<jsp:include page="blocks/_menu.jsp"/>

<main role="main">
    <div class="container">

        <!--==========================
            Zobrazeni upozorneni
        ============================-->
        <c:if test="${MESSAGE_CODE_GRAPH != null}">
            <c:if test="${MESSAGE_CODE_GRAPH == 1}">
                <jsp:include page="blocks/_alert_graph_success.jsp"/>
            </c:if>
        </c:if>

        <!--==========================
            Zobrazeni grafu
        ============================-->
        <h1>${graph.name}</h1>

        <p class="text-justify text-long">${graph.description}</p>

        <div class="col-md-12 graph-fullscreen" id="cy"></div>


    </div>
</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>