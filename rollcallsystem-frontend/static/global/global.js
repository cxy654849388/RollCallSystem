var projectName = 'http://127.0.0.1:8080/RollCallSystem'

layui.config({
    dir: '/rollcallsystem-frontend/static/layui/' //layui.js 所在路径（注意，如果是script单独引入layui.js，无需设定该参数。），一般情况下可以无视
    , version: true //一般用于更新模块缓存，默认不开启。设为true即让浏览器不缓存。也可以设为一个固定的值，如：201610
    , debug: true //用于开启调试模式，默认false，如果设为true，则JS模块的节点会保留在页面
    , base: '' //设定扩展的Layui模块的所在目录，一般用于外部模块扩展
});


var supSuccess = function (data, layer) {
    if (data.errorCode === '1A') {
        layer.msg(data.errorInfo, {
            icon: 1,
            time: 2000 //2秒关闭（如果不配置，默认是3秒）
        }, function () {
            self.location = '../../index.html';//转跳其它网页
        });
    }

}

$.ajaxSetup({
    dataType: 'json',
    contentType: 'application/json;charset=UTF-8',
    async: false,
    headers: {
        'token': $.cookie('token')
    },
});
