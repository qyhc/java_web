<%@ page import="pur.*,java.util.HashMap,servlet.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %> --%>
<%
    String name = "chen";
    char sex = '1';
    HashMap<String, Object> data = new HashMap<String, Object>();
    data.put("province", "广东省");
    data.put("city", "广州市");
    data.put("dinst", "从化区");

%>
<html>
<head>
    <title>数据的封装以及显示</title>
</head>
<body>
<hr>
<h4>1 Jsp</h4>
姓名：<%=name%><br>
通讯地址：<%=data.get("province")%><%=data.get("city")%><%=data.get("dinst")%><br>
性别：<%
    if (sex == '1') {
%>    男
<%
} else {
%>    女
<% }
%>
<br>
<hr>
<h4>2 servlet + request +EL</h4>
ISBN：${book.ISBN}<br>
出版社：${book.price}<br>
价格：${book.press}<br>
快递地址：${book.addr.province}${book.addr.city}${book.addr.dinst}<br>

<hr>
<h4>3 servlet + Session +EL</h4>
ISBN：${book1.ISBN}<br>
出版社：${book1.price}<br>
价格：${book1.press}<br>
快递地址：${book1.addr.province}${book1.addr.city}${book1.addr.dinst}<br>
<hr>

<h4>4 servlet + Session + JSTL</h4>
ISBN:<c:out value="${book1.ISBN}"/><br>
<%--出版社：<c:out value="${book1.price}"/><br>--%>
<%--快递地址：<c:out value="${book1.press}"/><br>--%>

<hr>
<h4>5 </h4>
<c:forEach items="${orderItems}" var="orderItem">
    <c:out value="${orderItem.id}"/><br>
</c:forEach>
</body>
</html>
