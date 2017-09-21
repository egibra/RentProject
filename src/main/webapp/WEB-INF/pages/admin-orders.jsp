<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:adminTemplate pageName="orders">
    <script src="../../resources/js/admin-orders.js" type="text/javascript"></script>
    <customtags:adminModal>
        <!-- modal body -->

    </customtags:adminModal>
    <div class="row">
        <div class="col-xs-12">
            <table class="table table-condensed sortable" data-toggle="table" data-detail-view="true"
                   data-detail-formatter="detailFormatter">
                <thead>
                <tr>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.order.start.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.order.end.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.order.price.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('name')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('lastName')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('email.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.order.phone.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.order.address.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.order.state.label')"/></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}" varStatus="loop">
                    <tr class="table-row" data-id="${order.nr}">
                        <td><c:out value="${order.startDate}"/></td>
                        <td><c:out value="${order.returnDate}"/></td>
                        <td><c:out value="${order.totalPrice}"/></td>
                        <c:choose>
                            <c:when test="${order.user != null}">
                                <td><c:out value="${order.user.firstName}"/></td>
                                <td><c:out value="${order.user.lastName}"/></td>
                                <td><c:out value="${order.user.email}"/></td>
                            </c:when>
                            <c:otherwise>
                                <td><c:out value="${order.orderUserDetails.firstName}"/></td>
                                <td><c:out value="${order.orderUserDetails.lastName}"/></td>
                                <td><c:out value="${order.orderUserDetails.email}"/></td>
                            </c:otherwise>
                        </c:choose>
                        <td><c:out value="${order.phoneNumber}"/></td>
                        <td><c:out value="${order.address}"/></td>
                        <td><select class="form-inline state-select-list" data-id="${order.nr}">
                                <c:forEach var="state" items="${states}" varStatus="loop">
                                    <option <c:if test="${order.state.id == state.id}">selected</c:if> value="${state.id}">${state.name}</option>
                                </c:forEach>
                            </select>
                            <a class="save-state-btn table-btn" data-id="${order.nr}"><span
                                    class="glyphicon glyphicon-floppy-disk"
                                    aria-hidden="true"></span></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</customtags:adminTemplate>