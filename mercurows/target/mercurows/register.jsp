<%@ page import="pur.*,java.util.HashMap,servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %> --%>
<html>
<head>
    <title>会员中心</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-1.10.2.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <jsp:include page="common/header.jsp"/>
    <%-- 引入头部文件 --%>
    <div class="row clearfix">
        <div class="col-md-3 column">
        </div>
        <div class="col-md-6 column">
            <h3 class="text-center">
                注册页面
            </h3>
            <form class="form-horizontal" role="form" action = "doRegister">
                <div class="form-group">
                    <label for="inputEmail3" class="col-sm-4 control-label">账号*</label>
                    <div class="col-sm-6">
                        <input type="text" placeholder="请填写账号" class="form-control" id="inputEmail3" name="username" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword3" class="col-sm-4 control-label">密码*</label>
                    <div class="col-sm-6">
                        <input type="password" placeholder="请填写密码" name="password" class="form-control" id="inputPassword3" required/>
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
                        <input type="tel" placeholder="请填写手机号或固定电话"  required name="tel" size="11" maxlength="11" class="form-control" id="inputPassword4"/>
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
                        <button type="submit" class="btn btn-default btn-block btn-primary">注&nbsp;&nbsp;&nbsp;册
                        </button>
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
