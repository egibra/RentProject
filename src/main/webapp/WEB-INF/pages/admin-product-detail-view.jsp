<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div class="product-desc" data-id="${product.id}">
    <c:if test="${not empty product.shortDescription}">
        <div class="col-xs-12">
            <p><b><spring:eval expression="@environment.getProperty('admin.products.short.description')"/>: </b> <c:out value="${product.shortDescription}"/></p>
        </div>
    </c:if>
    <c:if test="${not empty product.longDescription}">
        <div class="col-xs-12">
            <p><b><spring:eval expression="@environment.getProperty('admin.products.long.description')"/>: </b> <c:out value="${product.longDescription}"/></p>
        </div>
    </c:if>
    <c:if test="${not empty product.attributes}">
        <div class="col-xs-12">
            <b><spring:eval expression="@environment.getProperty('product.list.modal.menu.second')"/>:</b>
            <ul>
                <c:forEach var="attribute" items="${product.attributes}" varStatus="loop">
                    <li>${attribute.key}: ${attribute.value}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>

    <div class="col-xs-12">
        <p><b><spring:eval expression="@environment.getProperty('admin.product.main.picture.label')"/>:</b>
            <c:if test="${product.mainPicture == null}"><span><i>Nėra.</i></span></c:if></p>
    </div>
    <c:if test="${product.mainPicture != null}">
        <div class="clearfix">
            <div class="col-xs-2 col-xs-offset-1 product-picture-col">
                <a href="#" class="product-picture">
                    <img src="/image/${product.mainPicture.fileName}" width="150" height="150"
                         class="img-responsive img-rounded center-block" alt="">
                </a>
                <div class="clearfix center-block" data-product="${product.id}" data-picture="${product.mainPicture.id}">
                    <a class="delete-picture-btn table-btn" title="Ištrinti">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                    </a>
                </div>
            </div>
        </div>
    </c:if>

    <c:if test="${not empty product.pictures}">
        <div class="col-xs-12">
            <p><b><spring:eval expression="@environment.getProperty('admin.product.pictures.label')"/>:</b></p>
        </div>
        <c:forEach var="picture" items="${product.pictures}" varStatus="loop">
            <c:if test="${loop.index % 6 == 0}">
                <div class="clearfix row-eq-height">
            </c:if>
            <div class="col-xs-2 product-picture-col">
                <a href="#" class="product-picture">
                    <img src="/image/${picture.fileName}" width="150" height="150"
                         class="img-responsive img-rounded center-block" alt="">
                </a>
                <div class="clearfix center-block" data-product="${product.id}" data-picture="${picture.id}">
                    <a class="main-picture-btn table-btn" title="Nustatyti pagrindine">
                        <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
                    </a>
                    <a class="delete-picture-btn table-btn" title="Ištrinti">
                        <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                    </a>
                </div>
            </div>
            <c:if test="${(loop.index != 0 && loop.index % 6 == 5) || loop.last}">
                </div>
            </c:if>
        </c:forEach>
    </c:if>

    <div class="clearfix">
        <div class="col-xs-4 picture-upload-form">
            <label class="control-label"><spring:eval expression="@environment.getProperty('admin.product.import.picture.label')"/>:</label>
            <div class="form-inline">
                <div class="input-group">
                    <input type="file" class="form-control file-input" data-id="${product.id}"
                           name="picture" accept="image/png"/>
                    <span class="input-group-btn">
                        <a type="button" class="btn btn-primary upload-btn" data-id="${product.id}">
                            <spring:eval expression="@environment.getProperty('admin.product.import.label')"/></a>
                    </span>
                </div>
            </div>
        </div>
    </div>

    <div class="col-xs-12 loading-bar" style="display: none;" data-id="${product.id}">
        <img src="${pageContext.request.contextPath}/resources/img/ajax-loader.gif"
             class="img-responsive img-rounded center-block" alt="">
    </div>
</div>