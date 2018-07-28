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
    <script src='/resources/graphs/graph_elements.js'></script>
    <script src='/resources/graphs/graphView.js'></script>
</head>

<body>
<jsp:include page="blocks/_menu.jsp"/>

<main role="main">
    <div class="container">

        <h1><spring:message code="headline_algorithm"/></h1>


        <ul class="nav nav-tabs nav-justified bg-light" id="myTab" role="tablist">

            <li class="nav-item">
                <a class="nav-link" id="tab-popis" data-toggle="tab" href="#popis" role="tab" aria-controls="popis"
                   aria-selected="false"><spring:message code="algorithm_tab_description"/></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="tab-kod" data-toggle="tab" href="#kod" role="tab" aria-controls="kod"
                   aria-selected="false"><spring:message code="algorithm_tab_pseudocode"/></a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" id="tab-ukazka" data-toggle="tab" href="#ukazka" role="tab"
                   aria-controls="ukazka" aria-selected="true"><spring:message code="algorithm_tab_demo"/></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" id="tab-priklady" data-toggle="tab" href="#priklady" role="tab"
                   aria-controls="priklady" aria-selected="false"><spring:message code="algorithm_tab_examples"/></a>
            </li>
        </ul>

        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade" id="popis" role="tabpanel" aria-labelledby="tab-popis"><p class="text-justify text-long">Johnsonův algoritmus je
                algoritmus sloužící k hledání nejkratších cest mezi všemi uzly
                v ohodnoceném orientovaném grafu, který může mít záporně ohodnocené hrany. V řídkých grafech je
                rychlejší, než Floydův-Warshallův algoritmus.
                Johnsonův algoritmus dokáže rozpoznat záporný cyklus v grafu a výpočet ukončit. K tomu využívá
                Bellmanův-Fordův algoritmus, s jehož pomocí přehodnotí hra
                ny tak, aby žádná neobsahovala zápornou hodnotu. Po přehodnocení hran používá Dijkstrův algoritmus k
                nalezení nejkratších cest mezi všemi uzly. Johnsonův algoritmus je pojmenován po Donaldu B. Johnsonovi.
                Problém čínského pošťáka

                Nyní si ukážeme jednu aplikaci Eulerovských tahů a grafů, jedná se o problém čínského pošťáka.

                Zadání problému: Pošták má při roznášce pošty projít každou ulicí svého rajonu. Jak má postupovat, aby ušel co nejméně kilometrů?

                Tento problém poprvé vyřešili Edmonds a Johnson (1973). Použili grafové reprezentace pro město s ulicemi, kde ulice odpovídají hranám a ohodnocením může být délka, čas nebo cena.

                Řešení:

                (a) Jestliže v grafu rajonu existuje eulerovský tah, pak tento tah je optimálním řešením úlohy.
                (b) Jestliže v grafu rajonu eulerovský tah neexistuje, pak pošťák musí projít některými ulicemi vícekrát, tj. musíme minimalizovat součet délek opakovaně procházených ulic. (Řeší se pomocí párování v grafech.)

            </p></div>
            <div class="tab-pane fade" id="kod" role="tabpanel" aria-labelledby="tab-kod"><p class="text-justify text-long">začátek
                Na počátku nechť je každá hrana grafu G neobarvená. Nechť zásobník LIFO a zásobník ET je prázdný. Vlož
                vrchol v do zásobníku LIFO;
                dokud je zásobník LIFO neprázdný opakuj
                začátek
                x: = vrchol ležící na posledním místě vzásobníku LIFO;
                jestliže x je koncový vrchol neobarvené hrany {x,y} pak
                začátek
                zpracuj hranu {x,y} a obarvi ji modře;
                vlož vrchol y do zásobníku LIFO;
                konec
                jinak (tj. v případě, že x není koncovým vrcholem žádné neobarvené hrany)
                začátek
                odeber vrchol x ze zásobníku LIFO;
                vlož vrchol x do zásobníku ET;
                konec;
                konec;
                V zásobníku ET je uložen eulerovský tah.
                konec.
            </p></div>
            <div class="tab-pane fade show active" id="ukazka" role="tabpanel" aria-labelledby="tab-ukazka">
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
                    <div class="col-md-6" id="cy">
                    </div>
                </div>

                <div class="progress">
                    <div class="progress-bar progress-bar-striped bg-primary" role="progressbar" style="width: 60%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>

            </div>
        </div>
        <div class="tab-pane fade" id="priklady" role="tabpanel" aria-labelledby="tab-priklady">...</div>



    </div>
</main>

<jsp:include page="blocks/_footer.jsp"/>
</body>
</html>