<%@tag pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="modal fade" id="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal-label"></h4>
            </div>
            <div class="modal-body">
                <jsp:doBody />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <spring:eval expression="@environment.getProperty('close')" />
                </button>
                <button type="button" class="btn btn-primary" id="save-button" data-action="">
                    <spring:eval expression="@environment.getProperty('save')" />
                </button>
            </div>
        </div>
    </div>
</div>