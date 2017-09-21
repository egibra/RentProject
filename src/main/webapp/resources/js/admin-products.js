// used by bootsrap-table to set detail-view for row
function detailFormatter(index, row, element) {
    var productId = row._data.id;
    element.loadProductDetailView(productId);
}

$.fn.loadProductDetailView = function (productId) {
    $.ajax({
        context: this,
        type: 'GET',
        url: 'products/detail-view/'+productId,
        success: function(data){
            this.html(data);
        },
        error : function (error) {
            swal('Klaida', error.responseText, 'error');
        }
    });
    return this;
};

$( document ).ready(function() {

    function reloadProductDetailView(productId) {
        $('.product-desc[data-id=' + productId + ']').parent().loadProductDetailView(productId);
    }

    // product picture clicked
    $('table').on('click', '.product-picture', function() {
        $('#product-image').attr('src', $(this).find('img').attr('src'));
        $('#product-picture-modal').modal('show');
    });

    // delete product picture
    $('table').on('click', '.delete-picture-btn', function() {
        var productId = $(this).parent().data('product');
        var pictureId = $(this).parent().data('picture');
        swal({
            title: 'Ar tikrai ištrinti?',
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Trinti'
        }).then(function () {
            sendRequestWithSuccessCallback('picture/'+pictureId, 'DELETE', null, function () {
                reloadProductDetailView(productId);
            });
        });
    });

    // make main picture
    $('table').on('click', '.main-picture-btn', function() {
        var productId = $(this).parent().data('product');
        var pictureId = $(this).parent().data('picture');
        sendRequestWithSuccessCallback('product/'+productId, 'PATCH', {"id":pictureId}, function () {
            reloadProductDetailView(productId);
        });
    });

    // upload new picture
    $('table').on('click', '.upload-btn', function () {
        var productId = $(this).data('id');
        var $fileInput = $('.file-input[data-id='+productId+']');
        if($fileInput.val() === ''){
            return;
        }
        var formData = new FormData();
        var file = $fileInput[0].files[0];
        formData.append('file', file);
        //validate
        if(file.size > 1000000){
            swal('Klaida', 'Nuotrauka per daug užima.', 'error');
            return;
        }
        if(file.type != 'image/png'){
            swal('Klaida', 'Nuotrauka turi būti .png formato.', 'error');
            return;
        }
        var $loadingBar = $('.loading-bar[data-id='+productId+']');
        $loadingBar.show();
        var productId = $(this).data('id');
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $.ajaxSetup({beforeSend: function(xhr){
            xhr.setRequestHeader(header, token);}});
        $.ajax({
            url : 'picture/'+productId,
            type : 'POST',
            data : formData,
            inputEncoding : 'multipart',
            processData: false,
            contentType: false,
            success : function(data) {
                reloadProductDetailView(productId);
                $loadingBar.hide();
            },
            error : function (error) {
                swal('Klaida', error.responseText, 'error');
                $loadingBar.hide();
            }
        });
    });

    // edit product button clicked
    $('table').on('click', '.edit-product-btn', function () {
        var productId = $(this).data('id');
        $.ajax({        //load product info
            type: 'GET',
            url: 'product/'+productId,
            dataType: "json",
            success: function(data){
                $('#product-name').val(data.name);
                $('#product-code').val(data.code);
                $('#product-price').val(data.pricePerDay);
                $('#product-value').val(data.valuePrice);
                $('#product-release-date').val(data.dateOut);
                $('#product-discount').val(data.discount);
                $('#product-amount').val(data.amount);
                $('option[value='+data.category.id+']').prop('selected', true).change();
                $.each(data.attributes, function(id, value){
                    $('.product-attribute[data-id='+id+']').val(value);
                });
                $('#product-available').prop('checked', data.available);
                $('#product-short-description').val(data.shortDescription);
                $('#product-long-description').val(data.longDescription);
                showEditModal('Redaguoti produktą', productId);
            },
            error : function (error) {
                swal('Klaida', error.responseText, 'error');
            }
        });
    });

    // add new product button clicked
    $('#add-button').click(function(){
        showAddModal('Naujas produktas');
    });

    // show category attributes when selected category changes
    $('#product-category').change(function(){
        $('.category-attributes').hide();
        var catId = $(this).find(':selected').val();
        $('.category-attributes[data-id='+catId+']').show();
    });

    //save button clicked
    $('#save-button').click(function(){
        // validate required input fields
        if(!$('#product-name').val()){
            swal('Klaida', 'Neįvedėte produkto pavadinimo!', 'warning');
            return;
        }
        else if(!$('#product-code').val()){
            swal('Klaida', 'Neįvedėte produkto kodo!', 'warning');
            return;
        }
        save('product', serializeProduct(), $('#id').val());
    });

    //serialize product from user input
    function serializeProduct(){
        var categoryId = $('#product-category').val();
        var attributes = [];
        $('.category-attributes[data-id='+categoryId+']').children().children('.product-attribute').each(function () {
            attributes.push({
                "id" : $(this).attr('data-id'),
                "value" : $(this).val()});
        });
        var json = {"category" : categoryId,
            "code" : $('#product-code').val(),
            "name" : $('#product-name').val(),
            "pricePerDay" : $('#product-price').val(),
            "valuePrice" : $('#product-value').val(),
            "dateOut" : $('#product-release-date').val(),
            "amount" : $('#product-amount').val(),
            "shortDescription" : $('#product-short-description').val(),
            "longDescription" : $('#product-long-description').val(),
            "discount" : $('#product-discount').val(),
            "available" : $('#product-available').is(':checked'),
            "attributes" : attributes};
        return json;
    }

    //auto hide alerts
    $('.alert').fadeTo(2000, 500).slideUp(500, function(){
        $('.alert').slideUp(500);
    });
});