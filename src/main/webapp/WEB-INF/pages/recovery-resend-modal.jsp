<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="modal fade" id="recovery-modal" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="margin-bottom: 20px;">
                <h1 style="font-weight: 500; padding-left: 20px; color:black;" class="modal-title">
                    <spring:eval expression="@environment.getProperty('recovery.resend.modal.header')"/>
                </h1>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span style="font-size: 20px; font-weight: lighter" aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>
                    <spring:eval expression="@environment.getProperty('recovery.resend.modal.body')"/>
                </p>
                <div class="form-group">
                    <label for="recoveryEmail"><spring:eval expression="@environment.getProperty('email.label')"/></label>
                    <input type="email" name="recoveryEmail" id="recoveryEmail" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button id="recoveryEmailButton" type="button" class="btn btn-primary">
                    <spring:eval expression="@environment.getProperty('send')"/>
                </button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    <spring:eval expression="@environment.getProperty('close')"/>
                </button>
            </div>
        </div>
    </div>
</div>