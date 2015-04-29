require.config({
    baseUrl: 'resources',
    paths: {
        "jquery": "libs/jquery/jquery-1.9.1.min",
        "bootstrap": "libs/bootstrap/bootstrap.min",
        "validate": "libs/jquery/validate/jquery.validate.min",
        "uploadify": "libs/jquery/uploadify/jquery.uploadify.min",
        "common": "common"
    },
    shim : {
        bootstrap : {
            deps : [ 'jquery' ],
            exports : 'bootstrap'
        },
        uploadify : {
            deps : [ 'jquery' ]
        },
        common : {
            deps : [ 'jquery' ]
        }
    }
});