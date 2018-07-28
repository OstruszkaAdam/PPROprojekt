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

    <!-- Libraries CSS Files -->
    <link href="resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">

</head>

<body>
<jsp:include page="blocks/_menu.jsp"/>

<main role="main" class="index">


    <!--==========================
       Jumbotron
    ============================-->

    <div id="jumbotron">
        <div class="container">
            <div class="jumbotron-text">
                <h1 class="display-3 text-light"><spring:message code="headline_app_title"/></h1>
                <p><spring:message code="index_app_description"/></p>
                <%--<p class="text-light"><spring:message code="app_description"/></p>--%>
                <a class="btn btn-outline-light btn-lg" href="/latest-articles" role="button"><spring:message code="button_detail"/> &raquo;</a>
            </div>
        </div>
    </div>


    <!--==========================
        Our Team Section
    ============================-->

    <section id="team" class="section-bg">
        <div class="container">
            <div class="section-header">
                <h2 class="text-center"><spring:message code="menu_item_team"/></h2>
                <p class="text-center"><spring:message code="index_team_description"/></p>
            </div>
            <div class="row wow fadeInUp">


                <div class="col-lg-4 col-md-4">
                    <div class="member">
                        <div class="pic"><img src="resources/images/ui/team-1.jpg" alt=""></div>
                        <h4>Vláďa Braha</h4>
                        <span>Senior FIM student</span>
                        <div class="social">
                            <a href=""><i class="fa fa-twitter"></i></a>
                            <a href=""><i class="fa fa-facebook"></i></a>
                            <a href=""><i class="fa fa-google-plus"></i></a>
                            <a href=""><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-4">
                    <div class="member">
                        <div class="pic"><img src="resources/images/ui/team-3.jpg" alt=""></div>
                        <h4>Pan Kávovar</h4>
                        <span>Catering</span>
                        <div class="social">
                            <a href=""><i class="fa fa-twitter"></i></a>
                            <a href=""><i class="fa fa-facebook"></i></a>
                            <a href=""><i class="fa fa-google-plus"></i></a>
                            <a href=""><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-4">
                    <div class="member">
                        <div class="pic"><img src="resources/images/ui/team-2.jpg" alt=""></div>
                        <h4>Adam Ostruszka</h4>
                        <span>Senior FIM student</span>
                        <div class="social">
                            <a href=""><i class="fa fa-twitter"></i></a>
                            <a href=""><i class="fa fa-facebook"></i></a>
                            <a href=""><i class="fa fa-google-plus"></i></a>
                            <a href=""><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>


            </div>

        </div>
    </section><!-- #team -->


    <div class="container">
        <!-- Example row of columns -->
        <c:if test="${MESSAGE_CODE_REGISTRATION != null}">
            <jsp:include page="blocks/_alert_registration_success.jsp"/>
        </c:if>

        <c:if test="${MESSAGE_CODE_ARTICLE != null}">
            <%--  <c:if test="${MESSAGE_CODE_ARTICLE ==1}"><jsp:include page="blocks/_alert_article_success.jsp"/></c:if>--%>
            <c:if test="${MESSAGE_CODE_ARTICLE ==2}">
                <jsp:include page="blocks/_alert_article_delete.jsp"/>
            </c:if>
        </c:if>

        <c:if test="${MESSAGE_CODE_GRAPH != null}">
            <jsp:include page="blocks/_alert_graph_success.jsp"/>
        </c:if>
    </div>
</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>