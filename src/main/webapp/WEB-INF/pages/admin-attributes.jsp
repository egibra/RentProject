<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:adminTemplate pageName="attributes">
    <script src="../../resources/js/admin-attributes.js" type="text/javascript"></script>
    <customtags:adminModal>
        <!-- modal body -->
        <form id="form">
            <div class="form-group">
                <label for="attribute-name" class="control-label">
                    <spring:eval expression="@environment.getProperty('global.product.name.label')"/>:
                </label>
                <input type="text" class="form-control" name="name" id="attribute-name" required>
                <input type="hidden" id="id">
            </div>
            <div class="form-group">
                <label for="attribute-category" class="control-label">
                    <spring:eval expression="@environment.getProperty('global.product.category.label')"/>:
                </label>
                <select id="attribute-category" name="category" class="form-control">
                    <c:forEach var="category" items="${categories}" varStatus="loop">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="attribute-description" class="control-label">
                    <spring:eval expression="@environment.getProperty('global.product.about.label')"/>:
                </label>
                <textarea class="form-control" name="description" id="attribute-description" rows="3"></textarea>
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
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.product.name.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.product.category.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.product.about.label')"/></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="category" items="${categories}" varStatus="loop">
                    <c:forEach var="attribute" items="${category.attributes}" varStatus="loop">
                        <tr class="table-row" data-id="${attribute.id}">
                            <td><c:out value="${attribute.name}"/></td>
                            <td data-id="${category.id}"><c:out value="${category.name}"/></td>
                            <td><c:out value="${attribute.description}"/></td>
                            <td class="text-center"><a class="edit-attribute-btn table-btn" data-id="${attribute.id}"><span
                                    class="glyphicon glyphicon-wrench"
                                    aria-hidden="true"></span></a>
                                <a class="delete-attribute-btn table-btn" data-id="${attribute.id}"><span
                                        class="glyphicon glyphicon-trash"
                                        aria-hidden="true"></span></a></td>
                        </tr>
                    </c:forEach>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</customtags:adminTemplate>