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
            <form class="form-horizontal" role="form" action = "updateInfo" method = "post">
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
                    <span id="exist1"></span>
                </div>

                <div class="form-group">
                    <label for="email" class="col-sm-4 control-label">电子邮箱*</label>
                    <div class="col-sm-6">
                        <input type="email" placeholder="请填写手机号或固定电话"
                               value="${sessionScope.customer.email}"
                               name="email" class="form-control" id="email"/>
                    </div>
                    <span id="exist2"></span>
                </div>

                <div class="form-group">
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
                    <span id="exist3"></span>
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

<script>
    // 判断是否重和
    $(function () {
        var objUsetel = $("#tel");//选取电话
        var objUseremail = $("#email");//选取邮箱
        var objUsecardID = $("#cardID");//选取身份证

        // 触发失去焦点事件
        objUsetel.blur(function () {
            //异步送出数据，至控制层，测试是否存在此电话
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
                                $('#exist1').html("电话已被占用");
                                $('#exist1').css("color","red");
                            }
                            // message == 2
                            else{
                                $('#exist1').html("电话格式错误");
                                $('#exist1').css("color","red");
                            }
                        }
                        // message = 3
                        else if (message == '0'){
                            $('#exist1').html("电话可使用");
                            $('#exist1').css("color","green");
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                }
            );
        });

                //触发失去焦点事件
         objUseremail.blur(function () {
            //异步送出数据，至控制层，测试是否存在此账号
            $.ajax({
                    type: "get", //访问方式
                    url: "IsLegality", //访问路径
                    data: {//传入服务端的数据
                        "email": objUseremail.val(),
                        "Stype":"email"
                    },
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: function (message) {
                        if(message == '3'){
                            objUseremail.focus();
                            $('#exist2').html("邮箱已被占用");
                            $('#exist2').css("color","red");
                        }
                        else if (message == '0'){
                            $('#exist2').html("邮箱可使用");
                            $('#exist2').css("color","green");
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                }
            );
        });

                //触发失去焦点事件
        objUsecardID.blur(function () {
            //异步送出数据，至控制层，测试是否存在此账号
            $.ajax({
                    type: "get", //访问方式
                    url: "IsLegality", //访问路径
                    data: {//传入服务端的数据
                        "cardID": objUsecardID.val(),
                        "Stype":"cardID"
                    },
                    dataType: "json",
                    contentType: "application/json;charset=utf-8",
                    success: function (message) {
                        if(message == '4'){
                            objUsecardID.focus();
                            $('#exist3').html("身份证已被占用");
                            $('#exist3').css("color","red");
                        }
                        else if (message == '0'){
                            $('#exist3').html("身份证可使用");
                            $('#exist3').css("color","green");
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

