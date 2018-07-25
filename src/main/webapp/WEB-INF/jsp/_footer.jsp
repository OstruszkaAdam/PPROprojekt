<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<footer class="container">
    <div class="row">
        <div class="col-md-6">
            <p><spring:message code="footer_text"/></p>
        </div>
        <div class="col-md-6">

            <sec:authorize access="isAuthenticated()">

                <a class="btn btn-secondary" href="<spring:url value="/logout" />" role="button"><spring:message code="menu_item_logout"/></a>

                <c:choose>
                    <c:when test="${loggedUserId!=null}">
                        <spring:url value="/users/{userId}" var="userUrl">
                            <spring:param name="userId" value="${loggedUserId}"/>
                        </spring:url>
                    </c:when>
                    <c:otherwise>
                        <spring:url value="/users/{userId}" var="userUrl">
                            <spring:param name="userId" value="${1}"/>
                        </spring:url>
                    </c:otherwise>

                </c:choose>


                <%--<spring:url value="/users/{userId}" var="userUrl">--%>
                    <%--<spring:param name="userId" value="${loggedUserId}"/>--%>


                <a class="btn btn-secondary" href="${fn:escapeXml(userUrl)}" role="button"><spring:message code="menu_item_profile"/></a>

                <a class="btn btn-secondary" href="<spring:url value="/articles/new" htmlEscape="true"/>"><spring:message code="menu_item_insert_article"/></a>
                <a class="btn btn-secondary" href="<spring:url value="/graph/new" htmlEscape="true"/>"><spring:message code="menu_item_insert_graph"/></a>


            </sec:authorize>

            <sec:authorize access="isAnonymous()">

                <a class="btn btn-secondary" href="<spring:url value="/login" />" role="button"><spring:message code="menu_item_login"/></a>
                
                <a class="btn btn-secondary" href="<spring:url value="/registration" htmlEscape="true"/>" role="button"><spring:message code="menu_item_register"/></a>


            </sec:authorize>

        </div>


    </div>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U"
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-material-design@4.1.1/dist/js/bootstrap-material-design.js"
        integrity="sha384-CauSuKpEqAFajSpkdjv3z9t8E7RlpJ1UP0lKM/+NdtSarroVKu069AlsRPKkFBz9" crossorigin="anonymous"></script>
<script>$(document).ready(function () {
    $('body').bootstrapMaterialDesign();
});</script>