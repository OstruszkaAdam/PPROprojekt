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

        <!--==========================
            Zobrazeni upozorneni
        ============================-->
        <c:if test="${MESSAGE_CODE_ARTICLE != null}">
            <c:if test="${MESSAGE_CODE_ARTICLE == 1}">
                <jsp:include page="blocks/_alert_article_success.jsp"/>
            </c:if>
        </c:if>

        <!--==========================
            Nastroje pro spravu clanku
        ============================-->
        <h1>${article.name}</h1>
        <div class="col l8 article-listing">
            

            <sec:authorize access="isAuthenticated()">
                <c:if test="${hasPermission eq true}">
                    <div class="row">
                        <div class="col-md-6">
                            <p>
                                <b><spring:message code="article_author"/></b>
                                <spring:url value="/users/{userId}" var="userUrl">
                                    <spring:param name="userId" value="${article.user.id}"/>
                                </spring:url>
                                <b><a href="${fn:escapeXml(userUrl)}"><c:out value="${article.user.username}"/></a></b>
                                <span class="text-muted"><fmt:formatDate pattern="dd. MM. yyyy HH:mm" value="${article.timestamp}"/></span><br>
                            </p>
                        </div>
                        <div class="col-md-6">
                            <spring:url value="/articles/{articleId}/edit" var="editArticle">
                                <spring:param name="articleId" value="${article.id}"/>
                            </spring:url>
                            <a class="btn btn-outline btn-primary float-right" href="${fn:escapeXml(editArticle)}"><spring:message code="edit_article"/></a>

                        </div>
                    </div>
                </c:if>
            </sec:authorize>


            <!--==========================
                Zobrazeni clanku
            ============================-->

            <p class="text-justify text-long">${article.text}</p>

            <c:if test="${not empty article.images[0]}">
                <%--pokud neexistuje prvni obrazek, neexistujou asi ani dalsi a neni potreba blok obrazku zobrazovat
                neni to asi idealni zpusob, ale funguje to--%>
                <%--<p class="text-justify text-long">${article.images.size()}</p>--%>
                <b><spring:message code="article_images"/></b><br>
                <c:forEach items="${article.images}" var="image">
                    <a href="/resources/images/original/${image.uuid}.jpg">
                        <img src="/resources/images/resampled/${image.uuid}.jpg"
                             width=auto height="150" alt=""/>
                    </a>
                </c:forEach>
            </c:if>


            <!--==========================
                Vypis komentaru
            ============================-->
            <h3 class="comment-section"><spring:message code="article_comments"/></h3>

            <%-- vypis vsech komentaru--%>
            <c:forEach items="${comments}" var="comment">
                <div class="row">
                    <div class="col-md-1">
                        <img src="/resources/images/ui/baseline-account_circle.svg" width=auto height="60px" alt=""/>
                    </div>
                    <div class="col-md-7">
                        <spring:url value="/users/{userId}" var="userUrl">
                            <spring:param name="userId" value="${comment.author.id}"/>
                        </spring:url>
                        <b><a href="${fn:escapeXml(userUrl)}"><c:out value="${comment.author.username}"/></a></b>
                        <span class="text-muted"><fmt:formatDate pattern="dd. MM. yyyy HH:mm" value="${comment.postDate}"/></span>
                        <p class="text-justify"><c:out value="${comment.commentText}"/></p><br>
                    </div>

                        <%-- tlacitko pro smazani komentare--%>
                    <sec:authorize access="isAuthenticated()">
                        <div class="col-md-4">
                            <c:url var="deleteCommentUrl" value="/articles/delete/${article.id}/${comment.id}"/>
                            <form:form action="${deleteCommentUrl}" method="POST">

                                <button type="submit" class="btn btn-outline btn-primary float-right" onClick="return confirm('Opravdu smazat?')"><spring:message
                                        code="button_delete_comment"/></button>

                            </form:form>
                        </div>
                    </sec:authorize>

                </div>
            </c:forEach>


        </div>
    </div>

    <!--==========================
        Pridani komentare
    ============================-->
    <div class="container">

        <sec:authorize access="isAuthenticated()">
            <form:form method="POST" modelAttribute="addComment">
                <fieldset>
                    <div class="form-row align-items-center">
                        <div class="col-md-7">
                            <label class="bmd-label-floating"><spring:message code="comment_field_placeholder"/></label>
                            <form:textarea path="commentText" class="form-control mb-2" id="inlineFormInput" required="true"/>
                        </div>
                        <div class="col-auto">
                            <button type="submit" class="btn btn-outline btn-primary"><spring:message code="button_add_comment"/></button>
                        </div>
                    </div>
                </fieldset>
            </form:form>
        </sec:authorize>


        <sec:authorize access="isAnonymous()">
            <span class="red-text"><spring:message code="comment_form_disabled"/></span>
        </sec:authorize>

    </div>
</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>