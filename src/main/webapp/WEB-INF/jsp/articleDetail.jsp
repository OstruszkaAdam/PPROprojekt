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
    <title>DimaApplication</title>
</head>

<body>
<jsp:include page="template_menu.jsp"/>

<main role="main">

    <div class="container">
        <h1>Detaily clanku</h1>
        <p>
        <h2>${article.name}</h2>
        <p><b>Description:</b> ${article.description}</p>
        <p><b>Location:</b> ${article.location}</p>
        <p><b>Price:</b> ${article.price}</p>
        <b>Pictures:</b><br>
        <c:forEach items="${article.images}" var="image">
            <a href="/resources/images/original/${image.uuid}.jpg" ><img src="/resources/images/resampled/${image.uuid}.jpg" width="200" height="150" alt=""/>
            </a>
        </c:forEach>
        </p>
        <p><b>Pridano uzivatelem</b>:
            <spring:url value="/users/{userId}" var = "userUrl">
                <spring:param name="userId" value="${article.user.id}"/>
            </spring:url>
            <a href="${fn:escapeXml(userUrl)}"><c:out value="${article.user.username}"/></a><br>
            <fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle = "medium" timeStyle = "medium" value = "${article.timestamp}" /><br>
        </p>
        </p>

        <h3>Komentare:</h3>
        <c:forEach items="${comments}" var="comment">
            <p>
                <spring:url value="/users/{userId}" var = "userUrl">
                    <spring:param name="userId" value="${comment.author.id}"/>
                </spring:url>
                <a href="${fn:escapeXml(userUrl)}"><c:out value="${comment.author.username}"/></a>
                <fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle = "medium" timeStyle = "medium" value = "${comment.postDate}" /><br>
                <c:out value="${comment.commentText}"/><br>
            </p>
        </c:forEach>

        <p>
            <form:form method="POST" modelAttribute="addedComment">
        <fieldset>
            <div class="input-field">
                <label class="bmd-label-floating">Zde muzete napsat komentar</label>
                <form:textarea path="commentText" class="form-control" required ="true" />
            </div>
            <div class="clearfix">
                <sec:authorize access="isAuthenticated()">
                    <button type="submit" class="btn btn-primary" >Přidat komentar</button>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <button type="submit" class="btn btn-primary" disabled>Přidat komentar</button><br>
                    <span class="red-text">Komentovat mohou pouze prihlaseni uzivatele.</span>
                </sec:authorize>
            </div>
        </fieldset>
        </form:form>
        </p>
    </div>
</main>

<jsp:include page="template_footer.jsp"/>
</body>
</html>