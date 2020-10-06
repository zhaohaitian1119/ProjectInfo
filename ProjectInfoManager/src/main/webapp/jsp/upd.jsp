<%--
  Created by IntelliJ IDEA.
  User: 39740
  Date: 2020/10/6
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/upd">
    <table border="1px">
        <tr align="center">
            <td colspan="2">
                <h3>申报项目信息</h3>
            </td>
        </tr>
        <tr>
            <td>项目编号</td>
            <td>
                <input name="id" value="${projectinto.id}" type="text" readonly>
            </td>
        </tr>
        <tr>
            <td>项目名称</td>
            <td>
                <input name="projectname" value="${projectinto.projectname}" type="text" readonly>
            </td>
        </tr>
        <tr>
            <td>申报开始日期</td>
            <td>
                <fmt:formatDate value="${projectinto.startdate}" pattern="yyyy-MM-dd" ></fmt:formatDate>
            </td>
        </tr>
        <tr>
            <td>申报结束日期</td>
            <td>
                <fmt:formatDate value="${projectinto.enddate}" pattern="yyyy-MM-dd" ></fmt:formatDate>
            </td>
        </tr>
        <tr>
            <td>申报状态:</td>
            <td>
                <select name="status">
                    <option <c:if test="${projectinto.status == 0}">selected</c:if> value="0">已申报</option>
                    <option <c:if test="${projectinto.status == 1}">selected</c:if> value="1">审核中</option>
                    <option <c:if test="${projectinto.status == 2}">selected</c:if> value="2">已审核</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="审核">
                <input type="button" value="返回">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
