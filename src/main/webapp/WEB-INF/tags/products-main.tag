<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:pageTemplate>

    <hr>
    <div class="container">

        <c:if test="${param.error != null }">
            <div class="alert alert-danger" role="alert">
                <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                <span><spring:eval expression="@environment.getProperty('productMain.errorAddingBasket')" /></span>
            </div>
        </c:if>

        <ul class="nav nav-tabs nav-justified">
            <li>
                <a role="button" data-toggle="collapse" href="#categoriesCollapse" aria-expanded="false" aria-controls="categoriesCollapse">
                <spring:eval expression="@environment.getProperty('productMain.categories')" />
                </a>
            </li>
            <li>
                <a role="button" href="/products/all" aria-controls="allProducts">
                    <spring:eval expression="@environment.getProperty('productMain.allProducts')" />
                </a>
            </li>
            <li>
                <a role="button" href="/products/discount" aria-controls="discounts">
                    <spring:eval expression="@environment.getProperty('productMain.discount')" />
                </a>
            </li>
        </ul>


        <div class="collapse" id="categoriesCollapse">
            <div class="well">
                <ul class="list-group categories">
                    <li class="list-group-item">
                        <a href="/products/gopro">
                            <spring:eval expression="@environment.getProperty('productMain.categories.first')" />
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="/products/gaming-consoles">
                            <spring:eval expression="@environment.getProperty('productMain.categories.second')" />
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="/products/cameras">
                            <spring:eval expression="@environment.getProperty('productMain.categories.third')" />
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="/products/drones">
                            <spring:eval expression="@environment.getProperty('productMain.categories.forth')" />
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <jsp:doBody />

</customtags:pageTemplate>
<jsp:include page="../pages/footer.jsp"/>
