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
                完善个人信息
            </h3>
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="realname" class="col-sm-4 control-label">真实名*</label>
                    <div class="col-sm-6">
                        <input type="text" placeholder="请填写真实名" class="form-control" id="realname"
                               value="${sessionScope.customer.realname}"
                               name="realname"/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="intro" class="col-sm-4 control-label">个人简介*</label>
                    <div class="col-sm-6">
                        <textarea placeholder="请填写个人简介" name="intro"
                                  value="${sessionScope.customer.intro}"
                                  class="form-control" id="intro"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="tel" class="col-sm-4 control-label">手机*</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="tel" name="tel"
                               value="${sessionScope.customer.tel}" size="11" maxlength="11"
                               placeholder="请填写手机" required/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-4 control-label">电子邮箱*</label>
                    <div class="col-sm-6">
                        <input type="email" placeholder="请填写手机号或固定电话"
                               value="${sessionScope.customer.email}"
                               name="email" class="form-control" id="email"/>
                    </div>
                </div>
                <div class="form-group">
                    <%--                    <label for="gender" class="col-sm-4 control-label">性别*</label>--%>
                    <label class="col-sm-4 control-label">性别*</label>
                    <div class="col-sm-6">
                        <c:choose>
                            <c:when test="${sessionScope.customer.gender==1}">
                                <input type="radio" name="gender" class="control-label" value="1" checked>男
                                <input type="radio" name="gender" class="control-label" value="0">女
                            </c:when>
                            <c:otherwise>
                                <input type="radio" name="gender" class="control-label" value="1">男
                                <input type="radio" name="gender" class="control-label" value="0" checked>女
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
                <div class="form-group">
                    <label for="cardID" class="col-sm-4 control-label">身份证*</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="cardID"
                               value="${sessionScope.customer.cardID}" name="cardID"
                               placeholder="请填写身份证信息"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-5  text-center">
                        <button type="submit" class="btn btn-default btn-block btn-primary">更&nbsp;&nbsp;&nbsp;新
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
