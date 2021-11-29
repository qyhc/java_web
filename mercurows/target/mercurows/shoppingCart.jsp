<%@ page import="pur.*,java.util.HashMap,servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %> --%>
<html>
<head>
<head>
    <title>购物详情</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script : src="static/js/jquery-1.10.2.min.js"></script>
    <script : src="static/js/bootstrap.min.js"></script>
</head>

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
                <c:choose>
                    <c:when test="${sessionScope.cart==null}">
                             <%-- 空购物车信息 --%>
                            <div class = "jumbotron">
                                <h3>
                                您还没有购买任何商品
                                </h3>
                                <p>
                                <a class="btn btn-primary btn-large" href = "#">去购物</a>
                                </p>
                            </div>
                    </c:when>
                    <c:otherwise>
                        <%-- 有信息时的 --%>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" id="checkAll">
                                    </th>
                                    <th>
                                        图片
                                    </th>
                                    <th>
                                        描述
                                    </th>
                                    <th>
                                        状态
                                    </th>
                                    <th>
                                        数量
                                    </th>
                                    <th>
                                        价格
                                    </th>
                                    <th>
                                        合计
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                            <%-- 数据 --%>
                            <%-- <c:forEach items = "${sessionScope.cart}" var="p"> --%>
                            <c:forEach items = "${sessionScope.cart}" var="p">
                                <tr class="rowData">
                                    <td>
                                        <input type="checkbox" class="ck">
                                    </td>
                                    <td>
                                        <img src = "static/images/${p.value.product.img}" alt="50x50" style = "width: 50px;height:50px;">

                                    </td>
                                    <td>
                                        ${p.value.product.desc}
                                    </td>
                                    <td>
                                        ${p.value.product.name}
                                    </td>
                                    <td>
                                        <button class = "reduce">-</button>
                                        <input type="text" name="num" value="${p.value.num}" style="..." readonly>
                                        <button class = "plus">+</button>
                                    </td>
                                    <td class="price">
                                        ${p.value.product.price}
                                    </td>
                                    <td class="xj">
                                        ${p.value.num*p.value.product.price}
                                    </td>
                                    <td>
                                        <span class = "del">删除</span>
                                    </td>
                                </tr>
                            </c:forEach>

                                <%-- 统计用tr --%>
                                <tr>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                            总计 ￥：<strong><span id = "totalSum">0.00</span></strong>
                                    </td>
                                    <td>
                                            <button class="btn btn-default btn-danger">去结算</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </c:otherwise>
            </c:choose>
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
        // $("button").each(function(){
            $('.plus').click(function(){
                var strNum = $(this).prev().val();
                var intNum = parseInt(strNum);
                intNum = intNum+1;
                $(this).prev().val(intNum);
                // alert(strNum);
                // 异步调用ajax
                xj($(this),intNum);
                // 总计
                zj();
            });

            $('.reduce').click(function(){
                var strNum = $(this).next().val();
                var intNum = parseInt(strNum);
                if(intNum>1){
                    intNum = intNum -1;
                    $(this).next().val(intNum);
                }
                // alert(strNum);
                // 异步调用ajax
                xj($(this),intNum);
                // 总计
                zj();
            });

            // 小计

            function xj(obj,num){
                var htmlPrice= obj.parents('.rowData').find('.price').html();
                var xiaoji = parseFloat(htmlPrice)*num;
                obj.parents('.rowData').find('.xj').html(xiaoji.toFixed(2));
                // alert(htmlPrice);
            }

            // 全选
            $('#checkAll').change(function(){
                $('.ck').prop('checked',this.checked);
                zj();
            });

            // 单个复选框
            $('.ck').change(function(){
                if(!$(this).is(':checked')){
                    $('#checkAll').prop('checked',false);
                }
                zj();
            });

        // });

            // 总计
            function zj(){
                var sum = 0
                $('.ck').each(function(){
                    if($(this).is(':checked')){
                        // alert(进来了);
                        var htmlXj= $(this).parents('.rowData').find('.xj').html();
                        // alert(htmlXj);
                        var fXJ = parseFloat(htmlXj);
                        // alert(fXJ);
                        sum+=fXJ;
                    }
                    // else{
                    //     alert($(this).parents('.rowData').find('.xj').html());
                    // }
                });
                // alert(sum);
                $('#totalSum').html(sum.toFixed(2));
            }

            // del
            $('.del').click(function(){
                var otr = $(this).parents('.rowData');
                if(confirm('确认要删除吗？'))
                {
                    otr.remove();
                    xj();
                }
            });
    });
</script>
</html>
