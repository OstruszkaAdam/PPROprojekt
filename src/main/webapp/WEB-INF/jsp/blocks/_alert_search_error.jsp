<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="alert alert-secondary alert-dismissible fade show text-center" role="alert">
    <img src="/resources/images/ui/round-search.svg" width=auto height="300px" alt=""/>
    <h4 class="alert-heading"><spring:message code="no_articles_found"/></h4>
    <p><spring:message code="search_message_try_again"/></p>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>