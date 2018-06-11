function getTeachList() {
    var result = null;
    $.ajax({
        url: projectName + "/teacher/getTeach",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        success: function (data) {
            supSuccess(data, layer)
            if (data.resultCode === 0) {
                result = data.result
            } else {
                layer.msg(data.errorInfo)
                return
            }
        }
    });
    return result;
}

function getRecords(teachid, page, size) {
    var result = null;
    $.ajax({
        url: projectName + "/teacher/getRecords",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        data: JSON.stringify({
            'teachid': teachid,
            'page': page,
            'size': size
        }),
        success: function (data) {
            supSuccess(data, layer)
            if (data.resultCode === 0) {
                result = data.result
            } else {
                layer.msg(data.errorInfo)
                return
            }
        }
    });
    return result;
}

function getStudentList(teachid, page, size) {
    var result = null;
    $.ajax({
        url: projectName + "/teacher/getStudentList",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        data: JSON.stringify({
            'teachid': teachid,
            'page': page,
            'size': size
        }),
        success: function (data) {
            supSuccess(data, layer)
            if (data.resultCode === 0) {
                result = data.result
            } else {
                layer.msg(data.errorInfo)
                return
            }
        }
    });
    return result;
}

function getSignedRecordList(schid, weekofsemester) {
    var result = null;
    $.ajax({
        url: projectName + "/teacher/getSignedRecords",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        data: JSON.stringify({
            'schid': schid,
            'weekofsemester': weekofsemester
        }),
        success: function (data) {
            supSuccess(data, layer)
            if (data.resultCode === 0) {
                result = data.result
            } else {
                layer.msg(data.errorInfo)
                return
            }
        }
    });
    return result;
}

function getCountSignedRecords(stuid, teachid) {
    var result = null;
    $.ajax({
        url: projectName + "/teacher/getCountSignedRecords",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        data: JSON.stringify({
            'stuid': stuid,
            'teachid': teachid
        }),
        success: function (data) {
            supSuccess(data, layer)
            if (data.resultCode === 0) {
                result = data.result
            } else {
                layer.msg(data.errorInfo)
                return
            }
        }
    });
    return result;
}

function getStudentSignedDetailList(stuid, teachid) {
    var result = null;
    $.ajax({
        url: projectName + "/teacher/getStudentSignedDetails",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        data: JSON.stringify({
            'stuid': stuid,
            'teachid': teachid
        }),
        success: function (data) {
            supSuccess(data, layer)
            if (data.resultCode === 0) {
                result = data.result
            } else {
                layer.msg(data.errorInfo)
                return
            }
        }
    });
    return result;
}

function signedStatusChange(stuid, schid, weekofsemester, status) {
    var result = null;
    $.ajax({
        url: projectName + "/teacher/signedStatusChange",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        data: JSON.stringify({
            'stuid': stuid,
            'schid': schid,
            'weekofsemester': weekofsemester,
            'status': status
        }),
        success: function (data) {
            supSuccess(data, layer)
            if (data.resultCode === 0) {
                result = true
            } else {
                layer.msg(data.errorInfo)
                result = false
            }
        }
    });
    return result;
}