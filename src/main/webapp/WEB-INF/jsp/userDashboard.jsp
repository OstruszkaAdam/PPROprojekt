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
        <h1><spring:message code="headline_user_profile"/></h1>

        <table class="table table-striped table-hover">
            <tbody>
            <tr>
                <th scope="col"><spring:message code="username"/></th>
                <td>${user.username}</td>
            </tr>
            <tr>
                <th scope="col"><spring:message code="first_name"/></th>
                <td>${user.firstname}</td>
            </tr>
            <tr>
                <th scope="col"><spring:message code="last_name"/></th>
                <td>${user.surname}</td>
            </tr>
            <tr>
                <th scope="col"><spring:message code="email"/></th>
                <td>${user.email}</td>
            </tr>
            <tr>
                <th scope="col"><spring:message code="phone"/></th>
                <td>${user.phone}</td>
            </tr>
            <tr>
                <th scope="col"><spring:message code="registration_date"/></th>
                <td><fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle="medium" timeStyle="medium" value="${user.creationTime}"/></td>
            </tr>
            </tbody>
        </table>
        <h3><spring:message code="user_articles"/></h3>
        <a href="<spring:url value="/articles/new" />" class="btn btn-primary"><spring:message code="button_new_article"/></a>

        <div class="table-responsive ">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th scope="col"><spring:message code="article_headline"/></th>
                    <c:if test="${isLoggedUsersProfile}">
                        <th scope="col"><spring:message code="article_actions"/></th>
                    </c:if>
                </tr>
                </thead>

                <c:forEach items="${articles}" var="article">
                    <spring:url value="/articles/{articleId}" var="articleUrl">
                        <spring:param name="articleId" value="${article.id}"/>
                    </spring:url>
                    <tr>
                        <td><a href="${fn:escapeXml(articleUrl)}"><c:out value="${article.name}"/></a></td>
                            <%--Logged in user can edit or delete his articles--%>
                        <c:if test="${isLoggedUsersProfile}">
                            <spring:url value="/articles/{articleId}/edit" var="editArticle">
                                <spring:param name="articleId" value="${article.id}"/>
                            </spring:url>
                            <td><a class="btn btn-primary" href="${fn:escapeXml(editArticle)}"><spring:message code="action_edit"/></a></td>

                            <c:url var="deleteUrl" value="/articles/${article.id}/delete"/>
                            <td><form:form action="${deleteUrl}" method="POST">
                                <input id="articleId" name="articleId" type="hidden" value="<c:out value="${article.id}"/>"/>
                                <%--TODO Vymenit hlasku v potvrzovacim okne za string ze souboru Messages--%>
                                <button type="submit"  class="btn btn-primary" onClick="return confirm('Opravdu smazat?')"><spring:message code="action_delete"/></button>
                                <%--TODO Rozjet modalni okno template_model_window--%>
                                <%-- <input type="submit" class="btn btn-primary" value="Delete"  data-toggle="modal" data-target="#exampleModal"/>--%>
                            </form:form></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
            
        </div>
    </div>

</main>

<jsp:include page="template_footer.jsp"/>
</body>
</html>