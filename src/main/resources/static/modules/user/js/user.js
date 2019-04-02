/**
 *
 */
var tableOption = {
    elem: '#laytable',
    height: 500,
    where: {},
    url: basePath + '/rest/user/list', // 数据接口
    method: 'post',
    response: {
        statusName: 'code',// 数据状态的字段名称，默认：code
        statusCode: 200,// 成功的状态码，默认：0
        msgName: 'message',// 状态信息的字段名称，默认：msg
        countName: 'count',// 数据总数的字段名称，默认：count
        dataName: 'data',// 数据列表的字段名称，默认：data
    },
    page: true, // 开启分页
    cols: [[ // 表头
        {
            type: 'checkbox'
        }, {
            field: 'id',
            title: 'ID',
            sort: true,
            width: 80
        }, {
            field: 'username',
            title: '用户名',
            width: 120
        }, {
            field: 'nickname',
            title: '昵称',
            width: 120
        }, {
            field: 'roleid',
            title: '角色',
            templet: function (d) {
                d = d.roles;
                var roles = "";
                for (var i = 0; i < d.length; i++) {
                    role = d[i];
                    roles = roles + role.role;
                    if (i < d.length - 1) {
                        roles = roles + ",";
                    }
                }
                return roles;
            }
        }, {
            field: 'mobile',
            title: '手机号',
            width: 150
        }, {
            field: 'email',
            title: '邮箱地址',
            width: 250
        }, {
            field: 'status',
            title: '状态',
            width: 80
        }, {
            fixed: 'right',
            width: 210,
            align: 'center',
            toolbar: '#barDemo'
        }]],
    id: "base"
};
var tableins;
layui.use('table', function () {
    var table = layui.table;
    // 第一个实例
    tableins = table.render(tableOption);
    // 监听工具条
    table.on('tool(maintable)', function (obj) {
        var data = obj.data; // 获得当前行数据
        var layEvent = obj.event;
        var tr = obj.tr; // 获得当前行 tr 的DOM对象
        // 删除
        if (layEvent === 'del') {
            Message.confirm("确认删除?", function () {
                Http.post(basePath + "/rest/user/update", {
                    id: data.id,
                    deleted: 1
                }, function (data) {
                    Message.success(data.message);
                    tableins.reload();
                })
            });
        }
        //启用禁用
        else if (layEvent == 'stop' || layEvent == 'unstop') {
            Http.post(basePath + "/rest/user/update", {
                id: data.id,
                status: layEvent === 'stop' ? 0 : 1
            }, function (data) {
                Message.success(data.message);
                vm.showListView();
                tableins.reload();
            })
        }
        // 编辑
        else if (layEvent === 'edit') {
            Http.post(basePath + "/rest/user/info", data, function (data) {
                var user = data.data;
                var roles = user.roles;
                var roleNames = "";
                var roleAdds = [];
                for (var i = 0; i < roles.length; i++) {
                    var tmpRole = roles[i];
                    roleNames = roleNames + tmpRole.role;
                    roleAdds.push(tmpRole.id);
                    if (i < roles.length - 1) {
                        roleNames = roleNames + ",";
                    }
                }
                $('#role2').val(roleNames);
                vm.user.id = user.id;
                vm.user.username = user.username;
                vm.user.roleadd = roleAdds;
                vm.user.nickname = user.nickname;
                vm.user.mobile = user.mobile;
                vm.user.email = user.email;
            })
            vm.showEditView();
        }
    });
});

