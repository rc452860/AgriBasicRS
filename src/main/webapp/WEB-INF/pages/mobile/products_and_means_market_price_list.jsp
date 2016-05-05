<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-04-04
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: EdifierWill
  Date: 2016/4/3
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="my" uri="/exam" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>无标题文档</title>
  <script type="text/javascript">
    window.deleteUrl = "/mobile/productsAndMeansMarketPrice/delete";
    window.deleteMulUrl = "/mobile/productsAndMeansMarketPrice/deleteMulit";
  </script>
  <c:import url="references.jsp"></c:import>

</head>


<body>

<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">主要农产品和农业生产资料价格监测旬报表(市场价格)</a></li>
    <li><a href="#">主要农产品和农业生产资料价格监测旬报表(市场价格)列表</a></li>
  </ul>
</div>

<div class="rightinfo">

  <div class="tools">

    <ul class="toolbar">
      <li onclick="window.dialog('/mobile/productsAndMeansMarketPrice/add')" class="click"><span><img
              src="/mobile/img/t01.png"/></span>添加
      </li>
      <li onclick="DeleteMulit()"><span><img src="/mobile/img/t03.png"/></span>删除</li>
    </ul>
  </div>


  <table class="tablelist">
    <thead>
    <tr>
      <th><input name="" type="checkbox" id="ctrall" value=""/></th>
      <th>调查表</th>
      <th>乡镇名称</th>
      <th>早籼稻</th>
      <th>中籼稻</th>
      <th>晚籼稻</th>
      <th>粳稻</th>
      <th>小麦</th>
      <th>玉米</th>
      <th>大豆</th>
      <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${list}">

      <tr>
        <td><input class="ctr" name="" type="checkbox" value="${item.id}"/></td>
        <td><my:ctr code="${item.registration_form_id}"/></td>
        <td>${item.townships}</td>
        <td>${item.raw_grain_zaoxiandao}</td>
        <td>${item.raw_grain_zhongxiandao}</td>
        <td>${item.raw_grain_wanxiandao}</td>
        <td>${item.raw_grain_jingdao}</td>
        <td>${item.raw_grain_xiaomai}</td>
        <td>${item.raw_grain_yumi}</td>
        <td>${item.raw_grain_dadou}</td>
        <td><a href="/mobile/productsAndMeansMarketPrice/edit?id=${item.id}" class="tablelink">修改/查看</a> <a
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
        window.location.href = "/mobile/productsAndMeansMarketPrice/list?page=" + index;
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

