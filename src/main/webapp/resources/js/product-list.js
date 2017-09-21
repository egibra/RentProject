$(document).ready(function(){

    var currentProductId = 0;

    $('.product-show-info').on('click', '.show-modal', function () {
        var productId = $(this).data('id');
        currentProductId = productId;

        $.ajax({
            type: 'GET',
            url: 'product-info/'+productId,
            dataType: "json",
            success: function(data){

                if(data.mainPicture !== null){
                    $('#product-image').attr('src', '/image/' + data.mainPicture );
                }
                else
                    $('#product-image').attr('src', '../../resources/img/database/No-image.png');

                $('#product-name').text(data.name);

                if (data.discount !== 0){
                    $('#product-price').html("<s>" + data.pricePerDay + " €</s> " + (data.pricePerDay - (data.discount/100 * data.pricePerDay)).toFixed(2) + " €");
                }
                else
                    $('#product-price').text(data.pricePerDay + " €");

                $('#product-value').text(data.valuePrice + " €");
                $('#product-long-description').text(data.longDescription);
                $('#product-release-date').text(data.dateOut);
                $('#product-discount').text(data.discount + " %");
                $('#product-amount').text("Yra " + (data.amount - data.rentedNow) + " laisvų vienetų.");
                $('#product-rented-overall').text(data.rentedOverall);

                $('#product-attributes').html("");
                $.each(data.attributes, function(name, value){
                    $('#product-attributes').append("<tr>" + "<td>" + name + "</td>" + "<td>" + value + "</td>" + "</tr>");
                });


                showEditModal(data.name, productId);
            },
            error : function (error) {
                alert(error.responseText)
            }
        });
    });

    $('#add-cart-button').on('click', function() {

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajaxSetup({beforeSend: function(xhr){
            xhr.setRequestHeader(header, token);}});

        $.ajax({
            url: "cart-add",
            type: "POST",
            contentType: "text/plain",
            data: currentProductId.toString(),
            error: function (error) {
                alert(error.responseText);
            },
            success: function() {
                swal("", "Sėkmingai įdėjote į krepšelį!", "success");
                var $cartItems = $('#cart-number-items');
                var items = parseInt($cartItems.text(), 10) + 1;
                $cartItems.text(" " + items + " ");

                $('.swal2-modal').delay(1000).animate({
                    bottom: '+=100',
                    opacity: 0.0
                }, 500, function(){
                    $('.swal2-container').remove();
                    $('body, html').removeClass('swal2-shown');
                });

            }
        });

    });

    function showEditModal(labelText, entityId){
        $('#modal-label').text(labelText);
        $('#id').val(entityId);
        $('#modal').modal({backdrop: 'static'});//show modal
    }

});