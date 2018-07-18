<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <%--Bootstrap--%>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
          integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

        <link href="css/style.css" rel="stylesheet">
    <title>DimaApplication</title>
</head>
<div>
    <div class="bodyContainer">
    <sec:authorize access="isAuthenticated()">
        <p>Hello
            <spring:url value="/users/{userId}" var = "userUrl">
                <spring:param name="userId" value="${userId}"/>
            </spring:url>
            <a href="${fn:escapeXml(userUrl)}"><sec:authentication property="principal.username" /></a>
        </p>
    </sec:authorize>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
                <ul class="navbar-nav">
                        <sec:authorize access="isAuthenticated()">
                            <li class="nav-item">
                                <a class="nav-link" href="<spring:url value="/logout" />">Log out</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${fn:escapeXml(userUrl)}"/>My profile</a>
                            </li>
                        </sec:authorize>
                        <sec:authorize access="isAnonymous()">
                            <li class="nav-item">
                                <a class="nav-link" href="<spring:url value="/login" />">Log in</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<spring:url value="/registration" htmlEscape="true"/>">Register</a>
                            </li>
                        </sec:authorize>

                    <li class="nav-item">
                        <a class="nav-link" href='<spring:url value="/articles/new" htmlEscape="true"/>'>Insert article</a>
                    </li>
                </ul>
        </nav>

    <div class="container">
        <div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="clankyContainer">

            <c:forEach items="${articles}" var="article">
                <div class="clanekBody">
                    <div class="ClanekNadpis">
                        <h2>
                            <spring:url value="/articles/{articleId}" var = "articleUrl">
                                <spring:param name="articleId" value="${article.id}"/>
                            </spring:url>
                            <a href="${fn:escapeXml(articleUrl)}"><c:out value="${article.name}"/></a>
                        </h2>
                    </div>
                    <div class="category">
                        <c:out value="${article.category.name}"/>
                    </div>
                    <div class="box">

                        <div class="ClanekText">
                            <p>
                               Description: <c:out value="${article.description}"/>
                            </p>
                        </div>
                    </div>
                    Location: <c:out value="${article.location}"/>
                    <br/>
                    Price: <c:out value="${article.price}"/>
                    <br/>Last edited: <fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle = "medium" timeStyle = "medium" value = "${article.timestamp}" />
                    <img src="/articleImage/imageDisplay?articleId=${article.id}"/>
                </div>
            </c:forEach>

        </div>
    </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
