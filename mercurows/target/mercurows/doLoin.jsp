
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
</head>
<body>
<div class="row clearfix"style="margin-left:600px;margin-top:20px;">
    <div class="col-md-4 column">
        <form class="form-horizontal" role="form" action="doLoin" method="post">
            <div class="form-group" >
                    <label for="inputEmail3" class="col-sm-0 control-label"></label>
                <div class="col-sm-12">
                    账号：<input type="textl" style="width:300px;height:35px;"  name = "username" class="form-control" id="inputEmail3" placeholder="账号/手机/邮箱"required/>
                </div>
            </div>
            <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label"></label>
                <div class="col-sm-12">
                    密码：<input type="password" style="width:300px;height:35px;" name = "password" class="form-control" id="inputPassword3" placeholder="请输入密码"required/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10" style="margin-left:92px;margin-top:20px;">
                        <button type="submit" style="width:150px;height:35px;" class="btn btn-primary btn-large" ><span class="icon-bar">登录</button>
                </div>
            </div>
        </form>
    </div>
</div>

</body>
</html>
