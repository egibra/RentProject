<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:pageTemplate>

    <div class="container text-center">
        <h1 class="glyphicon glyphicon-ok-circle text-success"></h1>
        <h1>${message}</h1>
        <br/>
        <p>
            <spring:eval expression="@environment.getProperty('verified.directed')"/>
            <span class="timer">5</span> s
        </p>
        <p><spring:eval expression="@environment.getProperty('verified.move.home')"/></p>
    </div>

</customtags:pageTemplate>

<script>
    function redirectAfterTime() {
        var start = 5

        setInterval(function () {
            $('.timer').text(start);
            if (start > 0) start = start - 1;
        }, 1000);


        setTimeout(function () {
            window.location.href = "/";
        }, 7000);
    }
    redirectAfterTime();
</script>