<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:userProfileTemplate>

    <div class="container-fluid">

        <div class="col-md-12">
            <h2><spring:eval expression="@environment.getProperty('profile.settings.header')"/></h2>
            <p>
                <spring:eval expression="@environment.getProperty('profile.settings.body')"/>
            </p>
        </div>

        <div class="clearfix"></div>

        <c:if test="${not empty errors}">

            <div class="alert alert-danger" role="alert">
                <c:forEach var="currentError" items="${errors}" varStatus="loop">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span><c:out value="${currentError}"/></span>
                    <br/>
                </c:forEach>
            </div>

        </c:if>

        <c:if test="${param.success != null }">
            <div class="alert alert-success alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <strong><spring:eval expression="@environment.getProperty('profile.settings.change.success')"/></strong>
            </div>
        </c:if>

        <form method="post" action="/user/profile/settings">


            <input class="form-control" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <!-- NAME, LAST NAME, EMAIL -->
            <div class="col-md-6">
                <h3>
                    <spring:eval expression="@environment.getProperty('profile.settings.left.top.header')"/>
                </h3>
                <div class="form-group">
                    <label for="firstName">
                        <spring:eval expression="@environment.getProperty('name')"/>
                    </label>
                    <input type="text" name="firstName" id="firstName" class="form-control"
                           value="<c:out value="${loggedInUser.firstName}"/>">
                </div>

                <div class="form-group">
                    <label for="lastName">
                        <spring:eval expression="@environment.getProperty('lastName')"/>
                    </label>
                    <input type="text" name="lastName" id="lastName" class="form-control"
                           value="<c:out value="${loggedInUser.lastName}"/>">
                </div>
                <div class="form-group">
                    <label for="email">
                        <spring:eval expression="@environment.getProperty('email.label')"/>
                    </label>
                    <input type="text" name="email" id="email" class="form-control" disabled="disabled"
                           value="<c:out value="${loggedInUser.email}"/>">
                </div>
            </div>

            <div class="col-md-6 col-xs-12 col-sm-12 pull-left">
                <h3>
                    <spring:eval expression="@environment.getProperty('profile.settings.right.top.header')"/>
                </h3>
                <div class="form-group">
                    <label for="phoneNumber">
                        <spring:eval expression="@environment.getProperty('profile.settings.right.top.first.label')"/>
                    </label>
                    <input type="text" name="phoneNumber" id="phoneNumber" class="form-control"
                           value="<c:out value="${loggedInUser.phoneNumber}"/>">
                </div>

                <div class="form-group">
                    <label for="address">
                        <spring:eval expression="@environment.getProperty('profile.settings.right.top.second.label')"/>
                    </label>
                    <input type="text" name="address" id="address" class="form-control"
                           value="<c:out value="${loggedInUser.address}"/>">
                </div>
            </div>

            <div class="clearfix"></div>

            <div class="col-md-6">
                <h3>
                    <spring:eval expression="@environment.getProperty('profile.settings.left.bottom.header')"/>
                </h3>
                <div class="form-group">
                    <label for="password">
                        <spring:eval expression="@environment.getProperty('profile.settings.left.bottom.first.label')"/>
                    </label>
                    <input type="password" name="password" id="password" class="form-control">
                </div>

                <div class="form-group">
                    <label for="newPassword">
                        <spring:eval expression="@environment.getProperty('profile.settings.left.bottom.second.label')"/>
                    </label>
                    <input type="password" name="newPassword" id="newPassword" class="form-control">
                </div>

                <div class="form-group">
                    <label for="newPasswordConfirm">
                        <spring:eval expression="@environment.getProperty('profile.settings.left.bottom.third.label')"/>
                    </label>
                    <input type="password" name="newPasswordConfirm" id="newPasswordConfirm" class="form-control">
                </div>
            </div>


            <div class="col-md-12">
                <button id="submit-settings" type="submit" class="btn btn-default">
                    <spring:eval expression="@environment.getProperty('profile.settings.save')"/>
                </button>
            </div>
        </form>
    </div>

</customtags:userProfileTemplate>