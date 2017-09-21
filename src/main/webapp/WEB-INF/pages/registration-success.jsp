<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:pageTemplate>

    <div class="container text-center">
        <h1 class="glyphicon glyphicon-ok-circle text-success"></h1>
        <h1><spring:eval expression="@environment.getProperty('registration.success.header')"/></h1>
        <p><spring:eval expression="@environment.getProperty('registration.success.body')"/></p>
        <p><spring:eval expression="@environment.getProperty('verified.move.home')"/></p>
    </div>

</customtags:pageTemplate>