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
        <h1><spring:message code="headline_articles_on_topic"/> <c:out value="${topicName}"/></h1>

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
                            <span class=""><spring:message code="article_last_edited"/> <fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle="medium" timeStyle="medium"
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

<jsp:include page="template_footer.jsp"/>
</body>
</html>