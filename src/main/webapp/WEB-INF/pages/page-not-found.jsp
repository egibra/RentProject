<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:products-main>
    <div class="container">
        <h1><spring:eval expression="@environment.getProperty('page.not.found.message')"/></h1>
    </div>
</customtags:products-main>