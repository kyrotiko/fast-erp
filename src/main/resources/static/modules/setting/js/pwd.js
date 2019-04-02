var validatePass = function (rule, value, callback) {
    if (value === '') {
        callback(new Error('请输入原始密码'));
    } else {
        callback();
    }

}
var validatePass2 = function (rule, value, callback) {
    if (value === '') {
        callback(new Error('请输入新密码'));
    } else {
        if (vm.pwd.new !== '') {
            vm.$refs.pwd.validateField('renew');
        }
        callback();
    }
}
var validatePass3 = function (rule, value, callback) {
    if (value === '') {
        callback(new Error('请再次输入密码'));
    } else if (value !== vm.pwd.new) {
        callback(new Error('两次输入密码不一致!'));
    } else {
        callback();
    }
}

var vm = new Vue({
    el: '#vcontroller',
    data: {
        pwd: {
            original: "",
            new: "",
            renew: ""
        },
        rules: {
            original: [
                {validator: validatePass, trigger: 'blur'}
            ],
            new: [
                {validator: validatePass2, trigger: 'blur'}
            ],
            renew: [
                {validator: validatePass3, trigger: 'blur'}
            ]
        }
    },
    methods: {
        update: function () {
            this.$refs["pwd"].validate(function (valid) {
                if (valid) {
                    vm.editPwd();
                } else {
                    return false;
                }
            });
        },
        reset: function () {
            this.$refs["pwd"].resetFields();
        },
        editPwd: function () {
            var postData = {
                original: $.md5(this.pwd.original),
                new: $.md5(this.pwd.new),
                renew: $.md5(this.pwd.renew),
            }
            Http.post(basePath + "/rest/user/changePwd", postData, function (data) {
                Message.success(data.message);
            })
        }
    }
})