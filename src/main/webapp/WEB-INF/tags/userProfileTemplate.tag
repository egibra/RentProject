<%@ tag pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:pageTemplate>
    <head>
        <script src="../../resources/js/profile.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../../resources/css/profile.css">
    </head>

    <div class="container">
        <div class="row profile">
            <div class="col-md-3">
                <div class="profile-sidebar">
                    <!-- SIDEBAR USERPIC -->
                    <div class="profile-userpic">
                        <img src="../../resources/img/profile/default-avatar.png" class="img-responsive" alt="">
                    </div>
                    <!-- END SIDEBAR USERPIC -->

                    <!-- SIDEBAR USER TITLE -->
                    <div class="profile-usertitle">
                        <div class="profile-usertitle-name">
                            <c:out value="${loggedInUser.firstName} ${loggedInUser.lastName}" />
                        </div>
                        <div class="profile-usertitle-job">
                            ${loggedInUser.role}
                        </div>
                    </div>
                    <!-- END SIDEBAR USER TITLE -->

                    <!-- SIDEBAR MENU -->
                    <div class="profile-usermenu">
                        <ul class="nav">
                            <li>
                                <a href="/user/profile/settings">
                                    <i class="glyphicon glyphicon-home"></i>
                                    <spring:eval expression="@environment.getProperty('userProfile.menu.first')" />
                                </a>
                            </li>
                            <li>
                                <a href="/user/profile/orders">
                                    <i class="glyphicon glyphicon-folder-open"></i>
                                    <spring:eval expression="@environment.getProperty('userProfile.menu.second')" />
                                </a>
                            </li>
                            <li>
                                <a href="/user/profile/history">
                                    <i class="glyphicon glyphicon-folder-close"></i>
                                    <spring:eval expression="@environment.getProperty('userProfile.menu.third')" />
                                </a>
                            </li>
                        </ul>
                    </div>
                    <!-- END MENU -->
                </div>
            </div>
            <div class="col-md-9">
                <div class="profile-content">
                    <jsp:doBody />
                </div>
            </div>
        </div>
    </div>

</customtags:pageTemplate>