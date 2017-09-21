<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:products-main>

    <script src="../../resources/js/product-list.js" type="text/javascript"></script>
    <customtags:productModal>
        <!-- modal body -->
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#info-tab" data-toggle="tab">
                    <spring:eval expression="@environment.getProperty('global.information.label')"/>
                </a>
            </li>
            <li>
                <a href="#attributes-tab" data-toggle="tab">
                    <spring:eval expression="@environment.getProperty('product.list.modal.menu.second')"/>
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="info-tab">

                <div class="product-image">
                    <img id="product-image" src=""/>
                </div>

                <p>
                    <strong><spring:eval expression="@environment.getProperty('global.name.label')"/>: </strong>
                    <span id="product-name"></span>
                </p>

                <p>
                    <strong><spring:eval expression="@environment.getProperty('global.product.price-per-day')"/>: </strong>
                    <span id="product-price"></span>
                </p>

                <p>
                    <strong><spring:eval expression="@environment.getProperty('global.product.value')"/>: </strong>
                    <span id="product-value"></span>
                </p>

                <p>
                    <strong><spring:eval expression="@environment.getProperty('global.product.relese.day')"/>: </strong>
                    <span id="product-release-date"></span>
                </p>

                <p>
                    <strong><spring:eval expression="@environment.getProperty('global.product.discount.label')"/>: </strong>
                    <span id="product-discount"></span>
                </p>

                <p>
                    <strong><spring:eval expression="@environment.getProperty('global.product.about.label')"/>: </strong>
                </p>
                <p id="product-long-description"></p>

                <p>
                    <strong><spring:eval expression="@environment.getProperty('product.list.modal.menu.first.label.seventh')"/>: </strong>
                    <span id="product-amount"></span>
                </p>

                <p>
                    <strong><spring:eval expression="@environment.getProperty('product.list.modal.menu.first.label.eighth')"/>: </strong>
                    <span id="product-rented-overall"></span> kartų (-us).
                </p>
            </div>

            <div class="tab-pane" id="attributes-tab">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th><spring:eval expression="@environment.getProperty('product.list.modal.menu.second.label.first')"/></th>
                        <th><spring:eval expression="@environment.getProperty('product.list.modal.menu.second.label.second')"/></th>
                    </tr>
                    </thead>
                    <tbody id="product-attributes">
                    </tbody>
                </table>
            </div>
        </div>
    </customtags:productModal>


    <%-- Insert page if pageName exists --%>

    <div class="container">

        <div class="preferences" id="page-name">
            <c:if test="${pageName != null}">
                <jsp:include page="${pageName}" flush="true"/>
            </c:if>
        </div>

            <%-- Sorting options --%>

        <div class="row search-bar">

            <div class="col-md-4 col-sm-4 col-xs-12 product-filter-inputs">
                <div class="input-group">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">Rikiuoti <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="/products/<c:out value="${currentCategory}"/>?order=popular">Populiariausi</a>
                            </li>
                            <li><a href="/products/<c:out value="${currentCategory}"/>?order=price">Dienos kaina</a>
                            </li>
                            <li><a href="/products/<c:out value="${currentCategory}"/>?order=recent">Naujausi</a></li>
                        </ul>
                    </div>
                    <input type="text" class="form-control" disabled="disabled" aria-label="sorted-by"
                           value="<c:out value="${orderMessage}"/>">
                </div>
            </div>

            <!-- SEARCH FIELD START -->
            <div class="col-md-4 col-sm-5 col-xs-12 product-filter-inputs">
                <form action="/products/<c:out value="${currentCategory}"/>" method="get">
                    <div class="input-group">
                        <input type="text"
                               <c:if test="${currentSearch ne null}">disabled="disabled"</c:if> class="form-control"
                               name="search" placeholder="<c:if test="${currentSearch eq null}">Ieškoti...</c:if>">
                        <c:if test="${currentSearch ne null}">
                            <div class="selected-search">
                                <p><a class="glyphicon glyphicon-remove"
                                      href="/products/<c:out value="${currentCategory}"/>?search=removeallsearch"></a>
                                    <span><c:out value="${currentSearch}"/></span></p>
                            </div>


                        </c:if>
                        <span class="input-group-btn">
                            <button class="btn btn-default"
                                    <c:if test="${currentSearch ne null}">disabled="disabled"</c:if> type="submit"><span
                                    class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                        </span>
                    </div>
                </form>
            </div>
            <!-- SEARCH FIELD END -->

            <div class="col-md-3 col-md-offset-1 col-sm-3 col-xs-6 product-filter-inputs">
                <div class="input-group">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">Per puslpaį <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a href="/products/<c:out value="${currentCategory}?perPage=15"/>">15</a></li>
                            <li><a href="/products/<c:out value="${currentCategory}?perPage=30"/>">30</a></li>
                            <li><a href="/products/<c:out value="${currentCategory}?perPage=50"/>">50</a></li>
                        </ul>
                    </div>
                    <input type="text" class="form-control" disabled="disabled"
                           aria-label="sorted-by" value="<c:out value="${productsPerPage}"/>">
                </div>
            </div>


        </div>

        <p id="products-shown">Rodoma: <c:out value="${startIndex}-${endIndex}. Išviso prekių yra: ${totalSize}"/></p>

        <c:choose>
            <c:when test="${endIndex != 0}">

                <div class="row">
                    <c:forEach var="product" items="${products}" varStatus="loop">
                        <div class="col-xs-12 col-sm-4 col-md-3 products-list">
                            <div class="thumbnail">

                                <c:choose>
                                    <c:when test="${product.mainPicture == null}">
                                        <c:set var="image" value="${pageContext.request.contextPath}/resources/img/database/No-image.png"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="image" value="/image/${product.mainPicture.fileName}"/>
                                    </c:otherwise>
                                </c:choose>

                                <div class="product-image">
                                    <img src="<c:out value="${image}"/>" alt="<c:out value="${product.name}"/>"/>
                                </div>
                                <div class="caption product-show-info">
                                    <h4 class="product-info-top"><c:out value="${product.id}"/> : <c:out
                                            value="${product.name}"/></h4>
                                    <p class="product-info-middle"><c:out value="${product.shortDescription}"/></p>
                                    <p class="product-info-bottom">
                                        <a class="btn btn-primary show-modal"
                                           data-id="${product.id}"
                                        >Daugiau...
                                        </a>
                                        <c:choose>
                                            <c:when test="${product.discount.unscaledValue() != 0}">
                                                <span><s><c:out value="${product.pricePerDay}"/> &#8364</s> <fmt:formatNumber
                                                    maxFractionDigits="2"
                                                    value="${product.getPriceWithDiscount()}"/> &#8364</span>
                                            </c:when>
                                            <c:otherwise>
                                                <c:out value="${product.pricePerDay}"/> &#8364
                                            </c:otherwise>
                                        </c:choose>

                                    </p>
                                </div>

                            </div>
                        </div>
                    </c:forEach>
                </div>


                <div class="col-md-12 col-sm-12">
                    <nav class="text-center" aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <a href="/products/<c:out value="${currentCategory}"/>/<c:out value="${currentPage - 1}"/>"
                                   aria-label="Previous"
                                   <c:if test="${currentPage le 1}">disabled="disabled" </c:if> >
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>

                            <c:forEach begin="0"
                                       end="${(totalSize % productsPerPage) eq 0 ? (totalSize / productsPerPage) -1 : (totalSize / productsPerPage)}"
                                       varStatus="loop">
                                <li <c:if test="${(loop.index + 1) eq currentPage}"> class="active" </c:if>>
                                    <a href="/products/<c:out value="${currentCategory}/${loop.index + 1}"/>">
                                    <span><c:out value="${loop.index + 1}"/>
                                        <c:if test="${(loop.index + 1) eq currentPage}"> <span
                                                class="sr-only">(current)</span> </c:if>
                                    </span>
                                    </a>
                                </li>
                                <c:set var="totalPages" value="${loop.index + 1}"/>
                            </c:forEach>
                            <li>
                                <a href="/products/<c:out value="${currentCategory}"/>/<c:out value="${currentPage + 1}"/>"
                                   aria-label="Next"
                                   <c:if test="${totalPages le currentPage}">disabled="disabled" </c:if> >
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>

            </c:when>

            <c:otherwise>
                <h3>Prekių nerasta.</h3>
                <p>Taip nutiko, nes neradome prekių pagal jūsų pasirinkimus arba įvyko sistemos klaida.</p>
                <p>Bandykite pakeisti paieškos pasirinkimus ir bandykite vėl.</p>
            </c:otherwise>

        </c:choose>


    </div>
    </div>

</customtags:products-main>