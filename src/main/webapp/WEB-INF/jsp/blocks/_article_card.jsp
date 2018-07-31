<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="card bg-light mb-3">
    <%--<div class="card-img-top">
        <img src="/resources/images/original/${article.images[0].uuid}.jpg" alt=""/>
    </div>--%>
    <div class="card-body">
        <h5 class="card-title">${article.name}</h5>
        <p class="card-text">
            <%--If the description is longer than a certain value, abbreviation is applied--%>
            <c:set var="desc" value="${fn:escapeXml(article.text)}"/>

            <c:choose>
                <c:when test="${fn:length(desc) > 150}">
                    <c:out value="${fn:substring(desc,0,150)}"/>...
                </c:when>

                <c:otherwise>
                    <c:out value="${fn:escapeXml(article.text)}"/>
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