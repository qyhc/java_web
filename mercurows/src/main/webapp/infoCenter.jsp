<%@ page import="pur.*,java.util.HashMap,servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>会员中心</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-1.10.2.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <%--引入头部文件--%>
    <jsp:include page="common/header.jsp"/>
    <%--region of show data--%>
    <div class="row clearfix">
        <div class="col-md-2 column">
            <div class="list-group">
                <a href="#" class="list-group-item active">会员中心</a>
                <div class="list-group-item">
                    <a href="myInfo" target="content">个人信息</a>
                </div>
                <div class="list-group-item">
                    <a href="passManage" target="content">密码管理</a>
                </div>
                <div class="list-group-item">
                    <a href="myCredit" target="content">我的积分</a>
                </div>
                <div class="list-group-item">
                    <a href="myFav" target="content">我的收藏</a>
                </div>
                <div class="list-group-item">
                    <a href="myOrder" target="content">我的订单</a> <span class="badge btn-danger">14</span>
                </div>
                <div class="list-group-item">
                    <a href="addressManage" target="content">地址管理</a>
                </div>
                <div class="list-group-item">
                    <a href="chart" target="content">数据可视化</a>
                </div>
                <a class="list-group-item active"> <span class="badge">14</span> 会员通知</a>
            </div>
        </div>
        <div class="col-md-10 column">
            <iframe src="myInfo" frameborder="0" name="content"
                    style="position:relative;height:100%;width:100%;"></iframe>
        </div>
    </div>
    <%--引入版权底部文件--%>
    <jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>
