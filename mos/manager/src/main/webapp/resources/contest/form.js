require(["../require-config"], function() {
    require(['jquery', 'validate'], function() {

        $('#start_time').on('click', function () {
            WdatePicker({
                startDate:'%y-%M-%d 00:00:00',
                dateFmt: 'yyyy-MM-dd HH:mm:ss',
                maxDate: "#F{$dp.$D('end_time')}",
            });
        });

        $('#end_time').on('click', function () {
            WdatePicker({
                startDate:'%y-%M-%d 00:00:00',
                dateFmt: 'yyyy-MM-dd HH:mm:ss',
                minDate: "#F{$dp.$D('start_time') || '%y-%M-%d %H:%m:%s'}"
            });
        });

        $('form').validate({
            rules: {
                title: {
                    required: true
                },
                topic: {
                    required: true
                },
                start_time: {
                    required: true
                },
                end_time: {
                    required: true
                },
                description: {
                    required: true
                },
                requirements: {
                    required: true
                },
                timetable: {
                    required: true
                },
                prizes: {
                    required: true
                },
                committee: {
                    required: true
                },
                host_organizers: {
                    required: true
                },
                organizers: {
                    required: true
                },
                co_organizers: {
                    required: true
                }
            },
            messages: {
                title: {
                    required: '不能为空'
                },
                topic: {
                    required: '不能为空'
                },
                start_time: {
                    required: '不能为空'
                },
                end_time: {
                    required: '不能为空'
                },
                description: {
                    required: '不能为空'
                },
                requirements: {
                    required: '不能为空'
                },
                timetable: {
                    required: '不能为空'
                },
                prizes: {
                    required: '不能为空'
                },
                committee: {
                    required: '不能为空'
                },
                host_organizers: {
                    required: '不能为空'
                },
                organizers: {
                    required: '不能为空'
                },
                co_organizers: {
                    required: '不能为空'
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
});