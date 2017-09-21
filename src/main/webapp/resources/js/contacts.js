$(document).ready(function (){

    $('#submit-letter').on('click', function() {

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var json = {"email" : $('#email').val(),
            "subject" : $('#subject').val(),
            "message" : $('#message').val()};

        $.ajaxSetup({beforeSend: function(xhr){
            xhr.setRequestHeader(header, token);}});

        $.ajax({
            contentType: 'application/json;charset=UTF-8',
            url: "/contacts/send-letter",
            type: 'POST',
            data: JSON.stringify(json),
            error: function (error) {
                swal('Klaida', "Nepavyko išsiūsti laiško. " + error.responseText, 'error');
            },
            success: function() {
                swal("Išsiūsta!", "Jūsų pranešimas buvo išsiūstas sėkmingai.", "success");
            }
        });

    });


});