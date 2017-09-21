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
        <h1><spring:eval expression="@environment.getProperty('order.confirmation.success.header')"/></h1>
    </div>

</customtags:pageTemplate>
<link href="../../resources/css/daterangepicker.css" rel="stylesheet" type="text/css"/>
<script src="../../resources/js/moment.min.js" type="text/javascript"></script>
<script src="../../resources/js/daterangepicker.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/js/orders.js"></script>
