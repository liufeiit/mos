require(["../require-config"], function() {
    require(['jquery', 'validate', 'uploadify'], function() {
        var basePath = $("#basePath").val();

        $('.select-image').uploadify({
            'removeTimeout': 1,
            'successTimeout': 300,
            'auto': true,
            'buttonText': '选择图片',
            'fileSizeLimit': '5MB',
            'fileTypeDesc': 'Image File Types',
            'fileTypeExts': '*.gif; *.jpg; *.png; *.jpeg;',
            'width':'120',
            'height':'32',
            'multi': false,
            'swf': 'resources/libs/jquery/uploadify/uploadify.swf?ver=' + Math.random(),
            'uploader': basePath + '/image/upload',
            'onFallback': function() {
                console.log('Flash was not detected.');
            },
            'onUploadSuccess': function(file, data, response) {
                if (response && data) {
                    var imageInfo = JSON.parse(data),
                        strHtml = '';
                    if ('succeed' == imageInfo.status) {
                        strHtml += "<input type='hidden' id='cover_media' name='cover_media' value=" + imageInfo.body.image_path + ">";
                        strHtml += "<img style='height: 230px' src='" + imageInfo.body.image_url + "' class='img-rounded'/>"
                        jQuery('#cover-img').html(strHtml);
                    } else {
                        if ('11000' == imageInfo.error_code) {
                            alert('上传失败');
                        }
                    }
                }
            }
        });

        var mediaList = $('#media-list'),
            tableBody = mediaList.find('tbody'),
            btnAddMedia = $('#btn-add-media'),
            imageCount = tableBody.find('tr').length,
            maxImageCount = mediaList.data('maxCount');

        tableBody.find('tr').each(function () {
            var row = $(this),
                index = row.data('index');
            row.find('.media-image-file').uploadify({
                'removeTimeout': 1,
                'successTimeout': 300,
                'auto': true,
                'buttonText': '选择图片',
                'fileSizeLimit': '5MB',
                'fileTypeDesc': 'Image File Types',
                'fileTypeExts': '*.gif; *.jpg; *.png; *.jpeg;',
                'width':'120',
                'height':'32',
                'multi': false,
                'swf': 'resources/libs/jquery/uploadify/uploadify.swf?ver=' + Math.random(),
                'uploader': basePath + '/image/upload',
                'onFallback': function() {
                    console.log('Flash was not detected.');
                },
                'onUploadSuccess': function(file, data, response) {
                    if (response && data) {
                        var imageInfo = JSON.parse(data),
                            strHtml = '';
                        if ('succeed' == imageInfo.status) {
                             var imageGroup = row.find('.image-group');

                             imageGroup.find('.preview-image').attr('src', imageInfo.body.image_url);
                             $('#media-url-' + index).val(imageInfo.body.image_path);
                             imageGroup.removeClass('default-preview');
                        } else {
                            if ('11000' == imageInfo.error_code) {
                                alert('上传失败');
                            }
                        }
                    }
                }
            });
        });

        mediaList.on('click', '.remove-btn', function () {
            $(this).closest('tr').remove();
            imageCount--;
            if (imageCount < maxImageCount) {
                btnAddMedia.prop('disabled', false);
            }
        });

        mediaList.on('click', '.image-delete', function () {
            var row = $(this).closest('tr'),
                index = row.data('index');

            row.find('.image-group').addClass('default-preview');
            $('#media-url-' + index).val('');
        });

        btnAddMedia.on('click', function () {
            var index = tableBody.find('tr:last').data('index'),
                imageCol;

            if (imageCount >= maxImageCount) {
                btnAddMedia.prop('disabled', true);
                return false;
            }

            index = index === undefined ? 0 : index + 1;
            var mediaTemplate = "<tr data-index='" + index + "'>"
            + "<td class='col-image'><input type='hidden' id='media-url-" + index + "' name='medias' value=''><div class='upload-container clearfix'><div class='image-group thumbnail default-preview'><span class='default-image fa fa-picture-o'></span><img class='preview-image'></div><div><input type='file' class='media-image-file' id='media-file-" + index + "'></div></div></td>"
            + "<td><button type='button' class='btn btn-success remove-btn'>删除</button></td>"
            + "</tr>";
            tableBody.append(mediaTemplate);

            imageCount++;
            if (imageCount >= maxImageCount) {
                btnAddMedia.prop('disabled', true);
            }

            imageCol = tableBody.find('tr[data-index=' + index + ']').find('.col-image');

            imageCol.find('.media-image-file').uploadify({
                'removeTimeout': 1,
                'successTimeout': 300,
                'auto': true,
                'buttonText': '选择图片',
                'fileSizeLimit': '5MB',
                'fileTypeDesc': 'Image File Types',
                'fileTypeExts': '*.gif; *.jpg; *.png; *.jpeg;',
                'width':'120',
                'height':'32',
                'multi': false,
                'swf': 'resources/libs/jquery/uploadify/uploadify.swf?ver=' + Math.random(),
                'uploader': basePath + '/image/upload',
                'onFallback': function() {
                    console.log('Flash was not detected.');
                },
                'onUploadSuccess': function(file, data, response) {
                    if (response && data) {
                        var imageInfo = JSON.parse(data),
                            strHtml = '';
                        if ('succeed' == imageInfo.status) {
                             var imageGroup = imageCol.find('.image-group');

                             imageGroup.find('.preview-image').attr('src', imageInfo.body.image_url);
                             $('#media-url-' + index).val(imageInfo.body.image_path);
                             imageGroup.removeClass('default-preview');
                        } else {
                            if ('11000' == imageInfo.error_code) {
                                alert('上传失败');
                            }
                        }
                    }
                }
            });
        });

        $('#input-color').on('click', function() {
            $('#plantPeriods').hide();
            $('#plantColors').show();
        });
        $('#input-color').on('blur', function() {
            setTimeout(function(){$('#plantColors').hide();}, 3000);
        });
        $('#plantColors').on('click', 'li', function() {
            var itemValue = $(this).data("value"), itemLabel = $(this).data("label");
            $('#input-color').val('');
            $('#plant-color' + itemValue).remove();
            $('#plant-color').append('<div id="plant-color' + itemValue + '"><i class="fa fa-minus-circle"></i> ' + itemLabel + '<input type="hidden" name="colors" value="' + itemValue + '" /></div>');	
            $('#plantColors').hide();
        });
        $('#plant-color').delegate('.fa-minus-circle', 'click', function() {
            $(this).parent().remove();
        });

        $('#input-period').on('click', function() {
            $('#plantColors').hide();
            $('#plantPeriods').show();
        });
        $('#input-period').on('blur', function() {
            setTimeout(function(){$('#plantPeriods').hide();}, 3000);
        });
        $('#plantPeriods').on('click', 'li', function() {
            var itemValue = $(this).data("value"), itemLabel = $(this).data("label");
            $('#input-period').val('');
            $('#plant-period' + itemValue).remove();
            $('#plant-period').append('<div id="plant-period' + itemValue + '"><i class="fa fa-minus-circle"></i> ' + itemLabel + '<input type="hidden" name="periods" value="' + itemValue + '" /></div>');	
            $('#plantPeriods').hide();
        });
        $('#plant-period').delegate('.fa-minus-circle', 'click', function() {
            $(this).parent().remove();
        });

        $('form').validate({
            rules: {
            	name_cn: {
                    required: true,
                    minlength: 2,
                }
            },
            messages: {
            	name_cn: {
                    required: '学名不能为空',
                    minlength: "字符长度不能小于2个字符"
                }
            },
            submitHandler: function(form) {
                var flag = true;
                if (null == $('#cover_media').val() || "" == $('#cover_media').val()) {
                    flag = false;
                    $('#warning-content').html('封皮不能为空!');
                    $('#warning-box').show();
                }
                if (flag) {
                    var mediaCount= $('#media-list').find('tbody').find('tr').length;
                    if (mediaCount <= 0) {
                        flag = false;
                        $('#warning-content').html('图片不能为空!');
                        $('#warning-box').show();
                    }
                }
                if (flag) {
                    form.submit();
                }
            }
        });
    });
});