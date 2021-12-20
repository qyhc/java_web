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
                    <span id="exist1"></span>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-4 control-label">密码*</label>
                    <div class="col-sm-6">
                        <input type="password" placeholder="请填写密码" name="pass" class="form-control" id="pass"
                               required/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-4 control-label" >确认密码*</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" placeholder="请确认密码" name = "requNewPass" id =  "requNewPass" required/>
                    </div>
                    <span id="exist"></span>
                </div>
                <div class="form-group">
                    <label for="inputPassword4" class="col-sm-4 control-label">手机*</label>
                    <div class="col-sm-6">
                        <input type="tel" placeholder="请填写手机号或固定电话" required name="tel" size="11" maxlength="11"
                               class="form-control" id="inputPassword4"/>
                    </div>
                    <span id ="exist2" >获取验证码</span>
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
                    url: "IsLegality", //访问路径
                    data: {//传入服务端的数据
                        "username": objUsername.val(),
                        "Stype":"username"
                    },
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: function (message) {
                        if(message=='1' || message == '-1' ){
                            objUsername.focus();
                            $('#exist1').html("账号已被占用");
                            $('#exist1').css("color","red");
                        }else if (message == '0'){
                            $('#exist1').html("账号可使用");
                            $('#exist1').css("color","green");
                        }
                    },
                    error: function (err) {
                        alert("ERROR 账号出问题！！");
                    }
                }
            );
        });
    });

// 判断手机号是否重合
   $(function () {
        var objUsetel = $("#inputPassword4");//选取手机号输入框
        //触发失去焦点事件
        objUsetel.blur(function () {
            //异步送出数据，至控制层，测试是否存在此手机号
            $.ajax({
                    type: "get", //访问方式
                    url: "IsLegality", //访问路径
                    data: {//传入服务端的数据
                        "tel": objUsetel.val(),
                        "Stype":"tel"
                    },
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: function (message) {
                        if(message=='-2' || message=='2'){
                            objUsetel.focus();
                            if( message == '2'){
                                $('#exist2').html("电话已被占用");
                            }
                            // message == 2
                            else{
                                $('#exist2').html("电话格式错误");
                            }
                            $('#exist2').css("color","red");
                        }
                        else if (message == '0'){
                            $('#exist2').html("获取验证码");
                            $('#exist2').css("color","black");
                        }
                    },
                    error: function (err) {
                        alert("ERROR 手机出问题");
                    }
                }
            );
        });
    });


    $(function(){
        // 新密码
        var pass = $("#pass");
        // 确认新密码
        var requNewPass = $("#requNewPass");
        // 电话号

        requNewPass.blur(function(){
            // 判断两次输入的新密码是否一样
            if((pass.val()) != (requNewPass.val())){
                $('#exist').html("两次密码不一致");
                $('#exist').css("color","red");
                requNewPass.focus();
            }
            else{
                $('#exist').html("√");
                $('#exist').css("color","green");
            }
        });
    });

</script>
