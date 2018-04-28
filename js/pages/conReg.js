var Contractor = function () {

    return {
        init: function () {
            /* Jquery Validation, Check out more examples and documentation at https://github.com/jzaefferer/jquery-validation */
            /* Sign Up form - Initialize Validation */
            $('#form-con-reg-3').validate({
                errorClass: 'help-block animation-slideDown', // You can change the animation class for a different entrance animation - check animations page
                errorElement: 'div',
                errorPlacement: function (error, e) {
                    e.parents('.form-group > div').append(error);
                },
                highlight: function (e) {
                    $(e).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
                    $(e).closest('.help-block').remove();
                },
                success: function (e) {
                    e.closest('.form-group').removeClass('has-success has-error');
                    e.closest('.help-block').remove();
                },
                rules: {
                    'con-reg-3-first-name': {
                        required: true,
                        minlength: 2
                    },
                    'con-reg-3-middle-name': {
                        required: false,
                        minlength: 2
                    },
                    'con-reg-3-last-name': {
                        required: false,
                        minlength: 2
                    },
                    'register-email': {
                        required: true,
                        email: true
                    },
                    'register-password': {
                        required: true,
                        minlength: 8,
                        ContainsAtLeastOneCapitalLetter: true,
                        ContainsAtLeastOneNumber: true
                    },
                    'register-password-verify': {
                        required: true,
                        equalTo: '#register-password'
                    },
                    'register-terms': {
                        required: true
                    };
                },
                messages: {
                    11
                        'con-reg-3-first-name': {
                            required: 'Please enter your firstname',
                            minlength: 'Please enter your firstname'
                        },
                        'con-reg-3-middle-name': {
                            minlength: 'Please enter a valid middle name'
                        }, 1 'con-reg-3-last-name': {
                            required: 'Please enter your last name',
                            minlength: 'Please enter your last name'
                        },
                        'register-email': 'Please enter a valid email address',
                        'register-password': {
                            required: 'Please provide a password',
                            minlength: 'Your password must be at least 8 characters long',
                            ContainsAtLeastOneCapitalLetter: 'Your password must contain at least one capital letter.',
                            ContainsAtLeastOneNumber: 'Your password must contain at least one number.'

                        },
                        'register-password-verify': {
                            required: 'Please provide a password',
                            minlength: 'Your password must be at least 8 characters long',
                            equalTo: 'Please enter the same password as above'
                        },
                        'register-terms': {
                            required: 'Please accept the terms, to continue!'
                        }
                }
            });
        }
    };
}();
