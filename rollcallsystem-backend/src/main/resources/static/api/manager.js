function getSchoolInfo() {
    var result = null;
    $.ajax({
        url: projectName + "/manager/getSchoolInfo",
        type: 'get',
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

function getStudentList(acaid, proid, classid, page, size) {
    var result = null;
    $.ajax({
        url: projectName + "/manager/getStudentList",
        type: 'post',
        async: false,
        processData: false,
        cache: false,
        data: JSON.stringify({
            'acaid': acaid,
            'proid': proid,
            'classid': classid,
            'page': page,
            'size': size,
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

function getFace(stuId) {
    var result = null;
    $.ajax({
        url: projectName + "/manager/getFace",
        type: 'post',
        async: false,
        processData: false,
        cache: false, data: JSON.stringify({
            'stuId': stuId
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

function addFace(stuId, image) {
    var result = null;
    $.ajax({
        url: projectName + "/manager/addFace",
        type: 'post',
        async: false,
        processData: false,
        cache: false, data: JSON.stringify({
            'stuId': stuId,
            'faceData': image
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