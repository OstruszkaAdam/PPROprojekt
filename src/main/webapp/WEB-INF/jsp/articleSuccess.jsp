<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">
<head>
    <jsp:include page="template_header.jsp"/>
    <title><spring:message code="app_title_browser"/></title>
</head>

<body>
<jsp:include page="template_menu.jsp"/>

<main role="main">

    <div class="container">
        <div class="vertical_space">
            <p><spring:message code="article_success"/></p>
            <a href="<spring:url value="/" />" class="btn btn-primary"><spring:message code="button_back_to_homepage"/></a>

        </div>
    </div>

</main>

<jsp:include page="template_footer.jsp"/>
</body>
</html>



