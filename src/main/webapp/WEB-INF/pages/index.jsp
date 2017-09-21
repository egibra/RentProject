<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:pageTemplate>
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">

            <div class="item active">
                <div class="jumbotron banner" id="banner1">
                    <div class="container">
                        <h1><spring:eval expression="@environment.getProperty('index.banner.first.header')"/></h1>
                        <h3><spring:eval expression="@environment.getProperty('index.banner.first.message')"/></h3>
                    </div>
                </div>
            </div>

            <div class="item">
                <div class="jumbotron banner" id="banner2">
                    <div class="container">
                        <h1><spring:eval expression="@environment.getProperty('index.banner.second.header')"/></h1>
                        <h3><spring:eval expression="@environment.getProperty('index.banner.second.message')"/></h3>
                    </div>
                </div>
            </div>

            <div class="item">
                <div class="jumbotron banner" id="banner3">
                    <div class="container">
                        <h1><spring:eval expression="@environment.getProperty('index.banner.third.header')"/></h1>
                        <h3><spring:eval expression="@environment.getProperty('index.banner.third.message')"/></h3>
                    </div>
                </div>
            </div>

        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <div class="jumbotron about-container">
        <div class="container" id="about">
            <h1><spring:eval expression="@environment.getProperty('index.about.header')"/></h1>
            <div class="row">
                <div class="col-xs-12 col-md-4">
                    <div class="well">
                        <div class="about-sign"><span class="glyphicon glyphicon-info-sign"></span></div>
                        <h2 class="text-center"><spring:eval expression="@environment.getProperty('index.about.first.header')"/></h2>
                        <p class="text-justify about-text">
                            <spring:eval expression="@environment.getProperty('index.about.first.message.first')"/>
                        </p>
                    </div>
                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="well">
                        <div class="about-sign"><span class="glyphicon glyphicon-thumbs-up"></span></div>
                        <h2 class="text-center">
                            <spring:eval expression="@environment.getProperty('index.about.second.header')"/>
                        </h2>
                        <p class="text-justify about-text">
                            <spring:eval expression="@environment.getProperty('index.about.second.message.first')"/>
                        </p>
                        <p class="text-justify about-text">
                            <spring:eval expression="@environment.getProperty('index.about.second.message.second')"/>
                        </p>
                    </div>
                </div>
                <div class="col-xs-12 col-md-4">
                    <div class="well">
                        <div class="about-sign"><span class="glyphicon glyphicon-map-marker"></span></div>
                        <h2 class="text-center">
                            <spring:eval expression="@environment.getProperty('index.about.third.header')"/>
                        </h2>
                        <p class="text-justify about-text">
                            <spring:eval expression="@environment.getProperty('index.about.third.message.first')"/>
                        </p>
                        <p class="text-justify about-text">

                            <spring:eval expression="@environment.getProperty('index.about.third.message.second')"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</customtags:pageTemplate>
<jsp:include page="footer.jsp"/>