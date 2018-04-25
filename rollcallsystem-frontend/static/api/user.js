function login(account,password) {
    $.ajax({
        url: projectName + "/user/login",
        type: 'post',
        dataType: 'json',
        headers: {
            "Content-Type": "application/json"
        },
        processData: false,
        cache: false,
        data: JSON.stringify({
            'userId': account,
            'password': password
        }),
        success: function (data) {
            if (data.resultCode === 0) {
                $.cookie('name', data.result.name, {expires: 7, path: "/"});
                $.cookie('token', data.result.token, {expires: 7, path: "/"});
                $.cookie('userType', data.result.userType, {expires: 7, path: "/"});
                if(data.result.userType == 'student'){
                    window.location.href = 'static/html/student.html'
                }

            } else {
                alert(data.errorInfo)
            }
        }
    });
}