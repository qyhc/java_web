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
                                <select id = "province" name=  "province">
                                    <option value="10000">广东省</option>
                                    <option value="10003">广西壮族自治区</option>
                                    <option value="10001">湖北省</option>
                                </select>
                                <select id = "city" name= "city">
                                    <option value="80000">广州市</option>
                                    <option value="80001">深圳市</option>
                                    <option value="80002">佛山市</option>
                                </select>
                                <select id = "area" name = "area">
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
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> <button type="button" class="save" id = "save" name = "save">保存</button>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>
</div>
</body>

<script>

    $(function() {
        var select1=  $('#province');
        var select2=  $('#city');
        var select3=  $('#area');

        $('.save').click(function(){
            var int_text1 = select1.val();
            var int_text2 = select2.val();
            var int_text3 = select3.val();
            // 获取对应的文本内容
            var str_text1 = select1.find("option:selected").text();
            var str_text2 = select2.find("option:selected").text();
            var str_text3 = select3.find("option:selected").text();

            // alert(int_text1);
            // alert(int_text1);
            // alert(int_text3);

            // alert(str_text1);
            // alert(str_text1);
            // alert(str_text3);
            if(int_text1 == 0){
                alert('请选择省份！')
            }
            else if(int_text2 == 0){
                alert('请选择城市！')
            }
            else if (int_text3 == 0) {
                alert('请选择区县！')
            } else {
                $.ajax({
                    url:"updateaddress",
                    dataType:"json",
                    type:"post",
                    data:{
                        "int_text1":int_text1,
                        "int_text2":int_text2,
                        "int_text3":int_text3,
                        "str_text1":str_text1,
                        "str_text2":str_text2,
                        "str_text3":str_text3
                    },
                    contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                    success:function(message){
                        if(message == "1"){
                            if(confirm('更新成功！')){
                                // 刷新页面
                                window.location.reload();
                            }
                        }
                    },
                    error:function(XMLHttpRequest,textStatus,errorThrown){
                        alert("错误信息："+ XMLHttpRequest.responseText);
                    }
                });
            }
        });
    });

    // ===== ===== ===== 获取select元素 ===== ===== =====
    // 获取下拉表单
    var select_province = document.getElementById('province');
    var select_city = document.getElementById('city');
    var select_area = document.getElementById('area');


    // ===== ===== ===== 准备三级联动的数据 ===== ===== =====
    // 省份
    var arr_province = [
        // 省份ID, 省份名称
        { id: 10000, name: '广东省' },
        { id: 10003, name: '广西壮族自治区' },
        { id: 10001, name: '湖北省' }
    ];

    // 城市
    var arr_city = [
        // 城市ID, 城市名称, 城市所属的省份（即本级的上一级的ID）
        { id: 80000, name: '广州市', province_id: 10000 },
        { id: 80001, name: '深圳市', province_id: 10000 },
        { id: 80002, name: '佛山市', province_id: 10000 }
    ];

    // 区县
    var arr_area = [
        // 区县ID, 区县名称, 区县所属的城市（即本级的上一级的ID）
        { id: 90002, name: '从化区', city_id: 80000 },
        { id: 90000, name: '天河区', city_id: 80000 },
        { id: 90003, name: '黄埔区', city_id: 80000 }
    ];


    // ===== ===== ===== 给select填充数据的操作 ===== ===== =====
    // 填充province
    function addDataProvince() {
        var html = "<option value='0'>请选择省份</option>";
        var length = arr_province.length;
        for (var i = 0; i < length; i++) {
            html += "<option value='" + arr_province[i].id + "'>" + arr_province[i].name + "</option>";
        }
        select_province.innerHTML = html;
    }

    // 填充city
    function addDataCity(provinceId) {
        var html = "<option value='0'>请选择城市</option>";
        var length = arr_city.length;
        for (var i = 0; i < length; i++) {
            var obj = arr_city[i];
            if (obj.province_id == provinceId) {
                html += "<option value='" + obj.id + "'>" + obj.name + "</option>";
            }
        }
        select_city.innerHTML = html;
    }

    // 填充area
    function addDataArea(cityId) {
        var html = "<option value='0'>请选择区县</option>";
        var length = arr_area.length;
        for (var i = 0; i < length; i++) {
            var obj = arr_area[i];
            if (obj.city_id == cityId) {
                html += "<option value='" + obj.id + "'>" + obj.name + "</option>";
            }
        }
        select_area.innerHTML = html;
    }

    // ===== ===== ===== 给select绑定change事件 ===== ===== =====
    // select_province绑定change事件
    select_province.onchange = function () {
        var provinceId = select_province.value;
        addDataCity(provinceId);
    };

    // select_city绑定change事件
    select_city.onchange = function () {
        var cityId = select_city.value;
        addDataArea(cityId);
    };

    // select初始化数据
    addDataProvince();
    addDataCity(arr_province[0].id);
    addDataArea(arr_city[0].id);


    /* 核心思想就是，通过监听上一级的变化获得上级的value，进而改变本级显示的列表内容。*/

</script>
</html>
