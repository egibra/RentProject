<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
    <sec:csrfMetaTags/>
</head>
<customtags:pageTemplate>

    <style>
        .modal-header, .modal h1, .modal p, .modal {
            text-align: left !important;
        }
    </style>

    <div class="container text-center">

        <c:if test="${param.success != null }">
            <div class="alert alert-success alert-dismissible" style="margin-top: 20px" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <strong>Laiškas išsiūstas sėkmingai.</strong>
            </div>
        </c:if>

        <h1 class="glyphicon glyphicon-remove text-danger"></h1>
        <h1>Klaida keičiant slaptažodį.</h1>
        <p><b>Klaida: </b><c:out value="${message}"/></p>
        <br/>

        <p>Spauskite <a data-toggle="modal" data-target="#recovery-modal" role="button">čia</a>, jei norite, jog būtų
            persiūstas
            slaptažodžio keitimo laiškas.</p>
        <p>Spauskite <a href="/">čia</a>, kad sugrįžtumėte į pradinį puslapį.</p>

        <jsp:include page="recovery-resend-modal.jsp" flush="true"/>

    </div>

</customtags:pageTemplate>

<script src="../../resources/js/user-form.js" type="text/javascript"></script>