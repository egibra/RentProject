<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:adminTemplate pageName="categories">
    <script src="../../resources/js/admin-categories.js" type="text/javascript"></script>
    <customtags:adminModal>
        <!-- modal body -->
        <form id="category-form">
            <div class="form-group">
                <label for="category-name" class="control-label">
                    <spring:eval expression="@environment.getProperty('global.product.name.label')"/>:
                </label>
                <input type="text" class="form-control" name="name" id="category-name" maxlength="16" required>
                <input type="hidden" id="id">
            </div>
        </form>
    </customtags:adminModal>
    <div class="row">
        <div class="col-xs-12 btn-col">
            <button type="button" id="add-button" class="btn btn-primary">
                <spring:eval expression="@environment.getProperty('admin.add.new.label')"/>
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <table class="table table-condensed sortable" data-toggle="table">
                <thead>
                <tr>
                    <th data-sortable="true">
                        <spring:eval expression="@environment.getProperty('global.product.name.label')"/>
                    </th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="category" items="${categories}" varStatus="loop">
                    <tr class="table-row" data-id="${category.id}">
                        <td><c:out value="${category.name}"/></td>
                        <td class="text-center"><a class="edit-category-btn table-btn" data-id="${category.id}"><span
                                class="glyphicon glyphicon-wrench"
                                aria-hidden="true"></span></a>
                            <a class="delete-category-btn table-btn" data-id="${category.id}"><span
                                class="glyphicon glyphicon-trash"
                                aria-hidden="true"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</customtags:adminTemplate>