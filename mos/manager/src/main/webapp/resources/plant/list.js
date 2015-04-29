require(["../require-config"], function() {
    require(['jquery', 'validate'], function() {
        $('.delete-item').on('click', function() {
            var itemId = $(this).attr('data-item');
            if (confirm('确定要删除该植物手册？')) {
                $.ajax({
                    url: 'plant/delete',
                    type: 'GET',
                    data: {
                        'id': itemId
                    },
                    dataType: 'json',
                    success: function(response) {
                        if ('succeed' == response.status) {
                            alert('删除成功');
                            window.location.href = 'plant/list';
                        }
                    },
                    error: function() {
                        console.log('fail to delete plant');
                    }
                });
            }
        });
    });
});