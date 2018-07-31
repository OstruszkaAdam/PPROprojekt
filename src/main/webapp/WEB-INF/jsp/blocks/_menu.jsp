<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary text-white">
    <div class="container">
        <a class="navbar-brand" href='<spring:url value="/" htmlEscape="true"/>'><spring:message
                code="headline_app_title"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/" id="dropdown01" data-toggle="dropdown"
                       aria-haspopup="true"
                       aria-expanded="false"><spring:message code="article_topics"/></a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">


                        <c:forEach items="${topics}" var="temata">
                            <spring:url value="/topics/{topicName}" var="articleTopicUrl">
                                <spring:param name="topicName" value="${temata.urlName}"/>
                            </spring:url>
                            <a class="dropdown-item" href="${fn:escapeXml(articleTopicUrl)}"><c:out
                                    value="${temata.name}"/></a>
                        </c:forEach>

                    </div>
                </li>

                <li>
                    <a class="nav-link" href='<spring:url value="/algoritmus" htmlEscape="true"/>'><spring:message
                            code="menu_item_algorithm"/></a>
                </li>

                <li>
                    <a class="nav-link" href='<spring:url value="/latest-articles" htmlEscape="true"/>'><spring:message
                            code="menu_item_latest"/></a>
                </li>

                <li>
                    <a class="nav-link" href='<spring:url value="/#team" htmlEscape="true"/>'><spring:message
                            code="menu_item_team"/></a>
                </li>


            </ul>


            <form class="form-inline my-2 my-lg-0" action="/search" method="get">
                <input class="form-control mr-sm-2" type="text" name="q"
                       placeholder="<spring:message code="search_placeholder"/>"
                       aria-label="<spring:message code="search_placeholder"/>">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><spring:message
                        code="search_button"/></button>
            </form>

        </div>
    </div>
</nav>