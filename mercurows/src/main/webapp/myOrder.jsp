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
                                    <div class="jumbotron text-primary">
                                        <h3>
                                            您还没有任何订单!
                                        </h3>
                                    </div>
                                    <div class="panel-group" id="panel-994901">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <a class="panel-title" data-toggle="collapse"
                                                   data-parent="#panel-994901" href="#panel-element-786560">
                                                    订单编号：1231231234234123 下单日期：2001-3-33 12：34：34 总金额：234.00元<br>
                                                    收件人：234234 送货地址：@#@#@@@￥@￥<br>
                                                    订单状态：
                                                    已完成
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
                                                            <tr class="rowData">
                                                                <td>
                                                                    <img class="imgUrl img-rounded"
                                                                         style="width: 30px;height:30px;"
                                                                         src="static/images/"${ca.value.goods.imgUrl}"/>
                                                                </td>
                                                                <td>
                                                                    <span class="name">"${ca.value.goods.keywords}"</span>
                                                                </td>
                                                                <td>
                                                                    <span class="price">"${ca.value.buyPrice}"</span>
                                                                </td>
                                                                <td>
                                                                    <span class="price">"${ca.value.buyPrice}"</span>
                                                                </td>
                                                                <td>
                                                                    <span class="xj">${223}</span>
                                                                </td>
                                                            </tr>

                                                            </tbody>
                                                        </table>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
