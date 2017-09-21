// used by bootsrap-table to set detail-view for row
function detailFormatter(index, row, element) {
    var orderId = row._data.id;
    element.loadOrderDetailView(orderId);
}

$.fn.loadOrderDetailView = function (orderId) {
    $.ajax({
        context: this,
        type: 'GET',
        url: 'orders/detail-view/'+orderId,
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

    $('table').on('click', '.save-state-btn', function () {
        var orderId = $(this).data('id');
        var stateId = $('.state-select-list[data-id='+orderId+']').val();
        sendRequestWithSuccessCallback('orders/'+orderId, 'PATCH', {"id":stateId}, function () {
            swal('Valio', 'Būsena pakeista', 'success');
        });
    });

    //auto hide alerts
    $('.alert').fadeTo(2000, 500).slideUp(500, function(){
        $('.alert').slideUp(500);
    });
});