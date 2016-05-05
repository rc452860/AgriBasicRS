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
<%@ taglib prefix="my" uri="/exam" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>无标题文档</title>
  <script type="text/javascript">
    window.deleteUrl = "/mobile/registrationForm/delete";
    window.deleteMulUrl = "/mobile/registrationForm/deleteMulit";
  </script>
  <c:import url="references.jsp"></c:import>

</head>


<body>

<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">调查表信息</a></li>
    <li><a href="#">调查表列表</a></li>
  </ul>
</div>

<div class="rightinfo">

  <div class="tools">

    <ul class="toolbar">
      <li onclick="window.dialog('/mobile/registrationForm/add')" class="click"><span><img
              src="/mobile/img/t01.png"/></span>添加
      </li>
      <li onclick="DeleteMulit()"><span><img src="/mobile/img/t03.png"/></span>删除</li>
    </ul>
  </div>


  <table class="tablelist">
    <thead>
    <tr>
      <th><input name="" type="checkbox" id="ctrall" value=""/></th>
      <th>编号</th>
      <th>名称</th>
      <th>单位区域</th>
      <th>创建时间</th>
      <th>填表时间</th>
      <th>截止时间</th>
      <th>填报单位</th>
      <th>调查员</th>
      <th>调查员联系电话</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${list}">

      <tr>
        <td><input class="ctr" name="" type="checkbox" value="${item.id}"/></td>
        <td>${item.no}</td>
        <td>${item.name}</td>
        <td><my:ctp code="${item.region_id}"/></td>
        <td><fmt:formatDate value="${item.record_date}" pattern="yyyy-MM-dd"/></td>
        <td><fmt:formatDate value="${item.end_date}" pattern="yyyy-MM-dd"/></td>
        <td>${item.record_entity}</td>
        <td>${item.record_person_name}</td>
        <td>${item.record_person_phone}</td>
        <td><a href="/mobile/registrationForm/edit?id=${item.id}" class="tablelink">修改/查看</a> <a
                href="javascript:Delete('${item.id}')" class="tablelink"> 删除</a></td>

      </tr>
    </c:forEach>
    </tbody>
  </table>


  <div class="pagin">
    <div class="message">共<i class="blue">${count}</i>条记录，当前显示第&nbsp;<i class="blue">${index}</i>页</div>
    <div id="pageGro" class="cb">

    </div>
    <script type="text/javascript">/*分页插件*/
    $('#pageGro').pagination({
      coping: true,
      homePage: '首页',
      endPage: '末页',
      prevContent: '上页',
      nextContent: '下页',
      current:${index},
      pageCount:${countpage},
      callback: function (index) {
        window.location.href = "/mobile/registrationForm/list?page=" + index;
      }
    });
    </script>
  </div>
</div>


<script type="text/javascript">
  $('.tablelist tbody tr:odd').addClass('odd');


</script>

</body>

</html>
