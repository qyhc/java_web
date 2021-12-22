<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script src="static/js/jquery-1.10.2.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
<%--    <script src="static/js/echarts.js"></script>--%>
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
</head>
<body>
<div class="container">
    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="zutu" style="width: 600px;height:300px;"></div>
    <div id="bingtu" style="width: 600px;height:300px;"></div>
    <div id="dayData" style="width: 600px;height:300px;"></div>
    <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var zutu = echarts.init(document.getElementById('zutu'));
        var bingtu = echarts.init(document.getElementById('bingtu'));
        var dayData = echarts.init(document.getElementById('dayData'));


        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '商城数据-柱图'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: []
            }]
        };

        // 显示加载画面 等待数据从后端传至前端
        zutu.showLoading();
        $.ajax({
            url:"exc",
            dataType:"json",
            type:"get",
            // async:false,
            data:{
                "select":"zutu"
            },
            contentType:"application/json;charset=utf-8",
            success:function(resule){
                // alert("Success");
                // alert(resule);
                var jsonobj= eval(resule);
                // var newData= eval('(' + newData + ')');  // 把JSON字符串解析为javascript对象
                // 隐藏加载画面
                zutu.hideLoading();
                // 使用从后端传来的配置项和数据显示图表。
                zutu.setOption({
                    title: {
                        text: '商城数据-柱图'
                    },
                    tooltip: {},
                    legend: {
                        data:['销量']
                    },
                    xAxis: {
                        data: jsonobj.data1
                    },
                    yAxis: {},
                    series: [{
                        name: '销量',
                        type: 'bar',
                        data: jsonobj.data2
                    }]
                });
            },
            error:function(){
                alert("Error");
            }
        });


        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '商城数据-订单分布'
            },
            series : [
                {
                    name: '订单来源',
                    type: 'pie',
                    radius: '70%',
                    roseType: 'angle',
                    data:[]
                }
            ]
        };

        // 显示加载画面 等待数据从后端传至前端
        bingtu.showLoading();
        $.ajax({
            url:"exc",
            dataType:"json",
            type:"get",
            // async:false,
            data:{
                "select":"bingtu"
            },
            contentType:"application/json;charset=utf-8",
            success:function(resule){
                // alert("Success");
                // alert(resule);
                var jsonobj= eval(resule);
                // var newData= eval('(' + newData + ')');  // 把JSON字符串解析为javascript对象
                // 隐藏加载画面
                bingtu.hideLoading();
                // 使用从后端传来的配置项和数据显示图表。
                bingtu.setOption({
                    title: {
                        text: '商城数据-订单分布'
                    },
                    series : [
                        {
                            name: '订单来源',
                            type: 'pie',
                            radius: '70%',
                            roseType: 'angle',
                            data:jsonobj
                        }
                    ]
                });
            },
            error:function(){
                alert("Error");
            }
        });

        // 使用刚指定的配置项和数据显示图表。
        // bingtu.setOption(option);


        const colors = ['#5470C6', '#EE6666'];
        option = {
            title: {
                text: '商城数据-转换率按年月对比'
            },
            color: colors,
            tooltip: {
                trigger: 'none',
                axisPointer: {
                    type: 'cross'
                }
            },
            legend: {},
            grid: {
                top: 70,
                bottom: 50
            },
            xAxis: [
                {
                    type: 'category',
                    axisTick: {
                        alignWithLabel: true
                    },
                    axisLine: {
                        onZero: false,
                        lineStyle: {
                            color: colors[1]
                        }
                    },
                    axisPointer: {
                        label: {
                            formatter: function (params) {
                                return (
                                    '客户转化率  ' +
                                    params.value +
                                    (params.seriesData.length ? '：' + params.seriesData[0].data : '')
                                );
                            }
                        }
                    },
                    // prettier-ignore
                    data: ['2020-1', '2020-2', '2020-3', '2020-4', '2020-5', '2020-6', '2020-7', '2020-8', '2020-9', '2020-10', '2020-11', '2020-12']
                },
                {
                    type: 'category',
                    axisTick: {
                        alignWithLabel: true
                    },
                    axisLine: {
                        onZero: false,
                        lineStyle: {
                            color: colors[0]
                        }
                    },
                    axisPointer: {
                        label: {
                            formatter: function (params) {
                                return (
                                    '客户转化率  ' +
                                    params.value +
                                    (params.seriesData.length ? '：' + params.seriesData[0].data : '')
                                );
                            }
                        }
                    },
                    // prettier-ignore
                    data: ['2021-1', '2021-2', '2021-3', '2021-4', '2021-5', '2021-6', '2021-7', '2021-8', '2021-9', '2021-10', '2021-11', '2021-12']
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '客户转化率(2021)',
                    type: 'line',
                    xAxisIndex: 1,
                    smooth: true,
                    emphasis: {
                        focus: 'series'
                    },
                    data: [
                        7.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3
                    ]
                },
                {
                    name: '客户转化率(2021)',
                    type: 'line',
                    smooth: true,
                    emphasis: {
                        focus: 'series'
                    },
                    data: [
                        4.9, 5.9, 11.1, 18.7, 48.3, 69.2, 231.6, 46.6, 55.4, 18.4, 10.3, 0.7
                    ]
                }
            ]
        };

        // 使用刚指定的配置项和数据显示图表。
        dayData.setOption(option);


    </script>
</div>
</body>
</html>

