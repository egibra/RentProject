<%@tag pageEncoding="UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pageName" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <sec:csrfMetaTags/>
    <link href="../../resources/css/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/admin.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.css" rel="stylesheet"
          type="text/css"/>
    <link href="../../resources/css/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
    <script src="../../resources/jquery/jquery-2.2.0.js" type="text/javascript"></script>
    <script src="../../resources/js/bootstrap.js" type="text/javascript"></script>
    <script src="../../resources/js/admin.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.js"
            type="text/javascript"></script>
    <script src="../../resources/js/sweetalert2.min.js" type="text/javascript"></script>
</head>

<body>
<div class="container-fluid no-padding">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li <c:if test="${pageName.equals('products')}">class="active"</c:if>>
                        <a href="products">
                            <spring:eval expression="@environment.getProperty('adminProfile.menu.first')" />
                        </a>
                    </li>
                    <li <c:if test="${pageName.equals('categories')}">class="active"</c:if>>
                        <a href="categories">
                            <spring:eval expression="@environment.getProperty('adminProfile.menu.second')" />
                        </a>
                    </li>
                    <li <c:if test="${pageName.equals('attributes')}">class="active"</c:if>>
                        <a href="attributes">
                            <spring:eval expression="@environment.getProperty('adminProfile.menu.third')" />
                        </a>
                    </li>
                    <li <c:if test="${pageName.equals('orders')}">class="active"</c:if>>
                        <a href="orders">
                            <spring:eval expression="@environment.getProperty('adminProfile.menu.fourth')" />
                        </a>
                    </li>
                </ul>
                <form class="navbar-form navbar-right" action="/logout" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <button type="submit" class="btn btn-default">
                        <spring:eval expression="@environment.getProperty('logout')" />
                    </button>
                </form>
            </div>
        </div>
    </nav>
    <c:if test="${param.success != null }">
        <div class="row">
            <div class="col-xs-12">
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <strong><spring:eval expression="@environment.getProperty('adminProfile.successAdd')" /></strong>
                </div>
            </div>
        </div>
    </c:if>
    <jsp:doBody/>

</div>

</body>
