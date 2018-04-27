function login(account, password) {
    $.ajax({
        url: projectName + "/user/login",
        type: 'post',
        processData: false,
        cache: false,
        data: JSON.stringify({
            'userId': account,
            'password': password
        }),
        success: function (data) {
            if (data.resultCode === 0) {
                $.cookie('name', data.result.name);
                $.cookie('token', data.result.token);
                $.cookie('userType', data.result.userType);
                window.location.href = 'static/html/' + data.result.userType + '.html'
            } else {
                layer.msg(data.errorInfo)
            }
        },
        error: function (textStatus) {
            console.error(textStatus);
        },
        complete: function (XMLHttpRequest, status) {
            if (status == 'timeout') {
                xhr.abort();    // 超时后中断请求
                $.alert("网络超时，请刷新", function () {
                    location.reload();
                })
            }
        }
    });
}


function logout() {
    $.ajax({
        url: projectName + "/user/logout",
        type: 'post',
        processData: false,
        cache: false,
        async: false
    });
    $.removeCookie('name');
    $.removeCookie('token');
    $.removeCookie('userType');


}