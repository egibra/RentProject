<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
    <sec:csrfMetaTags/>
</head>

<customtags:pageTemplate>
    <div class="container">
    <h2 class="text-center"><spring:eval expression="@environment.getProperty('shoppingCart')"/></h2>

    <div id="cart-empty" class="<c:if test="${!empty(sessionScope.shoppingCart)}">hidden</c:if>">
        <p><spring:eval expression="@environment.getProperty('shoppingCart.empty')"/></p>
        <p>
            <spring:eval expression="@environment.getProperty('shoppingCart.empty.message')"/>
        </p>
    </div>

    <c:if test="${!empty(sessionScope.shoppingCart)}">
        <div id="cart-not-empty">
            <h4>
                <spring:eval expression="@environment.getProperty('shoppingCart.notEmpty.header')"/>
            </h4>
            <p> <span class="glyphicon glyphicon-info-sign"></span>
                <spring:eval expression="@environment.getProperty('shoppingCart.notEmpty.explain.first.part.first')"/>
                <span style="color:#337ab7" class="glyphicon glyphicon-remove"></span>
                <spring:eval expression="@environment.getProperty('shoppingCart.notEmpty.explain.first.part.second')"/>
            </p>
            <p > <span class="glyphicon glyphicon-info-sign"></span>
                <spring:eval expression="@environment.getProperty('shoppingCart.notEmpty.explain.second.part.first')"/>
                <span style="color:#337ab7" class="glyphicon glyphicon-save"></span>
                <spring:eval expression="@environment.getProperty('shoppingCart.notEmpty.explain.second.part.second')"/>
            </p>
            <br />
            <div>
                <a href="#" class="btn btn-success">
                    <spring:eval expression="@environment.getProperty('shoppingCart.order')"/>
                </a>
            </div>

            <hr />
        </div>

        <div class="cart">
        <c:forEach var="product" items="${sessionScope.shoppingCart}" varStatus="loop">

            <div class="col-md-12 col-xs-12 cart-listing">
                <a class="cart-remove glyphicon glyphicon-remove" data-id="${product.product.id}"></a>
                <a class="cart-update hidden glyphicon glyphicon-save" data-id="${product.product.id}"
                   data-quantity="${product.quantity}"></a>

                <div class="col-md-3 col-sm-3 col-xs-6 cart-image">
                    <c:choose>
                        <c:when test="${product.product.mainPicture == null}">
                            <c:set var="image"
                                   value="${pageContext.request.contextPath}/resources/img/database/No-image.png"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="image"
                                   value="/image/${product.product.mainPicture.fileName}"/>
                        </c:otherwise>
                    </c:choose>

                    <img class="img-responsive" src="<c:out value="${image}"/>"
                         alt="<c:out value="${product.product.name}"/>"/>
                </div>
                <div class="cols-md-9 col-sm-9 col-xs-6 cart-left-side">
                    <div class="col-md-8 col-sm-8 col-xs-12 cart-info">

                        <div class="cart-name scroll-bar">
                            <h3>
                                    ${product.product.name}
                            </h3>
                        </div>
                        <div class="cart-description scroll-bar">
                            <p class="hidden-xs">
                                    ${product.product.longDescription}
                            </p>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-12 cart-quantity">
                        <h4 class="hidden-xs">
                            <spring:eval expression="@environment.getProperty('amount')"/>
                        </h4>

                        <p>
                            <span class="hidden-lg hidden-sm hidden-md">
                                <spring:eval expression="@environment.getProperty('amount')"/>
                            </span>
                            <input maxlength="3" minlength="1" class="cart-quantity-input" type="text" value="${product.quantity}"/>
                        </p>

                    </div>
                    <div class="col-md-2 col-sm-2 col-xs-12 cart-price">
                        <h4 class="hidden-xs">
                            <spring:eval expression="@environment.getProperty('price')"/>
                        </h4>
                        <p>
                            <span class="hidden-lg hidden-sm hidden-md">
                                <spring:eval expression="@environment.getProperty('price')"/>
                            </span>
                            <fmt:formatNumber
                                    var="price"
                                    maxFractionDigits="2"
                                    value="${(product.product.pricePerDay -  (product.product.discount / 100 * product.product.pricePerDay))}"/>
                            <span class="cart-price-number" data-price="${price}"><fmt:formatNumber
                                    maxFractionDigits="2"
                                    value="${fn:replace(price, \",\", \".\") * product.quantity}"/></span> &#8364
                        </p>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>

        </c:forEach>
        </div>
    </c:if>

    <c:if test="${!empty(sessionScope.shoppingCart)}">
        <div class="order">
            <form name="order" method="POST" action="order">
                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <h3 class="order-panel-header">Nuomos periodas</h3>
                        <div class="form-group">
                            <label for="rental-period">Pasirinkite</label>
                            <input name="rentalPeriod" type="text" class="form-control" id="rental-period">
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-6">
                        <h3 class="order-panel-header">Užsakymo suma</h3>
                        <div id="total-price"></div>
                    </div>
                </div>

                    <div class="row">
                        <div class="col-xs-12 col-sm-6">
                            <h3 class="order-panel-header">Jūsų duomenys</h3>
                            <div class="form-group">
                                <label for="first-name">Vardas</label>
                                <input name="firstName" type="text" class="form-control" id="first-name"
                                       required <c:if test="${loggedInUser != null}">disabled</c:if>
                                       value="<c:if test="${loggedInUser != null}">${loggedInUser.firstName}</c:if>">
                            </div>
                            <div class="form-group">
                                <label for="last-name">Pavardė</label>
                                <input name="lastName" type="text" class="form-control" id="last-name" required
                                       <c:if test="${loggedInUser != null}">disabled</c:if>
                                       value="<c:if test="${loggedInUser != null}">${loggedInUser.lastName}</c:if>">
                            </div>
                            <div class="form-group">
                                <label for="email">Elektroninis paštas</label>
                                <input name="email" type="text" class="form-control" id="email" required
                                       <c:if test="${loggedInUser != null}">disabled</c:if>
                                       value="<c:if test="${loggedInUser != null}">${loggedInUser.email}</c:if>">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <h3 class="order-panel-header">Kontaktinė informacija</h3>
                            <div class="form-group">
                                <label for="address">Adresas</label>
                                <input name="address" type="text" class="form-control" id="address" required
                                       value="<c:if test="${loggedInUser != null}">${loggedInUser.address}</c:if>">
                            </div>
                            <div class="form-group">
                                <label for="phone-number">Telefonas</label>
                                <input name="phoneNumber" type="text" class="form-control" id="phone-number" required
                                       value="<c:if test="${loggedInUser != null}">${loggedInUser.phoneNumber}</c:if>">
                            </div>
                        </div>
                    </div>

                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <h3 class="order-panel-header">Apmokėjimo būdas</h3>
                        <div class="radio">
                            <label>
                                <input type="radio" name="payment-type" value="cash" checked>
                                Grynieji
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="payment-type" value="paypal">
                                Paypal
                            </label>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <sec:csrfInput/>
                    <button type="submit" id="order-btn" class="btn btn-success">Užsakyti</button>
                </div>
            </form>
        </div>
     </div>
    </c:if>

</customtags:pageTemplate>
<link href="../../resources/css/daterangepicker.css" rel="stylesheet" type="text/css"/>
<script src="../../resources/js/moment.min.js" type="text/javascript"></script>
<script src="../../resources/js/daterangepicker.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/orders.js"></script>
