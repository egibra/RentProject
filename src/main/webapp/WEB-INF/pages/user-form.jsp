<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <link rel="stylesheet" type="text/css" href="../../resources/css/user-form-style.css">
    <script src="../../resources/jquery/jquery-2.2.0.js" type="text/javascript"></script>
    <sec:csrfMetaTags/>
    <script src="../../resources/js/user-form.js" type="text/javascript"></script>
</head>
<customtags:pageTemplate>

    <!-- USER FORM MENU -->
    <div class="form">

    <ul class="tab-group">
        <li class="tab">
            <a href="#signup">
                <spring:eval expression="@environment.getProperty('registration')"/>
            </a>
        </li>
        <li class="tab active">
            <a href="#login">
                <spring:eval expression="@environment.getProperty('login')"/>
            </a>
        </li>
    </ul>

    <!-- LOGIN -->
    <div class="tab-content">

        <div id="login">
            <c:if test="${param.error != null }">

                <div class="alert alert-danger" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <span>${sessionScope.errorMessage}</span>
                </div>

            </c:if>

            <c:if test="${param.success != null }">
                <div class="alert alert-success alert-dismissible" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <strong><spring:eval expression="@environment.getProperty('email.success')"/></strong>
                </div>
            </c:if>

            <h1><spring:eval expression="@environment.getProperty('userForm.login.greeting')"/></h1>

            <form action="/user-form" method="post">
                <input class="form-control" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <div class="field-wrap">
                    <label>
                        <spring:eval expression="@environment.getProperty('email.label')"/>
                        <span class="req">*</span>
                    </label>
                    <input type="email" id="username" name="username" required autocomplete="off"/>
                </div>

                <div class="field-wrap">
                    <label>
                        <spring:eval expression="@environment.getProperty('password.label')"/>
                        <span class="req">*</span>
                    </label>
                    <input type="password" id="password" name="password" required autocomplete="off"/>
                </div>

                <p class="forgot">
                    <a data-toggle="modal" data-target="#recovery-modal" role="button" href="">
                        <spring:eval expression="@environment.getProperty('userForm.login.forgotPass')"/>
                    </a>
                </p>

                <button class="button button-block">
                    <spring:eval expression="@environment.getProperty('login')"/>
                </button>

            </form>
        </div>

        <!-- SIGN UP -->
        <div id="signup">

            <form id="registration-form" action="/user-form/registration" method="post">
                <input class="form-control" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <c:if test="${not empty regErrors}">

                    <div class="alert alert-danger" role="alert">
                    <c:forEach var="currentError" items="${regErrors}" varStatus="loop">
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        <span><c:out value="${currentError}"/></span>
                        <br />
                    </c:forEach>
                    </div>

                </c:if>
                <div class="top-row">
                    <div class="field-wrap">
                        <label>
                            <spring:eval expression="@environment.getProperty('name')"/>
                            <span class="req">*</span>
                        </label>
                        <input
                            type="text"
                            id="registration-first-name"
                            value="<c:out value="${userForm.firstName}"/>"
                            name="firstName"
                            data-usage="firstName"
                            required autocomplete="off"
                            onfocus=onFocusInputField('#name-error-field',this)
                        />
                        <div class="validation-text-field error-field-neutral" id="name-error-field"></div>
                    </div>

                    <div class="field-wrap">
                        <label>
                            <spring:eval expression="@environment.getProperty('lastName')"/>
                            <span class="req">*</span>
                        </label>
                        <input
                            type="text"
                            id="registration-last-name"
                            value="<c:out
                            value="${userForm.lastName}"/>"
                            name="lastName"
                            data-usage="lastName"
                            required autocomplete="off"
                            onfocus=onFocusInputField('#lastname-error-field',this)
                        />
                        <div class="validation-text-field error-field-neutral" id="lastname-error-field"></div>
                    </div>
                </div>

                <div class="field-wrap">
                    <label>
                        <spring:eval expression="@environment.getProperty('email.label')"/>
                        <span class="req">*</span>
                    </label>
                    <input
                        type="email"
                        id="registration-email"
                        value="<c:out value="${userForm.email}"/>"
                        name="username"
                        data-usage="email"
                        required autocomplete="off"
                        onblur=checkEmailValidity(this.value)
                        onfocus=onFocusInputField('#email-error-field',this)
                    />
                    <div class="validation-text-field error-field-neutral" id="email-error-field"></div>
                </div>

                <div class="field-wrap">
                    <label>
                        <spring:eval expression="@environment.getProperty('password.label')"/>
                        <span class="req">*</span>
                    </label>
                    <input
                        type="password"
                        id="registration-password"
                        name="password"
                        data-usage="password"
                        required autocomplete="off"
                        onblur=checkPasswordValidity(this.value)
                        oninput=onPasswordChange(this.value)
                        onfocus=onFocusInputField('#pwd-error-field',this)
                    />
                    <div class="validation-text-field error-field-neutral" id="pwd-error-field"></div>
                </div>
                <div class="field-wrap">
                    <label>
                        <spring:eval expression="@environment.getProperty('repeat.password.label')"/>
                        <span class="req">*</span>
                    </label>
                    <input
                        type="password"
                        id="registration-password-confirm"
                        name="passwordConfirm"
                        data-usage="passwordConfirm"
                        required autocomplete="off"
                        onblur=checkIfPasswordsMatch(this.value)
                        onfocus=onFocusInputField('#pwd-confirm-error-field',this)
                    />
                    <div class="validation-text-field error-field-neutral" id="pwd-confirm-error-field"></div>
                </div>

                <button type="button" id='button-if-js-enabled' class="button button-block" onClick=onSubmitRegistration()>
                    <spring:eval expression="@environment.getProperty('register')"/>
                </button>
                <noscript>
                    <button type="submit" class="button button-block">
                        <spring:eval expression="@environment.getProperty('register')"/>
                    </button>
                    <style>
                    #button-if-js-enabled {
                        display: none
                    }
                    </style>
                </noscript>
            </form>

        </div>

    </div><!-- tab-content -->
</div> <!-- /form -->

    <jsp:include page="verification-resend-modal.jsp" flush="true"/>
    <jsp:include page="recovery-resend-modal.jsp" flush="true"/>

</customtags:pageTemplate>

<c:if test="${isRegistration eq \"registrationCheck\"}">
    <script>
        function showRegistration(){
            $('.tab-group li:first-child').addClass('active');
            $('.tab-group li:last-child').removeClass('active');

            $('#login').hide();
            $('#signup').show();

            var $inputs = $('#signup input');
            $.each($inputs, function() {
               var $this = $(this);
               var label = $this.prev('label');

                if($this.val() !== ''){
                    label.addClass('active');
                }
            });

            <c:forEach var="field" items="${regFieldErrors}" varStatus="loop">
                var f = '${field}';
                $('input[data-usage=' + f + ']').addClass('warning-border');
            </c:forEach>
        }
        showRegistration();
    </script>
</c:if>
