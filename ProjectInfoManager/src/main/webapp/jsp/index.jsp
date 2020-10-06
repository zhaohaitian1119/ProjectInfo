<%--
  Created by IntelliJ IDEA.
  User: 39740
  Date: 2020/10/6
  Time: 16:19
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
<form>
    申报状态:
    <select name="status">
        <option value="3">全部</option>
        <option value="0">已申报</option>
        <option value="1">审核中</option>
        <option value="2">已审核</option>
    </select>
    <input type="submit" value="查询">
    <table border="1px">
        <tr align="center">
            <td colspan="6">
                <h3>项目申报列表</h3>
            </td>
        </tr>
        <tr>
            <td>项目编号</td>
            <td>项目名称</td>
            <td>申报开始日期</td>
            <td>申报结束日期</td>
            <td>申报状态</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${pageInfo.list}" var="item">
        <tr>
            <td>${item.id}</td>
            <td>${item.projectname}</td>
            <td>
                <fmt:formatDate value="${item.startdate}" pattern="yyyy-MM-dd" ></fmt:formatDate>
            </td>
            <td>
                <fmt:formatDate value="${item.enddate}" pattern="yyyy-MM-dd" ></fmt:formatDate>
            </td>
            <td>
                <c:if test="${item.status == 0}">
                    已申报
                </c:if>
                <c:if test="${item.status == 1}">
                    审核中
                </c:if>
                <c:if test="${item.status == 2}">
                    已审核
                </c:if>
            </td>
            <td>
                <c:if test="${item.status != 2}">
                    <a href="/selById/${item.id}">审核</a>
                </c:if>
            </td>
        </tr>
        </c:forEach>
    </table>
    <div>
        <a href="/?pageNum=${pageInfo.firstPage}">首页</a>
        <c:if test="${pageInfo.hasPreviousPage}">
            <a href="/?pageNum=${pageInfo.prePage}">上一页</a>
        </c:if>
        <c:forEach items="${pageInfo.navigatepageNums}" var="i">
            <a href="/?pageNum=${i}">${i}</a>

        </c:forEach>
        <c:if test="${pageInfo.hasNextPage}">
            <a href="/?pageNum=${pageInfo.nextPage}">下一页</a>
        </c:if>
        <a href="/?pageNum=${pageInfo.lastPage}">尾页</a>
    </div>
    <p style="color: red">${msg}</p>
</form>
</body>
</html>

