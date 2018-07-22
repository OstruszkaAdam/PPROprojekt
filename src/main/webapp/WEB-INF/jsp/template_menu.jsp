<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary text-white">
    <div class="container">
        <%-- <a class="navbar-brand" href="#"><spring:message code="app_title"/></a>--%>
        <a class="navbar-brand" href='<spring:url value="/" htmlEscape="true"/>'><spring:message code="headline_app_title"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
        <%-- data-target="#navbarsExample07" aria-controls="navbarsExample07"--%>
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <%--                <li>
                                    <a class="nav-link" href='<spring:url value="/" htmlEscape="true"/>'>Home</a>
                                </li>
                                --%>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="/" id="dropdown01" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false"><spring:message code="article_category"/></a>
                    <div class="dropdown-menu" aria-labelledby="dropdown01">


                        <c:forEach items="${topics}" var="categ">
                            <spring:url value="/articles/topics/{categoryId}" var="articleTopicUrl">
                                <spring:param name="topicId" value="${categ.id}"/>
                            </spring:url>
                            <a class="dropdown-item" href="${fn:escapeXml(articleTopicUrl)}"><c:out value="${categ.name}"/></a>
                        </c:forEach>

                        <%--<a class="dropdown-item" href="#">Action</a>--%>

                    </div>
                </li>


                <%--            <sec:authorize access="isAuthenticated()">
                                <spring:url value="/users/{userId}" var="userUrl">
                                    <spring:param name="userId" value="${loggedUserId}"/>
                                </spring:url>
                                <li class=""><a class="nav-link" href="${fn:escapeXml(userUrl)}">
                                    Prihlasen(a)
                                    <sec:authentication property="principal.username"/></a>
                                </li>
                            </sec:authorize>
                --%>

                <%--    <sec:authorize access="isAuthenticated()">
                        <li class="">
                            <a class="nav-link" href="<spring:url value="/logout" />"><spring:message code="menu_item_logout"/></a>
                        </li>

                        <li class="nav-item">
                            <spring:url value="/users/{userId}" var="userUrl">
                                <spring:param name="userId" value="${loggedUserId}"/>
                            </spring:url>
                            <a class="nav-link" href="${fn:escapeXml(userUrl)}"><spring:message code="menu_item_profile"/></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href='<spring:url value="/articles/new" htmlEscape="true"/>'><spring:message code="menu_item_insert_article"/></a>
                        </li>
                    </sec:authorize>

                <sec:authorize access="isAnonymous()">
                    <li class="">
                        <a class="nav-link" href="<spring:url value="/login" />"><spring:message code="menu_item_login"/></a>
                    </li>

                    <li class="">
                        <a class="nav-link" href="<spring:url value="/registration" htmlEscape="true"/>"><spring:message code="menu_item_register"/></a>
                    </li>


                </sec:authorize>--%>


            </ul>


            <form class="form-inline my-2 my-lg-0" action="/search" method="get">
                <input class="form-control mr-sm-2" type="text" name="q" placeholder="<spring:message code="search_placeholder"/>"
                       aria-label="<spring:message code="search_placeholder"/>">
                <button class="btn btn-outline-light my-2 my-sm-0" type="submit"><spring:message code="search_button"/></button>
            </form>

        </div>
    </div>
</nav>