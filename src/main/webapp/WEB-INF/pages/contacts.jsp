<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:pageTemplate>
    <head>
        <link rel="stylesheet" type="text/css" href="../../resources/css/contacts.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/animate.css">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <sec:csrfMetaTags/>
    </head>


    <!-- social media mygtukai, animuoti -->
    <div class="where animated bounceInRight">
        <ul class="social-networks spin-icon">
            <li><a href="https://www.facebook.com/" class="icon-facebook">
                <spring:eval expression="@environment.getProperty('footer.third.box.message.first')"/>
            </a></li>
            <li><a href="https://github.com/meow12/RentProject" class="icon-github">
                <spring:eval expression="@environment.getProperty('footer.third.box.message.second')"/>
            </a></li>
            <li><a href="https://instagram.com" class="icon-instagram">
                <spring:eval expression="@environment.getProperty('footer.third.box.message.third')"/>
            </a></li>
        </ul>
    </div>

    <!-- pirmo miesto informacija -->
    <div class="parent" onmouseenter="showSecondImage()" onmouseleave="hideSecondImage()">
        <div id="first">
            <h1 class="text-box "><spring:eval expression="@environment.getProperty('main.city')"/></h1>
        </div>

        <div id="second">
            <ul class="kontaktai-ul">
                <li><spring:eval expression="@environment.getProperty('main.address')"/>,</li>
                <li><spring:eval expression="@environment.getProperty('main.city')"/>,
                    <spring:eval expression="@environment.getProperty('main.country')"/></li>
                <li><spring:eval expression="@environment.getProperty('main.phone')"/></li>
            </ul>
        </div>
    </div>

    <!-- antro miesto informacija -->
    <div class="parent " onmouseenter="showFourthImage()" onmouseleave="hideFourthImage()">
        <div id="third">
            <h1 class="text-box "><spring:eval expression="@environment.getProperty('city.second')"/></h1>

        </div>

        <div id="four">
            <ul class="kontaktai-ul">
                <li><spring:eval expression="@environment.getProperty('address.second')"/>,</li>
                <li><spring:eval expression="@environment.getProperty('city.second')"/>,
                    <spring:eval expression="@environment.getProperty('main.country')"/></li>
                <li><spring:eval expression="@environment.getProperty('main.phone')"/></li>
            </ul>
        </div>
    </div>


    <div class="container-fluid send-letter" id="send-letter">
        <fieldset>
            <legend>
                <spring:eval expression="@environment.getProperty('contacts.send.letter.header')"/>
            </legend>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="email"><spring:eval expression="@environment.getProperty('email.label')"/></label>
                    <input type="text" name="email" id="email" class="form-control"
                           value="<c:out value="${loggedInUser.email}"/>">
                </div>

                <div class="form-group">
                    <label for="subject"><spring:eval expression="@environment.getProperty('contacts.send.letter.subject.label')"/></label>
                    <input type="text" name="subject" id="subject" class="form-control">
                </div>

                <div class="form-group">
                    <label for="message"><spring:eval expression="@environment.getProperty('contacts.send.letter.message.label')"/></label>
                    <textarea rows="6" name="message" id="message" class="form-control"></textarea>
                </div>


                <a class="btn btn-primary" id="submit-letter"><spring:eval expression="@environment.getProperty('send')"/></a>
            </div>

        </fieldset>
    </div>



    <script>
        function showSecondImage() {
            document.getElementById('second').style.opacity = 1;
        }
        function hideSecondImage() {
            document.getElementById('second').style.opacity = 0;
        }
        function showFourthImage() {
            document.getElementById('four').style.opacity = 1;
        }
        function hideFourthImage() {
            document.getElementById('four').style.opacity = 0;
        }
    </script>


</customtags:pageTemplate>
<jsp:include page="footer.jsp"/>
<script src="../../resources/js/contacts.js" type="text/javascript"></script>
