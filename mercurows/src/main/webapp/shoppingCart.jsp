<%@ page import="pur.*,java.util.HashMap,servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                    <c:when test="${sessionScope.cart==null || fn:length(sessionScope.cart) ==0 }">
                             <%-- 空购物车信息 --%>
                            <div class = "jumbotron">
                                <h3>
                                您还没有购买任何商品
                                </h3>
                                <p>
                                <a class="btn btn-primary btn-large" href = "market">去购物</a>
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
                                <tr class="rowData"  id = "rowData">
                                    <td class = "tck">
                                        <input type="checkbox" class="ck"value="${p.value.goods.id}" >
                                    </td>
                                    <td>
                                        <img src = "static/images/${p.value.goods.imgUrl}" alt="50x50" style = "width: 50px;height:50px;">
                                        <%-- ${p.value.goods.id} --%>
                                    </td>
                                    <td>
                                        ${p.value.goods.ch_spec}
                                    </td>
                                    <td>
                                        库存：${p.value.goods.stock}
                                    </td>
                                    <td class = "tnum">
                                        <button class = "reduce">-</button>
                                        <input type="text" class = "num" value="${p.value.buyNum}" style="..." readonly>
                                        <%-- <input type="text" name="num" id = "num" value="${p.value.buyNum}" style="..." readonly> --%>
                                        <button class = "plus">+</button>
                                    </td>
                                    <td class="price">
                                        ${p.value.goods.out_price}
                                    </td>
                                    <td class="xj">
                                        ${p.value.buyNum*p.value.goods.out_price}
                                    </td>
                                    <td>
                                        <span class = "del">删除</span>
                                    </td>
                                </tr>
                            </c:forEach>

                                <%-- 统计用tr --%>
                                <tr class = "countData">
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td class = "totalMoney">
                                            总计 ￥：<strong><span id = "totalSum">0.00</span></strong>
                                    </td>
                                    <td>
                                            <button class="qjs">去结算</button>
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
                var id = $(this).parents('.rowData').find('.tck').find('.ck').val();
                intNum = intNum+1;
                $(this).prev().val(intNum);
                $.ajax({
                    url:"addCart",
                    dataType:"json",
                    type:"post",
                    data:{
                        "id":id,
                        // "num"
                    },
                    contentType:"application/json;charset=utf-8",
                    success:function(){

                    },
                    error:function(){

                    }
                });
                // alert(strNum);
                // 异步调用ajax
                xj($(this),intNum);
                // 总计
                zj();
            });

            $('.reduce').click(function(){
                var strNum = $(this).next().val();
                var intNum = parseInt(strNum);
                var id = $(this).parents('.rowData').find('.tck').find('.ck').val();
                if(intNum>1){
                    intNum = intNum -1;
                    // alert(id);
                    $(this).next().val(intNum);
                    $.ajax({
                        url:"delCart",
                        dataType:"json",
                        type:"post",
                        data:{
                            "id":id,
                            "num":1
                        },
                        contentType:"application/json;charset=utf-8",
                        success:function(){

                        },
                        error:function(){

                        }
                    });
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
                // 将求和结果写入总计结果栏中
                $('#totalSum').html(sum.toFixed(2));
            }

            // del
            $('.del').click(function(){
                var otr = $(this).parents('.rowData');
                if(confirm('确认要删除吗？'))
                {
                    var id = otr.find('.tck').find('.ck').val();
                    var num = otr.find('.tnum').find('.num').val();
                    otr.remove();
                    $.ajax({
                        url:"delCart",
                        dataType:"json",
                        type:"post",
                        data:{
                            "id":id,
                            "num":num
                        },
                        contentType:"application/json;charset=utf-8",
                        success:function(){

                        },
                        error:function(){

                        }
                    });
                    xj();
                }
            });

            // 结算功能
            $('.qjs').click(function(){
                var totalMoney = $('#totalSum').html();
                // alert(totalMoney);
                if(totalMoney==0){
                    alert('您还没有选中任何商品');
                }
                else{
                    if(confirm('确认购买吗？')){
                        alert('购买成功');
                        // 删除购物车中的对应列表
                        $('.ck').each(function(){
                            if($(this).is(':checked')){
                                // alert('选了')
                                var otr = $(this).parents('.rowData');
                                // alert(otr);
                                // 获取对应的商品id值
                                // var id = document.getElementById("rowData").getAttribute("value")
                                var id = $(this).val();
                                var num = $(this).parents('.rowData').find('.tnum').find('.num').val();
                                // alert(id);
                                // alert(num);
                                otr.remove();
                                // 并更新数据库中的相应库存 与 购物车中的数量
                                // 异步调用ajax,删除对应购物车中的商品订单 √
                                //待定：+ - 号异步调用更新 购物车 ×

                                // 1、将每一个被选中的商品创建一个订单

                                // 2、将对应的商品从购物车中删除
                                $.ajax({
                                    url:"delCart",
                                    dataType:"json",
                                    type:"post",
                                    data:{
                                        "id":id,
                                        "num":num
                                    },
                                    contentType:"application/json;charset=utf-8",
                                    success:function(){

                                    },
                                    error:function(){

                                    }
                                });
                            }
                        });
                    }
                }
            });
    });
</script>
</html>
