function getSelectCourse() {
    var result = null;
    $.ajax({
        url: projectName + "/student/getSelectCourse",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        success: function (data) {
            supSuccess(data, layer)
            if (data.resultCode === 0) {
                result = data.result
            }
        }
    });
    return result;
}

function getSignedRecords(teachid, startWeek, endWeek, page, size) {
    var result = null;
    $.ajax({
        url: projectName + "/student/getSignedRecords",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        data: JSON.stringify({
            'teachid': teachid,
            'startWeek': startWeek,
            'endWeek': endWeek,
            'page': page,
            'size': size,
        }),
        success: function (data) {
            supSuccess(data, layer)
            if (data.resultCode === 0) {
                result = data.result
            }
        }
    });
    return result;
}