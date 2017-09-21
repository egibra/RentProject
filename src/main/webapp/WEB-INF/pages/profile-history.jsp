<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:userProfileTemplate>

    <div class="container-fluid">

        <div class="col-md-12">
            <h2><spring:eval expression="@environment.getProperty('profile.history.header')"/></h2>
            <p>
                <spring:eval expression="@environment.getProperty('profile.history.body')"/>
            </p>
        </div>

        <table class="table table-condensed sortable orders-table">
            <thead>
            <tr>
                <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.order.start.label')"/></th>
                <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.order.end.label')"/></th>
                <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.order.price.label')"/></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="order" items="${orders}" varStatus="loop">
                <tr data-toggle="collapse" data-target="#table-item-${order.nr}" class="accordion-toggle table-row">
                    <td><c:out value="${order.startDate}"/></td>
                    <td><c:out value="${order.returnDate}"/></td>
                    <td><c:out value="${order.totalPrice}"/></td>
                </tr>
                <tr><td colspan="3" class="hidden-row">
                    <div id="table-item-${order.nr}" class="accordian-body collapse">
                        <ul>
                            <c:forEach var="orderLine" items="${order.orderLineList}" varStatus="loop">
                                <li>${orderLine.quantity}x - ${orderLine.product.name}</li>
                            </c:forEach>
                        </ul>
                    </div></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

</customtags:userProfileTemplate>