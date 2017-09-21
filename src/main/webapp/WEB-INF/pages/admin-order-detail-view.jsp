<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<ul>
    <c:forEach var="orderLine" items="${orderLines}" varStatus="loop">
        <li>${orderLine.quantity}x - ${orderLine.product.name}</li>
    </c:forEach>
</ul>