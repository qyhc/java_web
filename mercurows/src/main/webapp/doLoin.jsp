<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
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
                登录页面
            </h3>
            <form class="form-horizontal" role="form" action="doLoin" method="post">
                <div class="form-group" >
                        <label for="inputEmail3" class="col-sm-4 control-label"></label>
                    <div class="col-sm-6">
                        账号：<input type="textl" name = "username" class="form-control" id="inputEmail3" placeholder="账号/手机/邮箱"required/>
                    </div>
                </div>
                <div class="form-group">
                        <label for="inputPassword3" class="col-sm-4 control-label"></label>
                    <div class="col-sm-6">
                        密码：<input type="password" name = "password" class="form-control" id="inputPassword3" placeholder="请输入密码"required/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-5">
                            <button type="submit"  class="btn btn-primary btn-large" ><span class="icon-bar">登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>
