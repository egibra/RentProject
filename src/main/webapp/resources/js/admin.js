function sendRequest(url, type, data){
    sendRequestWithSuccessCallback(url, type, data, function() {
        window.location.search = 'success';
    })
}

function sendRequestWithSuccessCallback(url, type, data, callback){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $.ajaxSetup({beforeSend: function(xhr){
        xhr.setRequestHeader(header, token);}});
    $.ajax({
        url: url,
        type: type,
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(data),
        error: function (error) {
            swal('Klaida', error.responseText, 'error');
        },
        success: callback
    });
}

function showEditModal(labelText, entityId){
    $('#modal-label').text(labelText);
    $('#save-button').attr('data-action', 'update');
    $('#id').val(entityId);
    $('#modal').modal({backdrop: 'static'});//show modal
}

function showAddModal(labelText){
    $('#modal-label').text(labelText);
    $('#save-button').attr('data-action', 'create');
    $('#modal').modal({backdrop: 'static'});//show modal
}

function save(url, data, entityId){
    var action = $('#save-button').attr('data-action');
    if(action === 'create') {
        sendRequest(url, 'POST', data);
    }else if(action === 'update'){
        sendRequest(url+'/'+entityId, 'PUT', data)
    }
}