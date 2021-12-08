<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员中心</title>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-1.10.2.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="tabbable" id="tabs-418875">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#all" data-toggle="tab">全部订单</a>
                    </li>
                    <li>
                        <a href="#nopay" data-toggle="tab">未支付</a>
                    </li>
                    <li>
                        <a href="#nodeal" data-toggle="tab">未发货</a>
                    </li>
                    <li>
                        <a href="#complete" data-toggle="tab">已完成</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="all">
                        <div class="container">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                <c:choose>
                                <%-- 如果购物车为空， --%>
                                    <c:when test = "${sessionScope.cart==null}">
                                        <div class="jumbotron text-primary">
                                            <h3>
                                                您还没有任何订单!
                                            </h3>
                                        </div>
                                    </c:when>
                                <%-- 如果购物车不为空 --%>
                                    <c:otherwise>
                                        <div class="panel-group" id="panel-994901">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <a class="panel-title" data-toggle="collapse"
                                                    data-parent="#panel-994901" href="#panel-element-786560">
                                                        订单编号：${ca.value.orders.id} 下单日期：${ca.value.orders.orderTime}  总金额：${ca.value.orders.realSum}元<br>
                                                        收件人：${ca.value.orders.receiverName} 送货地址：${ca.value.orders.receiverAddress}<br>
                                                        订单状态：${ca.value.orders.state}
                                                    </a>
                                                </div>
                                                <div id="panel-element-786560" class="panel-collapse in">
                                                    <div class="panel-body">
                                                        <div class="col-md-12 column">
                                                            <table class="table">
                                                                <thead>
                                                                <tr>
                                                                    <th>
                                                                        图片
                                                                    </th>
                                                                    <th>
                                                                        描述
                                                                    </th>
                                                                    <th>
                                                                        价格(￥)
                                                                    </th>
                                                                    <th>
                                                                        数量
                                                                    </th>
                                                                    <th>
                                                                        小计
                                                                    </th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <%-- 遍历购物车中的所有物品 --%>
                                                                <c:forEach items = "${sessionScope.cart}" var="p">
                                                                    <tr class="rowData">
                                                                        <td>
                                                                            <img class="imgUrl img-rounded"
                                                                                style="width: 30px;height:30px;"
                                                                                src="static/images/${p.value.goods.imgUrl}"/>
                                                                        </td>
                                                                        <td>
                                                                            <span class="name">"${p.value.goods.keywords}"</span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="price">"${p.value.buyPrice}"</span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="price">"${p.value.buyNum}"</span>
                                                                        </td>
                                                                        <td>
                                                                            <span class="xj">
                                                                                ${p.value.buyNum*p.value.goods.out_price}
                                                                            </span>
                                                                        </td>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            </div>
                                    </c:otherwise>
                                </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="nopay">

                    </div>
                    <div class="tab-pane" id="nodeal">

                    </div>
                    <div class="tab-pane" id="complete">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<%-- 动作 --%>
<script>
    $(function ()){
        function xj(obj,num){
        var htmlPrice= obj.parents('.rowData').find('.price').html();
        var xiaoji = parseFloat(htmlPrice)*num;
        obj.parents('.rowData').find('.xj').html(xiaoji.toFixed(2));
        // alert(htmlPrice);
        }
    }




</script>





