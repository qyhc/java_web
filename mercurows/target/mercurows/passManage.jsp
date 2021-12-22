<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-1.10.2.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-3 column">
        </div>
        <div class="col-md-6 column">
            <h3 class="text-center">
                更改密码
            </h3>
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-4 control-label">原密码*</label>
                    <div class="col-sm-6">
                        <input type="text" placeholder="请输入原始密码" class="form-control" id="oriPassword" name="oriPassword" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-4 control-label">新密码*</label>
                    <div class="col-sm-6">
                        <input type="password" placeholder="请输入新密码" name="newPassword" class="form-control" id="newPassword" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-4 control-label">确认新密码*</label>
                    <div class="col-sm-6">
                        <input type="password" class="form-control" placeholder="请再次输入新密码" name = "requNewPass" id = "requNewPass" required/>
                    </div>
                    <span id="exist"></span>
                </div>
                <div class="form-group">
                    <label for="inputPassword4" class="col-sm-4 control-label">手机*</label>
                    <div class="col-sm-6">
                        <input type="tel" placeholder="请填写手机号或固定电话"  required name="tel" size="11" maxlength="11" class="form-control" id="tel" name = "tel"/>
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
                        <button type="submit" class="queding">确&nbsp;&nbsp;&nbsp;认
                        </button>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-3 column">
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function(){
        // 原来的密码
        var oriPassword = $("#oriPassword");
        // 新密码
        var newPassword = $("#newPassword");
        // 确认新密码
        var requNewPass = $("#requNewPass");
        // 电话号
        var tel = $("#tel");

        requNewPass.blur(function(){
            // 判断两次输入的新密码是否一样
            if((newPassword.val()) != (requNewPass.val())){
                $('#exist').html("两次密码不一致");
                $('#exist').css("color","red");
                requNewPass.focus();
            }
            else{
                $('#exist').html("√");
                $('#exist').css("color","green");
            }
        });

        $('.queding').click(function(){
            // alert(oriPassword.val());
            // alert(newPassword.val());
            // 异步调用ajax
            $.ajax({
                url:"updatepass",
                dataType:"json",
                type:"post",
                data:{
                    "oriPassword":oriPassword.val(),
                    "newPassword":newPassword.val(),
                    "tel":tel.val()
                },
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                success:function(message){
                    if(message == '1'){
                        alert('更新成功');
                        // 刷新页面
                        window.location.reload();
                    }
                    else{
                        alert('电话或密码错误');
                    }
                },
                error:function(err){
                    alert(err);
                }
            });

        });
    });

</script>
