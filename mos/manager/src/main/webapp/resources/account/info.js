require([ "../require-config" ], function() {
    require([ 'jquery', 'validate' ], function() {
        $('form').validate({
            rules : {
                passwrd : {
                    required : true,
                    minlength : 6,
                    maxlength : 16
                },
                confirmPasswrd : {
                    required : true,
                    equalTo: "#passwrd"
                },
            },
            messages : {
                passwrd : {
                    required : '密码不能为空',
                    minlength : "字符长度不能小于6个字符",
                    maxlength : "字符长度不能大于16个字符"
                },
                confirmPasswrd : {
                    required : '确认密码不能为空',
                    equalTo : '密码和确认密码不相符'
                }
            },
            submitHandler : function(form) {
                form.submit();
            }
        });
    });
});