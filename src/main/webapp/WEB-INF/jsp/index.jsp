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

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3 text-light"><spring:message code="headline_app_title"/></h1>
            <p class="text-light"><spring:message code="app_description"/></p>
            <p><a class="btn btn-outline-light btn-lg" href="#" role="button"><spring:message code="button_detail"/> &raquo;</a></p>
        </div>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <c:if test="${MESSAGE_CODE_REGISTRATION != null}">
            <jsp:include page="blocks/_alert_registration_success.jsp"/>
        </c:if>

        <c:if test="${MESSAGE_CODE_ARTICLE != null}">
          <%--  <c:if test="${MESSAGE_CODE_ARTICLE ==1}"><jsp:include page="blocks/_alert_article_success.jsp"/></c:if>--%>
            <c:if test="${MESSAGE_CODE_ARTICLE ==2}"><jsp:include page="blocks/_alert_article_delete.jsp"/></c:if>
        </c:if>

        <c:if test="${MESSAGE_CODE_GRAPH != null}">
            <jsp:include page="blocks/_alert_graph_success.jsp"/>
        </c:if>

        <%--<div class="row">--%>
            <%--&lt;%&ndash;            <div class="col-md-4">--%>
                            <%--<h2><spring:message code="article_category"/></h2>--%>
                            <%--<c:forEach items="${topics}" var="categ">--%>
                                <%--<spring:url value="/articles/topics/{categoryId}" var="articleCategoryUrl">--%>
                                    <%--<spring:param name="categoryId" value="${categ.id}"/>--%>
                                <%--</spring:url>--%>
                                <%--<li class="collection-item"><a href="${fn:escapeXml(articleCategoryUrl)}"><c:out value="${categ.name}"/></a></li>--%>
                            <%--</c:forEach>--%>
                        <%--</div>&ndash;%&gt;--%>
            <%--<div class="col-md-6">--%>
                <%--<h2>Heading</h2>--%>
                <%--<p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa--%>
                    <%--justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>--%>
                <%--<p><a class="btn btn-secondary" href="#" role="button"><spring:message code="button_detail"/> &raquo;</a></p>--%>
            <%--</div>--%>
            <%--<div class="col-md-6">--%>
                <%--<h2>Heading</h2>--%>
                <%--<p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce--%>
                    <%--dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>--%>
                <%--<p><a class="btn btn-secondary" href="#" role="button"><spring:message code="button_detail"/> &raquo;</a></p>--%>
            <%--</div>--%>
        <%--</div>--%>

    <%--</div> <!-- /container -->--%>

    <div class="container">
        <div class="col l8 article-listing">
            <jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder"/>
            <%--pagination works relatively to current URL--%>
            <c:url value="${requestScope['javax.servlet.forward.request_uri']}" var="pagedLink">
                <c:param name="p" value="~"/>
            </c:url>
            <c:if test="${fn:length(pagedListHolder.pageList) eq 0}">
                <p><spring:message code="no_articles_found"/></p>
            </c:if>
            <c:forEach items="${pagedListHolder.pageList}" var="article">
                <div class="card bg-light mb-3">
                    <div class="card-header">${article.topic.name}</div>
                    <div class="card-img-top">
                        <img src="/resources/images/original/${article.images[0].uuid}.jpg" alt=""/>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">${article.name}</h5>
                        <p class="card-text">
                                <%--If the description is longer than a certain value, abbreviation is applied--%>
                            <c:set var="desc" value="${article.text}"/>

                            <c:choose>
                                <c:when test="${fn:length(desc) > 150}">
                                    <c:out value="${fn:substring(desc,0,150)}"/>...
                                </c:when>

                                <c:otherwise>
                                    <c:out value="${article.text}"/>
                                </c:otherwise>
                            </c:choose>
                            <br/>
                            <span class=""><spring:message code="article_last_edited"/> <fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle="medium"
                                                                                                        timeStyle="medium"
                                                                                                        value="${article.timestamp}"/></span>
                        </p>

                        <spring:url value="/articles/{articleId}" var="articleUrl">
                            <spring:param name="articleId" value="${article.id}"/>
                        </spring:url>
                        <a href="${fn:escapeXml(articleUrl)}" class="btn btn-primary"><spring:message code="button_show_article"/></a>

                    </div>
                </div>

            </c:forEach>
            <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}"></tg:paging>

        </div>
    </div>
</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>