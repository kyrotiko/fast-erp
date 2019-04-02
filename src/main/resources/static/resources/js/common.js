//重写alert
window.alert = function (msg, callback) {
    layer.alert(msg, function (index) {
        layer.close(index);
        if (typeof (callback) === "function") {
            callback("ok");
        }
    });
}

// 重写confirm式样框
window.confirm = function (msg, callback) {
    layer.confirm(msg, {
        btn: ['确定', '取消']
    }, function () {// 确定事件
        if (typeof (callback) === "function") {
            callback("ok");
        }
    });
}

// 深复制对象方法
function cloneObj(obj) {
    var newObj = {};
    if (obj instanceof Array) {
        newObj = [];
    }
    for (var key in obj) {
        var val = obj[key];
        newObj[key] = typeof val === 'object' ? cloneObj(val) : val;
    }
    return newObj;
};

// 给array扩展是否包含某个元素功能
Array.prototype.contains = function (obj) {
    var i = this.length;
    while (i--) {
        if (this[i] === obj) {
            return true;
        }
    }
    return false;
}

var Message = {
    error: function (message) {
        (new Vue()).$message.error(message);
    },
    success: function (message, callBack) {
        (new Vue()).$message({
            message: message,
            type: 'success',
            onClose: callBack
        });
    },
    warn: function (message) {
        (new Vue()).$message({
            message: message,
            type: 'warning'
        });
    },
    tips: function (message) {
        (new Vue()).$message(message);
    },
    confirm: function (message, callBack, catchBack) {
        (new Vue()).$confirm(message, '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
        }).then(callBack).catch(catchBack);
    }
}

var Http = {
    post: function (url, data, callBack) {
        $.ajax({
            type: "post",
            url: url,
            data: data,
            success: function (data) {
                if (data.code == 200) {
                    if (typeof (callBack) === "function") {
                        callBack(data);
                    }
                } else {
                    Message.error(data.message);
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                Message.error(JSON.parse(jqXHR.responseText).message);
            }
        });
    }
}