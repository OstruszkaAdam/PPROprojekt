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

    <div class="container">
        <h1>Pridat/Upravit clanek</h1>

        <form:form method="POST" modelAttribute="articleDto" enctype="multipart/form-data">
            <fieldset>
                <div class="form-group">
                    <label class="bmd-label-floating"><b>Name</b></label>
                    <form:input path="name" class="form-control" type="text" required="true"/>
                </div>

                <div class="form-group">
                    <label class="bmd-label-floating"><b>Category</b></label><br>
                    <form:select name="category" class="form-control" path="category">
                        <c:forEach items="${categories}" var="categ">
                            <form:option value="${categ.name}"/>
                        </c:forEach>
                    </form:select>
                </div>

                <div class="form-group">
                    <label class="bmd-label-floating"><b>Location</b></label>
                    <form:input path="location" class="form-control" type="text" required="true"/>
                </div>

                <div class="form-group">
                    <label class="bmd-label-floating"><b>Description</b></label>
                    <form:textarea path="description" class="form-control" required="true"/>
                </div>

                <div class="form-group">
                    <label class="bmd-label-floating"><b>Price</b></label>
                    <form:input path="price" class="form-control" required="true"/>
                </div>

                <div class="form-group">
                    <label class="bmd-label-floating">Image</label>
                    <form:input path="mpf" type="file" class="form-control-file" multiple="true"/>
                </div>
                <div class="clearfix"></div>

                <a class="btn btn-default" role="button" href='<spring:url value="/" htmlEscape="true"/>'>Cancel</a>
                <button type="submit" class="btn btn-primary btn-raised" role="button">Submit</button>

            </fieldset>
        </form:form>


    </div>

</main>

<jsp:include page="template_footer.jsp"/>
</body>
</html>