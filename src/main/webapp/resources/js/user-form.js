$(document).ready(function(){

    $('.form').find('input, textarea').on('keyup blur focus', function (e) {

        var $this = $(this),
            label = $this.prev('label');
        $this.removeClass('warning-border');

        if (e.type === 'keyup') {
            if ($this.val() === '') {
                label.removeClass('active highlight');
            } else {
                label.addClass('active highlight');
            }
        } else if (e.type === 'blur') {
            if( $this.val() === '' ) {
                label.removeClass('active highlight');
            } else {
                label.removeClass('highlight');
            }
        } else if (e.type === 'focus') {

            if( $this.val() === '' ) {
                label.removeClass('highlight');
            }
            else if( $this.val() !== '' ) {
                label.addClass('highlight');
            }
        }

    });

    $('.tab a').on('click', function (e) {

        e.preventDefault();

        $(this).parent().addClass('active');
        $(this).parent().siblings().removeClass('active');

        target = $(this).attr('href');

        $('.tab-content > div').not(target).hide();

        $(target).stop(true, false).fadeIn(600);

    });

    $('#resendEmailButton').on('click', function(e) {
        var resendEmail = $('#resendEmail').val();
        if(!resendEmail){
            alert('Neįvedėte elektroninio pašto adreso!');
            return;
        }

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajaxSetup({beforeSend: function(xhr){
            xhr.setRequestHeader(header, token);}});
        $.ajax({
            url: "/user-form/resent",
            type: "POST",
            contentType: "text/plain",
            data: resendEmail,
            error: function (error) {
                swal("Klaida", error.responseText, "error");
            },
            success: function() {
                window.location.search = 'success';
            }
        });
    });

    $('#recoveryEmailButton').on('click', function(e) {
        var recoveryEmail = $('#recoveryEmail').val();
        if(!recoveryEmail){
            alert('Neįvedėte elektroninio pašto adreso!');
            return;
        }

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        $.ajaxSetup({beforeSend: function(xhr){
            xhr.setRequestHeader(header, token);}});
        $.ajax({
            url: "/user-form/recovery",
            type: "POST",
            contentType: "text/plain",
            data: recoveryEmail,
            error: function (error) {
                swal("Klaida", error.responseText, "error");
            },
            success: function() {
                window.location.search = 'success';
            }
        });
    });


    $('.alert-success').fadeTo(2000, 500).slideUp(500, function(){
        $('.alert-success').slideUp(500);
    });
});

var password = ''
var passwordConfirmation = ''

var checkPasswordValidity = (inputValue) => {
    password = inputValue
    const pwdErrorField = document.querySelector('#pwd-error-field').innerHTML

    if (password !== '' && pwdErrorField === '') {
        if (!(/[a-z]?/.test(password) && /[A-Z]/.test(password) && /[0-9]/.test(password))) {
            this.setError('#pwd-error-field', 'Slaptažodis turi tūrėti bent 1 didžiają raidę ir skaičių')
        }
        if (!(/^[a-zA-Z0-9]+$/.test(password))) {
            this.setError('#pwd-error-field', 'Slaptažodį gali sudaryti tik raidės ir skaičiai')
        }
        if (passwordConfirmation != '') {
            this.checkIfPasswordsMatch(passwordConfirmation)
        }
    }
}

var checkIfPasswordsMatch = (inputValue) => {
    passwordConfirmation = inputValue

    if (document.querySelector('#pwd-error-field').innerHTML === '') {
        if (passwordConfirmation !== '' && password !== '') {
            if (passwordConfirmation !== password) {
                this.setError('#pwd-confirm-error-field', 'Slaptažodžiai nesutampa')
            } else {
                this.setValid('#pwd-confirm-error-field', 'Slaptažodžiai sutampa')
            }
        }
    }
}

var onPasswordChange = (inputValue) => {
    password = inputValue

    if (password.length < 6 || password.length > 30) {
        setNeutral('#pwd-error-field', 'Slaptažodis turi būti nuo 6 iki 30 simbolių')
    } else {
        setNeutral('#pwd-error-field', '')
    }

    if (password.length === 0) {
        setNeutral('#pwd-error-field', '')
    }

    if (password !== passwordConfirmation)
        document.querySelector('#pwd-confirm-error-field').innerHTML = ''
}

var onSubmitRegistration = () => {
    let name = document.querySelector('#registration-first-name').value
    if (name === '') {
        setError('#name-error-field', 'Neįvedėte vardo')
    }

    let lastname = document.querySelector('#registration-last-name').value
    if (lastname === '') {
        setError('#lastname-error-field', 'Neįvedėte pavardės')
    }

    let email = document.querySelector('#registration-email').value
    if (email === '') {
        setError('#email-error-field', 'Neįvedėte elektroninio pašto')
    }

    let password = document.querySelector('#registration-password').value
    if (password === '') {
        setError('#pwd-error-field', 'Neįvedėte slaptažodžio')
    }
    let passwordError = document.querySelector('#pwd-error-field').innerHTML

    let passwordConfirm = document.querySelector('#registration-password-confirm').value
    if (passwordError === '' && passwordConfirm === '') {
        setError('#pwd-confirm-error-field', 'Nepakartojote slaptažodžio')
    }

    let nameError = document.querySelector('#name-error-field').innerHTML
    let lastnameError = document.querySelector('#lastname-error-field').innerHTML
    let emailError = document.querySelector('#email-error-field').innerHTML

    let pwConfirmError = document.querySelector('#pwd-confirm-error-field').innerHTML

    if (nameError === '' && lastnameError === '' && emailError === '' && passwordError === '' && pwConfirmError === 'Slaptažodžiai sutampa') {
        document.querySelector('#registration-form').submit()
    }
}

var checkEmailValidity = (email) => {
    if(email !== '') {
        if (!isEmailValid(email)) {
            setError('#email-error-field', 'Netinkamas email formatas')
        } else {
            setNeutral('#email-error-field', '')
        }
    } else {
        setNeutral('#email-error-field', '')
    }
}

var isEmailValid = (email) => {
    if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
        return true
    }
    return false
}

var onFocusInputField = (id, input) => {
    let errorMessageField = document.querySelector(id)

    if (!errorMessageField.className.includes('error-field-neutral')) {
        document.querySelector(id).innerHTML = ''
        input.style.borderColor = ''
        errorMessageField.parentNode.childNodes.item(1).childNodes.item(1).style.color = '#1ab188'
    }
}

var setError = (inputId, errorMessage) => {
    let errorField = document.querySelector(inputId)
    errorField.className = errorField.className.split(' ')[0]
    errorField.className += ' error-field-error'
    errorField.innerHTML = errorMessage
    errorField.style.color = '#d52b2b'
    errorField.parentNode.childNodes.item(3).style.borderColor = '#d52b2b'
    errorField.style.opacity = '1'
    errorField.parentNode.childNodes.item(1).childNodes.item(1).style.color = '#d52b2b'
}

var setValid = (inputId, message) => {
    let errorField = document.querySelector(inputId)
    errorField.className = errorField.className.split(' ')[0]
    errorField.className += ' error-field-neutral'
    errorField.innerHTML = message
    errorField.style.color = '#1ab188'
    errorField.style.opacity = '1'
}

var setNeutral = (inputId, message) => {
    let errorField = document.querySelector(inputId)
    errorField.className = errorField.className.split(' ')[0]
    errorField.className += ' error-field-neutral'
    errorField.style.color = '#949ba1'
    errorField.style.opacity = '0.7'
    errorField.innerHTML = message
    errorField.parentNode.childNodes.item(1).childNodes.item(1).style.color = '#1ab188'
}