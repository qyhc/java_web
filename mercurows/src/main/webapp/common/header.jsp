<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row clearfix">
    <div class="col-md-12 column">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1"><span class="sr-only">Toggle navigation</span><span
                        class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a class="navbar-brand" href="market">恋恋花市</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <form class="navbar-form navbar-left" role="search"  action ="market">
                    <div class="form-group">
                        <input type="text" name = "content" class="inputvalue"/>
                    </div>
                    <button type="submit" class="search1" id = "search1" name = "search1">查询</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <c:choose>
                    <%-- 如果有客户存在 --%>
                        <c:when test="${sessionScope.customer!=null}">
                            <li>
                                <a href="#">
                                    欢迎您：
                                   <strong class="text-danger">
                                       <c:out value="${sessionScope.customer.username}"></c:out>
                                   </strong>
                                </a>
                            </li>
                            <li>
                                <a href="Logoout">退出</a>
                            </li>
                        </c:when>
                        <%-- 如果没有客户存在 --%>
                        <c:otherwise>
                            <li>
                                <a href="doLoin.jsp">登录</a>
                            </li>
                            <li>
                                <a href="register.jsp">注册</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                    <%-- 显示当前的购物车中的购买数量 --%>
                    <li>
                        <a href="shoppingCart"> <span class="badge pull-right text-success"
                             style="background-color: green;">${fn:length(sessionScope.cart)}</span>我的购物车</a>
                    </li>
                    <li>
                        <a href="infoCenter">个人中心</a>
                        <%-- <c:out val= "${sessionScope.customer}" /> --%>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>

<%-- 动作 --%>
<script>

    // $(function () {
    //     // 搜索按钮
    //     $('.search1').click(function(){
    //         // 获取数据
    //         var content = $(this).prev().find('.inputvalue').val();
    //         alert(content)
    //         // 异步调用ajax
    //         $.ajax({
    //             url:"search",
    //             dataType:"json",
    //             type:"post",
    //             data:{
    //                 "content":content
    //             },
	// 	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
    //             success:function(){

    //             },
    //             error:function(){

    //             }
    //         });
    //     });
    // });

</script>
