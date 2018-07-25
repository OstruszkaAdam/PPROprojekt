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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/cytoscape/3.2.15/cytoscape.js"></script>
    <script src='resources/graphs/graph_elements.js'></script>
    <script src='resources/graphs/graphView.js'></script>
</head>

<body>
<jsp:include page="blocks/_menu.jsp"/>

<main role="main">

    <div class="container">

        <h1><spring:message code="headline_algorithm"/></h1>
        <!-- dark -->
        <ul class="nav nav-tabs bg-light">
            <li class="nav-item">
                <a class="nav-link" href="#"><spring:message code="algorithm_tab_description"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#"><spring:message code="algorithm_tab_pseudocode"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link active" href="#"><spring:message code="algorithm_tab_example"/></a>
            </li>
        </ul>

        <div class="row">
            <div class="col-md-6">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">&nbsp;</th>
                        <th scope="col">A</th>
                        <th scope="col">B</th>
                        <th scope="col">C</th>
                        <th scope="col">D</th>
                        <th scope="col">E</th>
                        <th scope="col">F</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">A</th>
                        <td>&nbsp;</td>
                        <td>1</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <th scope="row">B</th>
                        <td>1</td>
                        <td>&nbsp;</td>
                        <td>1</td>
                        <td></td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <th scope="row">C</th>
                        <td>&nbsp;</td>
                        <td>1</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>1</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row">D</th>
                        <td>&nbsp;</td>
                        <td></td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>1</td>
                        <td>1</td>
                    </tr>
                    <tr>
                        <th scope="row">E</th>
                        <td>&nbsp;</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <th scope="row">F</th>
                        <td>1</td>
                        <td>1</td>
                        <td>&nbsp;</td>
                        <td>1</td>
                        <td>&nbsp;</td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-md-6" id="cy"><%--toto id je pro funkcnost Cytoscape.js nutne - nezapomenout--%>
            </div>


<%--            <script>
                var cy = cytoscape({
                    container: document.getElementById('cy'),
                    elements: [
                        {data: {id: 'a'}},
                        {data: {id: 'b'}},
                        {data: {id: 'c'}},
                        {data: {id: 'd'}},
                        {data: {id: 'e'}},
                        {data: {id: 'f'}},
                        {
                            data: {
                                id: 'ab',
                                source: 'a',
                                target: 'b'
                            }
                        },
                        {
                            data: {
                                id: 'af',
                                source: 'a',
                                target: 'f'
                            }
                        },
                        {
                            data: {
                                id: 'bc',
                                source: 'b',
                                target: 'c'
                            }
                        },
                        {
                            data: {
                                id: 'be',
                                source: 'b',
                                target: 'e'
                            }
                        },
                        {
                            data: {
                                id: 'bf',
                                source: 'b',
                                target: 'f'
                            }
                        },
                        {
                            data: {
                                id: 'ce',
                                source: 'c',
                                target: 'e'
                            }
                        },
                        {
                            data: {
                                id: 'de',
                                source: 'd',
                                target: 'e'
                            }
                        },
                        {
                            data: {
                                id: 'df',
                                source: 'd',
                                target: 'f'
                            }
                        }


                    ],

                    layout: {
                        name: 'circle',
                        circle: function (node) {
                            return node.degree();
                        },

                    },

                    style: [
                        {
                            selector: 'node',
                            style: {
                                'background-color': [0, 150, 136],
                                label: 'data(id)'
                            }

                        }]

                });
            </script>--%>

            <br>
        </div>
    </div>

</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>