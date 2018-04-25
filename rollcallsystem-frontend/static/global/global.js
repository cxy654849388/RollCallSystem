var projectName = 'http://127.0.0.1:8080/RollCallSystem'

$.ajaxSetup({
    contentType: "application/json;charset=UTF-8",
    complete: function (XMLHttpRequest, textStatus) {
        //通过XMLHttpRequest取得响应头，sessionstatus，
        var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus");
        if (sessionstatus == "timeout") {
            //如果超时就处理 ，指定要跳转的页面(比如登陆页)
            window.location.replace("/index.html");
        }
    }
});