require(["../require-config"], function() {
    require(['jquery', 'validate'], function() {
        $('.delete-item').on('click', function() {
            var itemId = $(this).attr('data-item');
            if (confirm('确定要删除该案例？')) {
                $.ajax({
                    url: 'item/delete',
                    type: 'GET',
                    data: {
                        'itemId': itemId
                    },
                    dataType: 'json',
                    success: function(response) {
                        if ('succeed' == response.status) {
                            alert('删除成功');
                            window.location.href = 'item/list';
                        }
                    },
                    error: function() {
                        console.log('fail to delete content');
                    }
                });
            }
        });
    });
});