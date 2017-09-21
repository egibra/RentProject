<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:pageTemplate>
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="../../resources/css/howtostyle.css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
    </head>

    <section id="about" class="paralla-section">
        <div class="container">
            <div class="row">

                <div class="about-img col-md-6 col-sm-12">
                    <img src="../../resources/img/howto1.jpg" class="img-responsive" alt="about img 1">
                </div>

                <div class="col-md-6 col-sm-12">
                    <div class="about-des">
                        <h4><spring:eval expression="@environment.getProperty('how.to.first.header')"/></h4>
                        <h3><spring:eval expression="@environment.getProperty('how.to.first.sub-header')"/></h3>
                        <p class="text-justify">
                            <spring:eval expression="@environment.getProperty('how.to.first.message')"/>
                        </p>
                    </div>
                </div>

            </div>

            <div class="row">

                <div class="col-md-6 col-sm-12">
                    <div class="about-des">
                        <h4><spring:eval expression="@environment.getProperty('how.to.second.header')"/></h4>
                        <h3><spring:eval expression="@environment.getProperty('how.to.second.sub-header')"/></h3>
                        <p class="text-justify">
                            <spring:eval expression="@environment.getProperty('how.to.second.message')"/>
                        </p>
                    </div>
                </div>

                <div class="about-img col-md-6 col-sm-12">
                    <img src="../../resources/img/howto2.jpg" class="img-responsive" alt="about img 2">
                </div>

            </div>
        </div>
    </section>

</customtags:pageTemplate>
<jsp:include page="footer.jsp"/>
