<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="template_header.jsp"/>
    <title>DimaApplication</title>
</head>
<body>
<div class="vertical_space">
    <div class="bodyContainer">
        <div class="container">
            <jsp:include page="template_menu.jsp"/>
            <p>
                Jsi registrován!
            </p>
            <a href="<spring:url value="/" />">Zpátky na výchozí stránku</a>
            <a href="<spring:url value="/articles/new" />">Vytvořit článek</a>

        </div>
    </div>
</div>
<jsp:include page="template_footer.jsp"/>
</body>
</html>
