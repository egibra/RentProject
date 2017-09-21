<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="customtags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<customtags:adminTemplate pageName="products">
    <script src="../../resources/js/admin-products.js" type="text/javascript"></script>
    <div class="modal fade" id="product-picture-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <img src="" class="img-responsive img-rounded center-block" id="product-image" alt="">
                </div>
            </div>
        </div>
    </div>
    <customtags:adminModal>
        <!-- modal body -->
        <ul class="nav nav-tabs">
            <li class="active"><a href="#info-tab" data-toggle="tab">
                <spring:eval expression="@environment.getProperty('global.information.label')"/>
            </a></li>
            <li><a href="#descriptions-tab" data-toggle="tab">
                <spring:eval expression="@environment.getProperty('admin.products.menu.second')"/>
            </a></li>
            <li><a href="#attributes-tab" data-toggle="tab">
                <spring:eval expression="@environment.getProperty('admin.products.menu.third')"/>
            </a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="info-tab">
                <div class="form-group">
                    <label for="product-name" class="control-label">
                        <spring:eval expression="@environment.getProperty('global.product.name.label')"/>:
                    </label>
                    <input type="text" class="form-control" id="product-name" maxlength="40" required>
                    <input type="hidden" id="id">
                </div>
                <div class="form-group">
                    <label for="product-code" class="control-label">
                        <spring:eval expression="@environment.getProperty('admin.products.code.label')"/>:
                    </label>
                    <input type="text" class="form-control" id="product-code" maxlength="7" required>
                </div>
                <div class="form-group">
                    <label for="product-price" class="control-label">
                        <spring:eval expression="@environment.getProperty('global.product.price-per-day.label')"/>:
                    </label>
                    <input type="number" min="0" class="form-control" id="product-price">
                </div>
                <div class="form-group">
                    <label for="product-value" class="control-label">
                        <spring:eval expression="@environment.getProperty('global.product.value.label')"/>:
                    </label>
                    <input type="number" min="0" class="form-control" id="product-value">
                </div>
                <div class="form-group">
                    <label for="product-release-date" class="control-label">
                        <spring:eval expression="@environment.getProperty('global.product.release.day.label')"/>:
                    </label>
                    <input type="date" class="form-control" id="product-release-date">
                </div>
                <div class="form-group">
                    <label for="product-discount" class="control-label">
                        <spring:eval expression="@environment.getProperty('global.product.discount.label')"/>:
                    </label>
                    <input type="number" min="0" max="100" value="0" class="form-control" id="product-discount">
                </div>
                <div class="form-group">
                    <label for="product-amount" class="control-label">
                        <spring:eval expression="@environment.getProperty('admin.products.available.amount.label')"/>:
                    </label>
                    <input type="number" min="0" class="form-control" id="product-amount">
                </div>
                <div class="form-group">
                    <label>
                        <spring:eval expression="@environment.getProperty('admin.products.is.renting.label')"/>:
                        <input id="product-available" type="checkbox">
                    </label>
                </div>
            </div>
            <div class="tab-pane" id="descriptions-tab">
                <div class="form-group">
                    <label for="product-short-description" class="control-label">
                        <spring:eval expression="@environment.getProperty('admin.products.short.description')"/>:
                    </label>
                    <input type="text" class="form-control" id="product-short-description">
                </div>
                <div class="form-group">
                    <label for="product-long-description" class="control-label">
                        <spring:eval expression="@environment.getProperty('admin.products.long.description')"/>:
                    </label>
                    <textarea class="form-control" id="product-long-description" rows="3"></textarea>
                </div>
            </div>
            <div class="tab-pane" id="attributes-tab">
                <div class="form-group">
                    <label for="product-category" class="control-label">
                        <spring:eval expression="@environment.getProperty('global.product.category.label')"/>:
                    </label>
                    <select id="product-category" class="form-control">
                        <c:forEach var="category" items="${categories}" varStatus="loop">
                            <option value="${category.id}">${category.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div id="product-attributes">
                    <c:forEach var="category" items="${categories}" varStatus="loop">
                        <div class="category-attributes" data-id="${category.id}">
                            <c:forEach var="attribute" items="${category.attributes}" varStatus="loop">
                                <div class="form-group">
                                    <label class="control-label">${attribute.name}:</label>
                                    <input type="text" class="form-control product-attribute" data-id="${attribute.id}">
                                </div>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
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
            <table class="table table-condensed sortable" data-toggle="table" data-detail-view="true"
                   data-detail-formatter="detailFormatter">
                <thead>
                <tr>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.product.name.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('admin.products.code.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.product.category.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.product.price-per-day.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.product.value.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.product.release.day.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('global.product.discount.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('admin.products.available.amount.label')"/></th>
                    <th data-sortable="true"><spring:eval expression="@environment.getProperty('admin.products.is.renting.label')"/></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${products}" varStatus="loop">
                    <tr class="table-row" data-id="${product.id}">
                        <td><c:out value="${product.name}"/></td>
                        <td><c:out value="${product.code}"/></td>
                        <td><c:out value="${product.category}"/></td>
                        <td><c:out value="${product.pricePerDay}"/></td>
                        <td><c:out value="${product.valuePrice}"/></td>
                        <td><c:out value="${product.dateOut}"/></td>
                        <td><c:out value="${product.discount}"/>%</td>
                        <td><c:out value="${product.amount}"/></td>
                        <td>${product.available ? "taip" : "ne"}</td>
                        <td><a class="edit-product-btn table-btn" data-id="${product.id}"><span
                                class="glyphicon glyphicon-wrench"
                                aria-hidden="true"></span></a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</customtags:adminTemplate>