<%@ page import="java.util.ArrayList" %>
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
        <div class="col-md-12 column">
            <h3>
                已有地址：<c:out value="${sessionScope.customer.detail_address}"></c:out>
            </h3>
            <a id="modal-665221" href="#modal-container-665221" role="button" class="btn" data-toggle="modal">请选择省份</a>

            <div class="modal fade" id="modal-container-665221" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel">
                                <select>
                                    <option value="10000">广东省</option>
                                    <option value="10003">广西壮族自治区</option>
                                    <option value="10001">湖北省</option>
                                </select>
                                <select>
                                    <option value="80000">广州市</option>
                                    <option value="80001">深圳市</option>
                                    <option value="80002">佛山市</option>
                                </select>
                                <select>
                                    <option value="90002">从化区</option>
                                    <option value="90000">天河区</option>
                                    <option value="90003">黄埔区</option>
                                </select>
                            </h4>
                        </div>
<%--                        <div class="modal-body">--%>
<%--                            内容...--%>
<%--                        </div>--%>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="btn btn-primary">保存</button>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>
</div>
</body>
</html>
