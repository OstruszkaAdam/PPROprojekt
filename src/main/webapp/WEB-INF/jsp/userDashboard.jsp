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
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><spring:message code="app_title_browser"/></title>

    <!-- Material Design for Bootstrap CSS -->
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-material-design@4.1.1/dist/css/bootstrap-material-design.min.css"
          integrity="sha384-wXznGJNEXNG1NFsbm0ugrLFMQPWswR3lds2VeinahP8N0zJw9VWSopbjv2x7WCvX" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link type="text/css" rel="stylesheet" href="/resources/css/dashboard.css"/>
</head>

<body>

<!--==========================
    Horni menu
============================-->
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
   <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">Company name</a>

    <input class="form-control form-control-dark w-100" type="text"
           placeholder="<spring:message code="search_placeholder"/>"
           aria-label="<spring:message code="search_placeholder"/>">
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="<spring:url value="/logout" />" role="button"><spring:message code="menu_item_logout"/></a>
        </li>
    </ul>
</nav>


<div class="container-fluid">
    <div class="row">
        <!--==========================
            Bocni menu
        ============================-->
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="/">
                            <span data-feather="home"></span>
                            <spring:message code="admin_menu_homepage"/>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#clanky">
                            <span data-feather="book"></span>
                            <spring:message code="admin_menu_articles"/><span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#grafy">
                            <span data-feather="git-branch"></span>
                            <spring:message code="admin_menu_graphs"/>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#info">
                            <span data-feather="user"></span>
                            <spring:message code="admin_menu_user"/>
                        </a>
                    </li>
                </ul>

                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>Saved reports</span>
                    <a class="d-flex align-items-center text-muted" href="#">
                        <span data-feather="plus-circle"></span>
                    </a>
                </h6>
                <ul class="nav flex-column mb-2">
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            Current month
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            Last quarter
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            Social engagement
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <span data-feather="file-text"></span>
                            Year-end sale
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--==========================
            Hlavni obsah
        ============================-->
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                <h1><spring:message code="headline_user_dashboard"/></h1>
                <%--<div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group mr-2">
                        <button class="btn btn-outline-secondary">Share</button>
                        <button class="btn btn-outline-secondary">Export</button>
                    </div>
                </div>--%>
            </div>

            <!--==========================
                Prehled clanku
            ============================-->

            <h3 class="page-section-header" id="clanky"><spring:message code="user_articles"/></h3>
            <a href="<spring:url value="/articles/new" />" class="btn btn-primary btn-outline"><spring:message code="menu_item_insert_article"/></a>

            <div class="table-responsive ">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th scope="col"><spring:message code="article_headline"/></th>
                        <th scope="col"><spring:message code="timestamp"/></th>
                        <th scope="col"><spring:message code="created_by"/></th>

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

                            <td><c:out value="${article.timestamp}"/></td>

                            <td><c:out value="${article.user.username}"/></td>

                            <c:if test="${isLoggedUsersProfile}">
                                <spring:url value="/articles/{articleId}/edit" var="editArticle">
                                    <spring:param name="articleId" value="${article.id}"/>
                                </spring:url>
                                <td>
                                    <a class="btn btn-primary btn-sm" href="${fn:escapeXml(editArticle)}"><spring:message code="action_edit"/>
                                    </a>
                                </td>

                                <c:url var="deleteUrl" value="/articles/${article.id}/delete"/>
                                <td><form:form action="${deleteUrl}" method="POST">
                                <input id="articleId" name="articleId" type="hidden" value="<c:out value="${article.id}"/>"/>
                                <button type="submit" class="btn btn-primary btn-sm" onClick="return confirm('Opravdu smazat?')"><spring:message
                                        code="action_delete"/></button>
                                </td>
                            </form:form>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>

            </div>


            <!--==========================
                Prehled grafu
            ============================-->
            <h3 class="page-section-header" id="grafy"><spring:message code="user_graphs"/></h3>
            <a href="<spring:url value="/graph/new" />" class="btn btn-primary btn-outline"><spring:message code="menu_item_insert_graph"/></a>

            <div class="table-responsive ">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th scope="col"><spring:message code="graph_headline"/></th>
                        <th scope="col"><spring:message code="description"/></th>
                        <th scope="col"><spring:message code="created_by"/></th>
                        <c:if test="${isLoggedUsersProfile}">
                            <th scope="col"><spring:message code="article_actions"/></th>
                        </c:if>
                    </tr>
                    </thead>

                    <c:forEach items="${graphs}" var="graph">
                        <spring:url value="/graph/{graphId}" var="graphUrl">
                            <spring:param name="graphId" value="${graph.id}"/>
                        </spring:url>
                        <tr>
                            <td><a href="${fn:escapeXml(graphUrl)}"><c:out value="${graph.name}"/></a></td>

                            <c:set var="desc" value="${graph.description}"/>
                            <c:choose>
                                <c:when test="${fn:length(desc) > 50}">
                                    <td><c:out value="${fn:substring(desc,0,50)}"/>...</td>
                                </c:when>

                                <c:otherwise>
                                    <td><c:out value="${graph.description}"/></td>
                                </c:otherwise>
                            </c:choose>

                            <td><c:out value="${graph.user.username}"/></td>


                            <c:if test="${isLoggedUsersProfile}">

                                <c:url var="deleteUrl" value="/graphs/delete/${graph.id}"/>
                                <td><form:form action="${deleteUrl}" method="POST">
                                    <input id="graphId" name="graphId" type="hidden" value="<c:out value="${graph.id}"/>"/>
                                    <button type="submit" class="btn btn-primary" onClick="return confirm('Opravdu smazat?')"><spring:message
                                            code="action_delete"/></button>
                                </form:form></td>
                            </c:if>
                        </tr>
                    </c:forEach>
                </table>

            </div>

            <!--==========================
                 Prehled informaci o uzivateli
            ============================-->
            <h3 class="page-section-header" id="info"><spring:message code="user_detail"/></h3>
            <table class="table table-striped table-hover">
                <tbody>
                <tr>
                    <th scope="col"><spring:message code="username"/></th>
                    <td>${user.username}</td>
                </tr>
                <tr>
                    <th scope="col"><spring:message code="email"/></th>
                    <td>${user.email}</td>
                </tr>
                <tr>
                    <th scope="col"><spring:message code="registration_date"/></th>
                    <td><fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle="medium" timeStyle="medium" value="${user.creationTime}"/></td>
                </tr>
                <tr>
                    <th scope="col"><spring:message code="first_name"/></th>
                    <td>${user.firstName}</td>
                </tr>
                <tr>
                    <th scope="col"><spring:message code="last_name"/></th>
                    <td>${user.lastName}</td>
                </tr>
                </tbody>
            </table>

        </main>
    </div>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
<script src="../../../../assets/js/vendor/popper.min.js"></script>
<script src="../../../../dist/js/bootstrap-material-design.min.js"></script>

<!-- Icons -->
<script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
<script>
    feather.replace()
</script>

</body>
</html>
