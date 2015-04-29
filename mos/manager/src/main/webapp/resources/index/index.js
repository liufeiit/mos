require(["../require-config"], function() {
    require(['jquery', 'validate'], function() {
        $('#account').focus();
        $('form').validate({
            rules: {
                account: {
                    required: true,
                    email: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                account: {
                    required: '电子邮件不能为空',
                    email: "电子邮件格式不正确"
                },
                password: {
                    required: '密码不能为空'
                }
            }
        });
        var signin = function() {
            if ($('form').valid()) {
                $('form').submit();
            }
        };
        $('#signIn').on('click', function () {
            signin();
        });
        $(document).keydown(function(e) {
            if (e.keyCode == 13) {
                signin();
            }
        });
    });
});