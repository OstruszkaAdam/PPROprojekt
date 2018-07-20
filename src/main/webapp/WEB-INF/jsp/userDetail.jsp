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
        <h1>Profil uzivatele</h1>

        <table class="table table-striped table-hover">
            <tbody>
            <tr>
                <th scope="col">Uzivatelske jmeno:</th>
                <td>${user.username}</td>
            </tr>
            <tr>
                <th scope="col">Jmeno:</th>
                <td>${user.firstname}</td>
            </tr>
            <tr>
                <th scope="col">Prijmeni:</th>
                <td>${user.surname}</td>
            </tr>
            <tr>
                <th scope="col">Email:</th>
                <td>${user.email}</td>
            </tr>
            <tr>
                <th scope="col">Telefon:</th>
                <td>${user.phone}</td>
            </tr>
            <tr>
                <th scope="col">Datum registrace:</th>
                <td><fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle="medium" timeStyle="medium" value="${user.creationTime}"/></td>
            </tr>
            </tbody>
        </table>
        <h3>Clanky uzivatele:</h3>

        <div class="table-responsive ">
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <th scope="col">Nadpis clanku</th>
                    <c:if test="${isLoggedUsersProfile}">
                        <th scope="col">Moznosti</th>
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
                            <td><a class="btn btn-primary" href="${fn:escapeXml(editArticle)}">Edit</a></td>

                            <c:url var="deleteUrl" value="/articles/${article.id}/delete"/>
                            <td><form:form action="${deleteUrl}" method="POST">
                                <input id="articleId" name="articleId" type="hidden" value="<c:out value="${article.id}"/>"/>
                                <input type="submit" class="btn btn-primary" value="Delete" onClick="return confirm('Opravdu smazat?')"/>
                                <%-- <input type="submit" class="btn btn-primary" value="Delete"  data-toggle="modal" data-target="#exampleModal"/>--%>
                            </form:form></td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>

            <h3>Hodnoceni uzivatele:</h3>
            <c:forEach items="${ratings}" var="rating">
                <p>
                    <spring:url value="/users/{userId}" var="userUrl">
                        <spring:param name="userId" value="${rating.author.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(userUrl)}"><c:out value="${rating.author.username}"/></a>
                    <fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle="medium" timeStyle="medium" value="${rating.postDate}"/><br>
                    <c:out value="${rating.ratingText}"/>
                </p>
            </c:forEach>

            <p>
                <form:form method="POST" modelAttribute="addedRating">
            <fieldset>
                <div class="input-field">
                    <form:textarea path="ratingText" class="materialize-textarea" cols="50" rows="10" placeholder="Zde muzete napsat hodnoceni"
                                   required="true"/>
                </div>
                <div class="clearfix">
                    <sec:authorize access="isAuthenticated()">
                        <button type="submit" class="btn btn-primary">Ohodnotit uzivatele</button>
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
                        <button type="submit" class="btn btn-primary" disabled>Ohodnotit</button>
                        <br>
                        <span class="red-text">Hodnotit mohou pouze prihlaseni uzivatele.</span>
                    </sec:authorize>
                </div>
            </fieldset>
            </form:form>
            </p>
        </div>
    </div>

</main>

<jsp:include page="template_footer.jsp"/>
</body>
</html>
