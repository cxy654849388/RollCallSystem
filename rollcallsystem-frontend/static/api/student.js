function getSelectCourse() {
    var result = null;
    $.ajax({
        url: projectName + "/student/getSelectCourse",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        success: function (data) {
            supSuccess(data,layer)
            if (data.resultCode === 0) {
                result = data.result
            }
        }
    });
    return result;
}