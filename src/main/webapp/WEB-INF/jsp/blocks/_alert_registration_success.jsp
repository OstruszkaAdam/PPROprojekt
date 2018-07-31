<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link type="text/css" rel="stylesheet" href="/resources/css/registration_success.css"/>

<div class="alert alert-success alert-dismissible fade show" role="alert">
    <h4 class="alert-heading"><spring:message code="registration_success"/></h4>
    <p><spring:message code="registration_message_welcome"/></p>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>

</div>