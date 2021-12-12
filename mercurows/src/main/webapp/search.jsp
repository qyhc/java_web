<%@ page import="pur.*,java.util.HashMap,servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>搜索结果</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script : src="static/js/jquery-1.10.2.min.js"></script>
    <script : src="static/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="container">
        <div class="row clearfix">
            <div class="col-md-12 column">
            <%-- 引入头部文件 --%>
                <jsp:include page="common/header.jsp"/>
            <%-- 导入展示数据部分--%>
            <div class= "row clearfix">
                <div class="col-md-12 column">
                    <div class = "row clearfix">
                        <c:forEach items="${goods_search}" var="p">
                            <div class="col-md-3 column tex-center"style = "margin-bottom: 20px">
                            <img alt="200×200" src = "static/images/${p.value.imgUrl}" class = "img-rounded" class="img-rounded" style="width: 200px;height: 200px;"/>
                            <blockquote>
                                <%-- <p>
                                    <c:out value="${p.value.keywords}"/>
                                </p> --%>
                                ￥:<span> <c:out value="${p.value.out_price}"/>  </span>元
                                <small>库存量：<c:out value="${p.value.stock}"/></small>
                            </blockquote>
                            <button type="button" class="btn btn-danger" value="${p.value.id}">加入购物车</button>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <%-- 引入尾部文件 --%>
            <jsp:include page="common/footer.jsp"/>
    </div>
</body>
</html>
<%-- 动作 --%>
<script>
    $(function () {
        // 每一个按钮的单击事件
        $("button").each(function(){
            $(this).click(function(){
                var id = $(this).val();
                // alert($(this).val());
                // 异步调用ajax
                $.ajax({
                    url:"addCart",
                    dataType:"json",
                    type:"post",
                    data:{
                        "id":id
                    },
                    contentType:"application/json;charset=utf-8",
                    success:function(){

                    },
                    error:function(){

                    }
                });
            });
        });
    });
</script>
