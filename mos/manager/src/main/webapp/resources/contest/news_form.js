require(["../require-config"], function() {
    require(['jquery', 'validate'], function() {

        $('form').validate({
            rules: {
                title: {
                    required: true
                },
                context: {
                    required: true
                }
            },
            messages: {
                title: {
                    required: '不能为空'
                },
                context: {
                    required: '不能为空'
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
});