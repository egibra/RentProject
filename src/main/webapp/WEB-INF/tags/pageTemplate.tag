<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../../resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/style.css" rel="stylesheet" type="text/css" />
    <link href="../../resources/css/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
    <script src="../../resources/jquery/jquery-2.2.0.js" type="text/javascript"></script>
    <script src="../../resources/js/bootstrap.js" type="text/javascript"></script>
    <script src="../../resources/js/sweetalert2.min.js" type="text/javascript"></script>
</head>

<body>
<div class="container-fluid no-padding">

    <header>

        <nav class="navbar navbar-inverse" >
            <div class="container">

                <!-- LOGO -->
                <div class="navbar-header col-md-6">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#mainNavBar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="/">
                        <img class="img-responsive" alt="BeHero.lt" src="../../resources/img/logo.png">
                    </a>
                </div>

                <!-- MENU -->
                <div class="header-right col-md-6">

                    <!-- REGISTRATION/LOGIN -->
                    <div class="header-right-top">
                        <nav>
                            <c:set var="cart" value="0" />

                            <c:forEach var="product" items="${sessionScope.shoppingCart}" varStatus="loop">
                                <c:set var="cart" value="${cart + product.quantity}" />
                            </c:forEach>

                            <a href="/shopping-cart"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true">
                                </span><span id="cart-number-items"> <c:out value="${cart}"/>
                                </span><spring:eval expression="@environment.getProperty('shoppingCart')" />
                            </a>
                            <!-- Check if user is logged in -->
                            <c:choose>
                                <c:when test="${loggedInUser == null}">
                                    <a href="/user-form">
                                        <spring:eval expression="@environment.getProperty('menuTop.login')" />
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="/user/profile"><c:out value="${loggedInUser.firstName}" /></a>
                                    <form action="/logout" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <button type="submit" class="remove-button">
                                            <spring:eval expression="@environment.getProperty('logout')" />
                                        </button>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </nav>
                    </div>

                    <!-- NAVIGATION MENU -->
                    <div class="header-right-bottom">
                        <div class="collapse navbar-collapse navbar-right" id="mainNavBar">
                            <ul class="nav navbar-nav ">
                                <li><a href="/"><spring:eval expression="@environment.getProperty('menuMain.first')" /></a></li>
                                <li><a href="/products/all"><spring:eval expression="@environment.getProperty('menuMain.second')" /></a></li>
                                <li><a href="/howto"><spring:eval expression="@environment.getProperty('menuMain.third')" /></a></li>
                                <li><a href="/contacts"><spring:eval expression="@environment.getProperty('menuMain.forth')" /></a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </nav>
    </header>

    <jsp:doBody />

</div>

</body>
