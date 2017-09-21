$(document).ready(function (){

    $('.cart-remove').on('click', function() {

        var $this = $(this);
        var productId = $this.data('id');

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajaxSetup({beforeSend: function(xhr){
            xhr.setRequestHeader(header, token);}});

        $.ajax({
            url: "cart-remove-item",
            type: "POST",
            contentType: "text/plain",
            data: productId.toString(),
            error: function (error) {
                alert(error.responseText);
            },
            success: function(totalItems) {
                $this.parent().animate({
                    opacity: 0.0,
                }, 300, function () {
                   $this.parent().remove();

                    var $cartNumber = $('#cart-number-items');

                    //var currentNumber = $cartNumber.text() - 1;
                    $cartNumber.text(" " + totalItems + " ");

                    if (totalItems <= 0) {
                        $("#cart-not-empty").hide();
                        $("#cart-empty").removeClass("hidden");
                    }

                });


            }
        });

    });

    var $quantInput = $('.cart-quantity-input');

    $quantInput.on('keydown', function(e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110]) !== -1 ||
            // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
            // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
            // let it happen, don't do anything
            return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });

    $quantInput.on('input', function() {
        var $this = $(this);
        var $updateTag = $this.parent().parent().parent().parent().children('.cart-update');
        var $priceTag = $this.closest('.cart-quantity').next().children().children('.cart-price-number');
        var unitPrice = $priceTag.data('price');

        $priceTag.text(($this.val() * unitPrice).toFixed(2)) ;
        $updateTag.removeClass('hidden');
        $updateTag.data('quantity', $this.val());
    });

    $('.cart-update').on('click', function() {

        var $this = $(this);
        var productId = $this.data('id');
        var productQuantity = $this.data('quantity');

        if (!(/^[1-9]\d*$/.test(productQuantity))){
            alert("Neteisinga kiekio reikšmė. Gali būti tik teigiami skaičiai.");
            return;
        }

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajaxSetup({beforeSend: function(xhr){
            xhr.setRequestHeader(header, token);}});

        $.ajax({
            url: "cart-update-item",
            type: "POST",
            contentType: "text/plain",
            data: (productId.toString() + "+" + productQuantity.toString()),
            error: function (error) {
                alert(error.responseText);
            },
            success: function(totalItems) {
                var $cartNumber = $('#cart-number-items');
                $cartNumber.text(" " + totalItems + " ");

                $this.removeClass('glyphicon-save').addClass('glyphicon-ok').addClass('cart-update-success');
                $this.delay(1000).fadeOut();
                $this.animate({
                    delay: 2000,
                    opacity: 0
                }, 500, function () {
                    $this.removeAttr('style').addClass('hidden');
                    $this.removeClass('glyphicon-ok').removeClass('cart-update-success').addClass('glyphicon-save');
                });
            }
        });
    });

    var defaultStart = new Date();
    var defaultEnd = new Date();
    defaultEnd.setDate(defaultStart.getDate() + 7);
    getTotalPrice(defaultStart.toISOString().slice(0, 10), defaultEnd.toISOString().slice(0, 10));  // gali buti negerai

    $('#rental-period').daterangepicker({
            startDate: defaultStart,
            endDate: defaultEnd,
            locale: {
                "format": 'YYYY-MM-DD',
                "applyLabel": "Patvirtinti",
                "cancelLabel": "Uždaryti",
                "fromLabel": "Nuo",
                "toLabel": "Iki",
                "daysOfWeek": ["P", "A", "T", "K", "P", "Š", "S"],
                "monthNames": ["Sausis", "Vasaris", "Kovas", "Balandis", "Gegužė", "Birželis", "Liepa", "Rugpjūtis",
                    "Rugsėjis", "Spalis", "Lapkritis", "Gruodis"],
                "firstDay": 1
            }
        },
        function (start, end, label) {  //date selected
            getTotalPrice(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'));
        });

   /* $('#order-btn').on('click', function(){

    });*/
});

function getTotalPrice(dateFrom, dateTo){
    var dates = {
        "dateFrom": dateFrom,
        "dateTo": dateTo
    };
    $.ajax({
        url: "cart-total-price",
        type: "GET",
        data: dates,
        error: function (error) {
            //alert(error.responseText);
        },
        success: function(data) {
            $('#total-price').html(data+"€");
        }
    });
}