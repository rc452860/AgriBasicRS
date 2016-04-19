<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-03-29
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" uri="exam" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>无标题文档</title>
  <link href="/mobile/css/style.css" rel="stylesheet" />
  <script type="text/javascript" src="/mobile/js/jquery.js"></script>
  <script type="text/javascript">

  </script>
  <%--分页插件--%>
  <link rel="stylesheet" href="/mobile/css/pagination.css">
  <script type="text/javascript" src="/mobile/js/jquery.pagination.min.js"></script>
</head>


<body>


<div class="rightinfo">

  <table class="tablelist">
    <thead>
    <tr>
      <th></th>
      <th>名称</th>
      <th>序号</th>
      <th>处理区域</th>
      <th>处理结果</th>
      <th>意见内容</th>
      <th>处理人</th>
      <th></th>
      <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${list}">

      <tr>
        <td><input class="ctr" name="" type="checkbox" value="${item.id}"/></td>
        <td>${item.name}</td>
        <td>${item.no}</td>
        <td><my:ctp code="${item.region_id}"/></td>
        <td><my:num2WorkFlowResultChar num="${item.result}"/></td>
        <td>${item.result_content}</td>
        <td><my:user id="${item.user_id}"/> </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

</div>


<script type="text/javascript">
  $('.tablelist tbody tr:odd').addClass('odd');


</script>

</body>

</html>
