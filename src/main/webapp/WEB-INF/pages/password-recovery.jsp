<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:pageTemplate>

    <div class="password-recovery">
        <h1><spring:eval expression="@environment.getProperty('password.recovery.header')"/></h1>

        <c:if test="${not empty errors}">

            <div class="alert alert-danger" role="alert">
                <c:forEach var="currentError" items="${errors}" varStatus="loop">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span><c:out value="${currentError}"/></span>
                    <br/>
                </c:forEach>
            </div>

        </c:if>

        <br/>
        <p>Email: <strong>${user.email}</strong></p>

        <form action="/password-recovery" method="post">
            <input class="form-control" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input class="form-control" type="hidden" name="email" value="${user.email}"/>
            <input class="form-control" type="hidden" name="token" value="${param.token}"/>

            <div class="form-group">
                <label for="newPassword"><spring:eval expression="@environment.getProperty('password.recovery.new.password')"/></label>
                <input type="password" name="newPassword" id="newPassword" class="form-control">
            </div>

            <div class="form-group">
                <label for="passwordConfirm"><spring:eval expression="@environment.getProperty('password.recovery.repeat.new.password')"/></label>
                <input type="password" name="passwordConfirm" id="passwordConfirm" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary"><spring:eval expression="@environment.getProperty('password.recovery.confirm')"/></button>
        </form>

    </div>

</customtags:pageTemplate>