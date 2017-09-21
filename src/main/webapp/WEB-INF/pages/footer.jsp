<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<footer>
    <div class="global-footer container-fluid">
        <div class="col-md-4 col-sm-4">
            <ul class="list-unstyled text-center">
                <li><h3><spring:eval expression="@environment.getProperty('footer.first.box.header')"/></h3></li>
                <li><a href="/#about">
                        <spring:eval expression="@environment.getProperty('menuMain.first')"/>
                    </a>
                </li>
                <li><a href="/products/all">
                        <spring:eval expression="@environment.getProperty('menuMain.second')"/>
                    </a>
                </li>
                <li><a href="/howto">
                        <spring:eval expression="@environment.getProperty('menuMain.third')"/>
                    </a>
                </li>
                <li><a href="/contacts">
                        <spring:eval expression="@environment.getProperty('menuMain.forth')"/>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-md-4 col-sm-4">
            <ul class="list-unstyled text-center">
                <li><h3><spring:eval expression="@environment.getProperty('menuMain.forth')"/></h3></li>
                <li><a href="/contacts#send-letter">
                        <spring:eval expression="@environment.getProperty('spring.mail.username')"/>
                    </a>
                </li>
                <li><spring:eval expression="@environment.getProperty('main.address')"/></li>
                <li><spring:eval expression="@environment.getProperty('main.phone')"/></li>
            </ul>
        </div>
        <div class="col-md-4 col-sm-4">
            <ul class="list-unstyled text-center">
                <li><h3><spring:eval expression="@environment.getProperty('footer.third.box.header')"/></h3></li>
                <li><a href="https://www.facebook.com/" target="_blank">
                        <spring:eval expression="@environment.getProperty('footer.third.box.message.first')"/>
                    </a>
                </li>
                <li><a href="https://github.com/meow12/RentProject" target="_blank">
                        <spring:eval expression="@environment.getProperty('footer.third.box.message.second')"/>
                    </a>
                </li>
                <li><a href="https://instagram.com" target="_blank">
                        <spring:eval expression="@environment.getProperty('footer.third.box.message.third')"/>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</footer>