<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
    <jsp:include page="blocks/_header.jsp"/>
    <title><spring:message code="app_title_browser"/></title>
</head>
<body>
<jsp:include page="blocks/_menu.jsp"/>
<main role="main">

    <div class="container">
        <h1><spring:message code="headline_registration"/></h1>

        <c:if test="${MESSAGE_CODE_REGISTRATION ==0}">
            <jsp:include page="blocks/_alert_registration_error.jsp"/>
        </c:if>


        <form:form method="POST" modelAttribute="user">
            <fieldset>
                <div class="form-group">
                    <label class="bmd-label-floating"><b><spring:message code="username"/></b><span class="text-danger"> *</span></label>
                    <form:input path="username" class="form-control" type="text" required="true"/>
                </div>
                <div class="form-group">
                    <label class="bmd-label-floating"><b><spring:message code="password"/></b><span class="text-danger"> *</span></label>
                    <form:input path="password" class="form-control" type="password" id="psw" required="true"/>
                </div>
                <div class="form-group">
                    <label class="bmd-label-floating"><b><spring:message code="password_repeat"/></b><span class="text-danger"> *</span></label>
                    <form:input path="passwordRepeat" class="form-control" type="password" id="psw-repeat" required="true"/>
                </div>
                <div class="form-group">
                    <label class="bmd-label-floating"><b><spring:message code="email"/></b><span class="text-danger"> *</span></label>
                    <form:input path="email" class="form-control" type="email" required="true"/>
                </div>
                <div class="form-group">
                    <label class="bmd-label-floating"><b><spring:message code="first_name"/></b><span class="text-danger"> *</span></label>
                    <form:input path="firstName" class="form-control" type="text" required="true"/>
                </div>
                <div class="form-group">
                    <label class="bmd-label-floating"><b><spring:message code="last_name"/></b><span class="text-danger"> *</span></label>
                    <form:input path="lastName" class="form-control" type="text" required="true"/>
                </div>
                <p><span class="text-danger"><spring:message code="registration_requied_fields"/></span></p>
                <div class="clearfix">
                    <a href="/">
                        <button type="button" class="btn btn-outline-secondary"><spring:message code="button_cancel"/></button>
                    </a>
                    <button type="submit" class="btn btn-primary btn-raised"><spring:message code="button_register"/></button>
                </div>
            </fieldset>
        </form:form>
    </div>
    <script>
        var password = document.getElementById("psw"),
            confirm_password = document.getElementById("psw-repeat");

        function validatePassword() {
            if (password.value != confirm_password.value) {
                //TODO zobrazovat hlasku na obrazovce - v mozille funguje ale ve chromu ne
                confirm_password.setCustomValidity("Passwords Don't Match");
                /*confirm_password.setCustomValidity(<spring:message code="password_not_match"/>);*/  //TODO zjistit proc nefunguje string ze souboru Messages a opravit to
            } else {
                confirm_password.setCustomValidity('');
            }
        }

        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;
    </script>

</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>