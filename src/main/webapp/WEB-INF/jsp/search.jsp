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

    <%--pokud se nic nenalezlo pak tohle--%>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">

                    <jsp:useBean id="pagedListHolder" scope="request"
                                 type="org.springframework.beans.support.PagedListHolder"/>
                    <%--pagination works relatively to current URL--%>
                    <c:url value="${requestScope['javax.servlet.forward.request_uri']}" var="pagedLink">
                        <c:param name="p" value="~"/>
                    </c:url>
                    <c:if test="${fn:length(pagedListHolder.pageList) eq 0}">
                        <p>Zadne clanky nebyly nalezeny.</p>
                    </c:if>
                    <c:forEach items="${pagedListHolder.pageList}" var="article">
                </h5>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="card">
            <h5 class="card-header">

                    <spring:url value="/articles/{articleId}" var="articleUrl">
                        <spring:param name="articleId" value="${article.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(articleUrl)}"><c:out value="${article.name}"/></a>

            </h5>
            <div class="card-body">
                <h5 class="card-title">
                    <c:out value="${article.topic.name}"/>
                </h5>
                <p class="card-text">
                            <%--If the text is longer than a certain value, abbreviation is applied--%>
                        <c:set var="desc" value="${article.text}"/>

                        <c:choose>
                            <c:when test="${fn:length(desc) > 150}">
                                <b>Text:</b> <c:out value="${fn:substring(desc,0,150)}"/>...
                            </c:when>

                            <c:otherwise>
                                <b>Text:</b> <c:out value="${article.text}"/>
                            </c:otherwise>
                        </c:choose>

                <span> <img
                        src="/articleImage/imageDisplay?articleId=${article.id}"
                        alt=""/></span>

                <br/>Last edited: <fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle="medium" timeStyle="medium"
                                                  value="${article.timestamp}"/>
                <p>
                    <a href="${fn:escapeXml(articleUrl)}" class="btn btn-primary">Detail</a>
                </p>

                </p>
            </div>

            </c:forEach>
            <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}"></tg:paging>

        </div>
    </div>
    
</main>

<jsp:include page="template_footer.jsp"/>

</body>
</html>

