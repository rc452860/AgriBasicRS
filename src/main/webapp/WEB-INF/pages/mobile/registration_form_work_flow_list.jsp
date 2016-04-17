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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>无标题文档</title>
  <link href="/mobile/css/style.css" rel="stylesheet" />
  <script type="text/javascript" src="/mobile/js/jquery.js"></script>
  <script type="text/javascript">
    function Accpet() {/*通过脚本*/
      var arr = new Array();
      $(".ctr:checked").each(function () {
        arr.push($(this).val())
      });
      console.log(arr)
      $.ajax({
        cache: false,
        type: "POST",
        url: "/mobile/registrationForm/accpet", /*此处需修改*/
        data: {ids: arr},
        async: false,
        error: function (XMLHttpRequest) {
          alert("error:" + XMLHttpRequest.status);
        },
        success: function (data) {
          if (data.message != null) alert(data.message);
          /*if(data.url != null) window.location.href = data.url;*/
          if (data.message == "通过(上报)成功")
            window.location.reload();
        }
      });
    }
    function Reject() {/*拒绝脚本*/
      var arr = new Array();
      $(".ctr:checked").each(function () {
        arr.push($(this).val())
      });
      console.log(arr)
      $.ajax({
        cache: false,
        type: "POST",
        url: "/mobile/registrationForm/reject", /*此处需修改*/
        data: {ids: arr},
        async: false,
        error: function (XMLHttpRequest) {
          alert("error:" + XMLHttpRequest.status);
        },
        success: function (data) {
          if (data.message != null) alert(data.message);
          /*if(data.url != null) window.location.href = data.url;*/
          if (data.message == "拒绝(打回)成功")
            window.location.reload();
        }
      });
    }
    $(function () {
      $("#ctrall").click(function () {
        $(".ctr").attr("checked", $(this).attr("checked") != null);
      })
    })
  </script>
  <%--分页插件--%>
  <link rel="stylesheet" href="/mobile/css/pagination.css">
  <script type="text/javascript" src="/mobile/js/jquery.pagination.min.js"></script>
</head>


<body>

<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">调查表信息</a></li>
    <li><a href="#">调查表上报审核</a></li>
  </ul>
</div>

<div class="rightinfo">

  <div class="tools">

    <ul class="toolbar">
      <li onclick="Accpet()" class="click"><span><img
              src="/mobile/img/t01.png"/></span>通过(上报)
      </li>
      <li onclick="Reject()"><span><img src="/mobile/img/t03.png"/></span>拒绝(打回)</li>
    </ul>
  </div>


  <table class="tablelist">
    <thead>
    <tr>
      <th><input name="" type="checkbox" id="ctrall" value=""/></th>
      <th>编号</th>
      <th>名称</th>
      <th>表格类型</th>
      <th>填表时间</th>
      <th>截止时间</th>
      <th>填报单位</th>
      <th>调查员</th>
      <th>调查员联系电话</th>
      <th></th>
      <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${list}">

      <tr>
        <td><input class="ctr" name="" type="checkbox" value="${item.id}"/></td>
        <td>${item.no}</td>
        <td>${item.name}</td>
        <td>${item.form_type}</td>
        <td>${item.record_date}</td>
        <td>${item.end_date}</td>
        <td>${item.record_entity}</td>
        <td>${item.record_person_name}</td>
        <td>${item.record_person_phone}</td>
        <td><a href="/mobile/registrationForm/info?id=${item.id}" class="tablelink">详情</a></td>
        <td><a href="/mobile/registrationForm/process?id=${item.id}" class="tablelink">进度</a></td>

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
        window.location.href = "/mobile/registrationForm/workflowlist?page=" + index;
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
