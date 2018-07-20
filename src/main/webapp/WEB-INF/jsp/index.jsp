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

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">Hello, world!</h1>
            <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of
                content. Use it as a starting point to create something more unique.</p>
            <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more &raquo;</a></p>
        </div>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-md-4">
                <h2>Categories</h2>
                <c:forEach items="${categories}" var="categ">
                    <spring:url value="/articles/categories/{categoryId}" var="articleCategoryUrl">
                        <spring:param name="categoryId" value="${categ.id}"/>
                    </spring:url>
                    <li class="collection-item"><a href="${fn:escapeXml(articleCategoryUrl)}"><c:out value="${categ.name}"/></a></li>
                </c:forEach>
                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa
                    justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Heading</h2>
                <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce
                    dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
                <p><a class="btn btn-secondary" href="#" role="button">View details &raquo;</a></p>
            </div>
        </div>

        <hr>

    </div> <!-- /container -->

    <div class="container">
        <div class="col l8 article-listing">
            <jsp:useBean id="pagedListHolder" scope="request" type="org.springframework.beans.support.PagedListHolder"/>
            <%--pagination works relatively to current URL--%>
            <c:url value="${requestScope['javax.servlet.forward.request_uri']}" var="pagedLink">
                <c:param name="p" value="~"/>
            </c:url>
            <c:if test="${fn:length(pagedListHolder.pageList) eq 0}">
                <p>Zadne clanky nebyly nalezeny.</p>
            </c:if>
            <c:forEach items="${pagedListHolder.pageList}" var="article">
                <div class="card horizontal">
                    <div class="card-image">
                        <img src="/resources/images/original/${article.images[0].uuid}.jpg" alt=""/>
                    </div>
                    <div class="card-stacked">
                        <div class="card-content">
                            <p>
                                <b><span class="article-name">${article.name}</span></b>
                                <br/>
                                    <%--If the description is longer than a certain value, abbreviation is applied--%>
                                <c:set var="desc" value="${article.description}"/>

                                <c:choose>
                                    <c:when test="${fn:length(desc) > 50}">
                                        Description:<c:out value="${fn:substring(desc,0,50)}"/>...
                                    </c:when>

                                    <c:otherwise>
                                        Description: <c:out value="${article.description}"/>
                                    </c:otherwise>
                                </c:choose>
                                <br/>
                                Location: <c:out value="${article.location}"/>
                                <br/>
                                Price: <c:out value="${article.price}"/>
                                <br/>
                                <span class="">Last edited: <fmt:formatDate pattern="dd. MM. yyyy HH:mm" dateStyle="medium" timeStyle="medium"
                                                                            value="${article.timestamp}"/></span>
                            </p>
                        </div>
                        <div class="card-action">
                            <spring:url value="/articles/{articleId}" var="articleUrl">
                                <spring:param name="articleId" value="${article.id}"/>
                            </spring:url>
                            <a href="${fn:escapeXml(articleUrl)}">Detail</a>
                        </div>
                    </div>
                </div>

            </c:forEach>
            <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}"></tg:paging>


            </ul>
            </nav>
        </div>
    </div>
</main>

<jsp:include page="template_footer.jsp"/>
</body>
</html>