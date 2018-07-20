<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">Teorie grafů</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault"
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li>
                <a class="nav-link" href='<spring:url value="/" htmlEscape="true"/>'>Home</a>
            </li>
            <sec:authorize access="isAuthenticated()">
                <li class="">
                    <a class="nav-link" href="<spring:url value="/logout" />">Odhlasit se</a>
                </li>
                <li class="nav-item">
                    <spring:url value="/users/{userId}" var="userUrl">
                        <spring:param name="userId" value="${loggedUserId}"/>
                    </spring:url>
                    <a class="nav-link" href="${fn:escapeXml(userUrl)}"/>Muj profil</a>
                </li>
            </sec:authorize>


&lt;%&ndash;            <sec:authorize access="isAuthenticated()">
                <spring:url value="/users/{userId}" var="userUrl">
                    <spring:param name="userId" value="${loggedUserId}"/>
                </spring:url>
                <li class=""><a class="nav-link" href="${fn:escapeXml(userUrl)}">
                    Prihlasen(a)
                    <sec:authentication property="principal.username"/></a>
                </li>
            </sec:authorize>
&ndash;%&gt;

            <sec:authorize access="isAnonymous()">
                <li class="">
                    <a class="nav-link" href="<spring:url value="/login" />">Prihlasit se</a>
                </li>
                <li class="">
                    <a class="nav-link" href="<spring:url value="/registration" htmlEscape="true"/>">Registrovat</a>
                </li>
            </sec:authorize>

            <li class="nav-item">
                <a class="nav-link" href='<spring:url value="/articles/new" htmlEscape="true"/>'>Vlozit clanek</a>
            </li>


        </ul>



        <form class="form-inline my-2 my-lg-0" action="/search" method="get">

            <input class="form-control mr-sm-2" type="text" name="q" placeholder="Vyhledat clanek" aria-label="Vyhledat clanek">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Hledat</button>

        </form>


    </div>
</nav>



--%>







<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="#">Teorie grafů</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav mr-auto">
                <li>
                    <a class="nav-link" href='<spring:url value="/" htmlEscape="true"/>'>Home</a>
                </li>
                <sec:authorize access="isAuthenticated()">
                    <li class="">
                        <a class="nav-link" href="<spring:url value="/logout" />">Odhlasit se</a>
                    </li>
                    <li class="nav-item">
                        <spring:url value="/users/{userId}" var="userUrl">
                            <spring:param name="userId" value="${loggedUserId}"/>
                        </spring:url>
                        <a class="nav-link" href="${fn:escapeXml(userUrl)}"/>Muj profil</a>
                    </li>
                </sec:authorize>


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

                <sec:authorize access="isAnonymous()">
                    <li class="">
                        <a class="nav-link" href="<spring:url value="/login" />">Prihlasit se</a>
                    </li>
                    <li class="">
                        <a class="nav-link" href="<spring:url value="/registration" htmlEscape="true"/>">Registrovat</a>
                    </li>
                </sec:authorize>

                <li class="nav-item">
                    <a class="nav-link" href='<spring:url value="/articles/new" htmlEscape="true"/>'>Vlozit clanek</a>
                </li>


            </ul>



            <form class="form-inline my-2 my-lg-0" action="/search" method="get">

                <input class="form-control mr-sm-2" type="text" name="q" placeholder="Vyhledat clanek" aria-label="Vyhledat clanek">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Hledat</button>

            </form>
        </div>
    </div>
</nav>







<%--
<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home<span class="sr-only">(current)</span></a>
            </li>


            <li class="nav-item">
                <a class="nav-link" href="#">Link</a>
            </li>



            <li class="nav-item">
                <a class="nav-link disabled" href="#">Disabled</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>--%>
