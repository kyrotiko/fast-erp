//公共模块
document.writeln("<script src='../../resources/js/jquery-1.11.1.min.js' type='text/javascript'></script>");
document.writeln("<script src='../../resources/js/md5.js' type='text/javascript'></script>");
document.writeln("<script src='../../resources/js/common.js' type='text/javascript'></script>");
//vue模块
document.writeln("<script src='../../resources/modules/vue/vue.js' type='text/javascript'></script>");
//layui模块
document.writeln("<script src='../../resources/modules/layer/layer.js' type='text/javascript'></script>");
document.writeln("<script src='../../resources/modules/layui/layui.js' type='text/javascript'></script>");
document.writeln("<link rel='stylesheet' href='../../resources/modules/layui/css/layui.css'>");
//ElementUI
document.writeln("<script src='../../resources/modules/eleme/index.js' type='text/javascript'></script>");
document.writeln("<link rel='stylesheet' href='../../resources/modules/eleme/index.css'>");
//labelauty模块
document.writeln("<script src='../../resources/modules/labelauty/labelauty.js' type='text/javascript'></script>");
document.writeln("<link rel='stylesheet' href='../../resources/modules/labelauty/labelauty.css'>");
//ztree模块
document.writeln("<script src='../../resources/modules/ztree/js/jquery.ztree.all.min.js' type='text/javascript'></script>");
document.writeln("<link rel='stylesheet' href='../../resources/modules/ztree/css/metroStyle/metroStyle.css'>");
//公共样式
document.writeln("<link rel='stylesheet' href='../../resources/css/font.css'>");
document.writeln("<link rel='stylesheet' href='../../resources/css/my.css'>");

var basePath = "http://localhost:8080";
var currentUser;

//当前用户是否登陆校验,未登录则跳转到登陆页
if (window.location.href != basePath + "/static/modules/index/login.html") {
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            if (JSON.parse(xmlhttp.responseText).code == 500) {
                window.location.href = basePath + "/static/modules/index/login.html";
            }
            currentUser = JSON.parse(xmlhttp.responseText).data;
        }

    }
    xmlhttp.open("get", basePath + "/rest/auth/current");
    xmlhttp.send();
}

