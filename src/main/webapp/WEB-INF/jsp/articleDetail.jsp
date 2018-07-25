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

        <c:if test="${MESSAGE_CODE_ARTICLE != null}">
            <c:if test="${MESSAGE_CODE_ARTICLE == 1}"><jsp:include page="blocks/_alert_article_success.jsp"/></c:if>
        </c:if>

        <h1>${article.name}</h1>


        <div class="col l8 article-listing">
            <p class="text-justify">${article.text}</p>

            <b><spring:message code="article_images"/></b><br>
            <c:forEach items="${article.images}" var="image">
                <a href="/resources/images/original/${image.uuid}.jpg" ><img
                        src="/resources/images/resampled/${image.uuid}.jpg"
                        width=auto height="150" alt=""/>
                </a>
            </c:forEach>

            <p><b><spring:message code="article_author"/></b>
                <spring:url value="/users/{userId}" var="userUrl">
                    <spring:param name="userId" value="${article.user.id}"/>
                </spring:url>
                <a href="${fn:escapeXml(userUrl)}"><c:out value="${article.user.username}"/></a><br>
                <fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle="medium" timeStyle="medium"
                                value="${article.timestamp}"/><br>
            </p>

            <h3><spring:message code="article_comments"/></h3>
            <c:forEach items="${comments}" var="comment">
                <p>
                    <spring:url value="/users/{userId}" var="userUrl">
                        <spring:param name="userId" value="${comment.author.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(userUrl)}"><c:out value="${comment.author.username}"/></a>
                    <fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle="medium" timeStyle="medium"
                                    value="${comment.postDate}"/><br>
                    <c:out value="${comment.commentText}"/><br>


                <%--<spring:url value="/articles/{articleId}/{commentId}" var="articleCommentUrl">--%>
                    <%--<spring:param name="articleCommentId" value="${comment.id}"/>--%>
                <%--</spring:url>--%>
                    <c:url var="deleteCommentUrl" value="/articles/delete/${article.id}/${comment.id}"/>
                    <form:form action="${deleteCommentUrl}" method="POST">

                    <button type="submit" class="btn btn-primary" onClick="return confirm('Opravdu smazat?')"><spring:message code="button_delete_comment"/></button>

                    </form:form>
                </p>
            </c:forEach>

            <p>
        </div>
    </div>
    <div class="container">
        <form:form method="POST" modelAttribute="addComment">
            <fieldset>
                <sec:authorize access="isAuthenticated()">
                <div class="input-field">
                    <label class="bmd-label-floating"><spring:message code="comment_field_placeholder"/></label>
                    <form:textarea path="commentText" class="form-control" required="true"/>

                </div>
                <div class="clearfix">

                    <button type="submit" class="btn btn-primary"><spring:message code="button_add_comment"/></button>

                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                        <span class="red-text"><spring:message code="comment_form_disabled"/></span>
                    </sec:authorize>
                </div>
            </fieldset>
        </form:form>
    </div>
    <div class="container">

        <sec:authorize access="isAuthenticated()">
            <c:if test="${hasPermission eq true}">
                <spring:url value="/articles/{articleId}/edit" var="editArticle">
                    <spring:param name="articleId" value="${article.id}"/>
                </spring:url>

                <a class="btn btn-primary" href="${fn:escapeXml(editArticle)}"><spring:message code="edit_article"/></a>
            </c:if>
        </sec:authorize>
    </div>
</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>