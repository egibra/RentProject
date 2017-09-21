<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:userProfileTemplate>

    <div class="container-fluid">
        <h1><spring:eval expression="@environment.getProperty('profile.main.header')"/></h1>
    </div>

</customtags:userProfileTemplate>