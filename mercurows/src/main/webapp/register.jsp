<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>注册</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-1.10.2.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <jsp:include page="common/header.jsp"/>
    <div class="row clearfix">
        <div class="col-md-3 column">
        </div>
        <div class="col-md-6 column">
            <h3 class="text-center">
                注册页面
            </h3>
            <form class="form-horizontal" role="form" action="doRegister">
                <div class="form-group">
                    <label for="username" class="col-sm-4 control-label">账号*</label>
                    <div class="col-sm-6">
                        <input type="text" placeholder="请填写账号" class="form-control" id="username" name="username"
                               required/>
                    </div>
                    <span id="exist"></span>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-4 control-label">密码*</label>
                    <div class="col-sm-6">
                        <input type="password" placeholder="请填写密码" name="pass" class="form-control" id="inputPassword3"
                               required/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-4 control-label">确认密码*</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" placeholder="请确认密码" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword4" class="col-sm-4 control-label">手机*</label>
                    <div class="col-sm-6">
                        <input type="tel" placeholder="请填写手机号或固定电话" required name="tel" size="11" maxlength="11"
                               class="form-control" id="inputPassword4"/>
                    </div>
                    <span>获取验证码</span>
                </div>
                <div class="form-group">
                    <label for="input5" class="col-sm-4 control-label">验证码*</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="input5" placeholder="请填写验证码" required/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-5  text-center">
                        <button type="submit" class="btn btn-default btn-block btn-primary"/>
                        注&nbsp;&nbsp;&nbsp;册
                        </input>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-3 column">
        </div>
    </div>
    <jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>
<script>
    // 判断用户名是否重和
    $(function () {
        var objUsername = $("#username");//选取账号输入框
        //触发失去焦点事件
        objUsername.blur(function () {
            //异步送出数据，至控制层，测试是否存在此账号
            $.ajax({
                    type: "get", //访问方式
                    url: "isExist", //访问路径
                    data: {//传入服务端的数据
                        "username": objUsername.val()
                    },
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: function (message) {
                        if(message=='1'){
                            objUsername.focus();
                            $('#exist').html("账号已被占用");
                            $('#exist').css("color","red");
                        }else{
                            $('#exist').html("账号可使用");
                            $('#exist').css("color","green");
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                }
            );
        });
    });

// 判断手机号是否重合
   $(function () {
        var objUsername = $("#inputPassword4");//选取账号输入框
        //触发失去焦点事件
        objUsername.blur(function () {
            //异步送出数据，至控制层，测试是否存在此账号
            $.ajax({
                    type: "get", //访问方式
                    url: "isExist", //访问路径
                    data: {//传入服务端的数据
                        "tel": objUsername.val()
                    },
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: function (message) {
                        if(message=='1'){
                            objUsername.focus();
                            $('#exist').html("电话已被占用");
                            $('#exist').css("color","red");
                        }else{
                            $('#exist').html("电话可使用");
                            $('#exist').css("color","green");
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                }
            );
        });
    });
</script>
