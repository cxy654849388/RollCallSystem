var projectName = 'http://127.0.0.1:8080/RollCallSystem'

$.ajaxSetup({
    contentType: "application/json;charset=UTF-8",
    dataType: 'jsonp',
    type: 'post',
    headers: {
        'token': $.cookie('token')
    },
    complete: function (XMLHttpRequest, textStatus) {
        console.log(XMLHttpRequest)
        //通过XMLHttpRequest取得响应头，sessionstatus，
        var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
        if (sessionstatus == "timeout") {
            //如果超时就处理 ，指定要跳转的页面(比如登陆页)
            window.location.replace("/index.html");
        }
    },
    success: function (data) {
        console.log(data)
        alert(111)
        if (data.errorCode === '1A') {
            layer.msg(data.errorInfo, {
                icon: 1,
                time: 2000 //2秒关闭（如果不配置，默认是3秒）
            }, function(){
                self.location = '../../index.html';//转跳其它网页
            });
        } else {

        }
    },

});