var vm = new Vue({
    el: '#vcontroller',
    data: {
        showList: true,
        showAdd: false,
        showEdit: false,
        selectInput: "",
        user: {
            id: "",
            roleadd: [],
            username: "",
            nickname: "",
            password: "",
            repass: "",
            mobile: "",
            email: ""
        }
    },
    methods: {
        showAddView: function () {
            this.showAdd = true;
            this.showList = false;
            this.showEdit = false;
        },
        showListView: function () {
            this.showAdd = false;
            this.showList = true;
            this.showEdit = false;
        },
        showEditView: function () {
            this.showAdd = false;
            this.showList = false;
            this.showEdit = true;
        },
        selectUser: function () {
            var tableOptionins = cloneObj(tableOption);
            tableOptionins.where.username = this.selectInput;
            tableins.reload(tableOptionins);
        },
        deleteSelect: function () {
            var table = layui.table;
            var checkStatus = table.checkStatus('base');
            if (checkStatus.data.length == 0) {
                alert("请选中至少一条记录");
                return;
            }
            Message.confirm("确认删除所选用户？", function () {
                var ids = "";
                for (var i = 0; i < checkStatus.data.length; i++) {
                    ids += checkStatus.data[i].id;
                    if (i < checkStatus.data.length - 1) {
                        ids = ids + ",";
                    }
                }
                Http.post(basePath + "/rest/user/deleteList", {ids: ids}, function (data) {
                    Message.success(data.message);
                    tableins.reload();
                })
            })
        },
        addUser: function (tableData) {
            Http.post(basePath + "/rest/user/add", tableData.field, function (data) {
                Message.success(data.message);
                vm.showListView();
                tableins.reload();

            });
        },
        editUser: function () {
            var postData = {
                id: vm.user.id,
                roleadd: vm.user.roleadd,
                username: vm.user.username,
                nickname: vm.user.nickname,
                password: $.md5(vm.user.password),//md5加密密码
                repass: vm.user.repass,
                mobile: vm.user.mobile,
                email: vm.user.email
            }
            Http.post(basePath + "/rest/user/update", postData, function (data) {
                Message.success(data.message);
                vm.showListView();
                tableins.reload();
            });
        },
        loadRole: function (role1, role2) {
            Http.post(basePath + "/rest/role/all/list", {}, function (data) {
                alreadyRoles = $('#' + role1).val().split(",")
                var roles = data.data;
                var html = "";
                for (j = 0; j < roles.length; j++) {
                    var role = roles[j];
                    html = html + "<div class=\"layui-inline my-list-iteam\">\r\n";
                    html = html + "<input type=\"checkbox\" role=\"" + role.role + "\" class=\"chklist\" value=\"" + role.id + "\" ";
                    if (alreadyRoles.contains(role.role)) {
                        html = html + "checked=\"checked\"";
                    }
                    html = html + "/>\r\n";
                    html = html + "<label class=\"chkbox\"> \r\n"
                    html = html + "<span class=\"check-image\"></span>  \r\n"
                    html = html + "<span class=\"radiobox-content\">" + role.role + "</span>  \r\n"
                    html = html + "</label></div> \r\n"
                }
                $('#selectbody').html(html);
                $(".chklist").labelauty("chklist", "check");
                layer.open({
                    type: 1,
                    title: "选择角色",
                    area: ['540px', '380px'],
                    skin: 'layui-layer-rim', // 加上边框
                    content: $('#select'),
                    btn: ['确定', '取消'],
                    yes: function (index, layero) {
                        // console.log(vm.user.roleids);
                        var roles = [];
                        var roleids = [];
                        $('#selectbody input:checked').each(function () {
                            roles.push($(this).attr('role'));
                            roleids.push($(this).val());
                        });
                        var roleVal = "";
                        for (var i = 0; i < roles.length; i++) {
                            roleVal = roleVal + roles[i];
                            if (i < roles.length - 1) {
                                roleVal = roleVal + ",";
                            }
                        }
                        $('#' + role1).val(roleVal);
                        $('#' + role2).val(roleids);
                        vm.user.roleadd = roleids;
                        layer.close(index);
                    },
                    btn2: function (index, layero) {
                        // alert("取消了");
                    },
                    btnAlign: 'c'
                });
            })
        }
    }
})

// 新增用户部分代码
layui.use(['form'], function () {
    var form = layui.form;
    form.verify({
        pass: [/(.+){6,12}$/, '密码必须6到12位'],
        repass: function (value) {
            if ($('#L_pass').val() != $('#L_repass').val()) {
                return '两次密码不一致';
            }
        }
    });
    // 监听提交
    form.on('submit(addUser)', function (data) {
        vm.addUser(data);
        return false;
    });

// 监听提交
    form.on('submit(editUser)', function (data) {
        vm.editUser();
        return false;
    });
});