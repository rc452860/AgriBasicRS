<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-03-31
  Time: 23:03
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
  <link href="/mobile/css/style.css" rel="stylesheet" />
  <script type="text/javascript" src="/mobile/js/jquery.js"></script>
  <script type="text/javascript">
    function Delete(id) {/*删除脚本*/
      $.ajax({
        cache: false,
        type: "POST",
        url: "/mobile/autumnFoodExpecPro/delete", /*此处需修改*/
        data: {'id': id},
        async: false,
        error: function (XMLHttpRequest) {
          alert("error:" + XMLHttpRequest.status);
        },
        success: function (data) {
          if (data.message != null) alert(data.message);
          /*if(data.url != null) window.location.href = data.url;*/
          if (data.message == "删除成功")
            window.location.reload();
        }
      });
    }
    function DeleteMulit() {
      var arr = new Array();
      $(".ctr:checked").each(function () {
        arr.push($(this).val())
      });

      $.ajax({
        cache: false,
        type: "POST",
        url: "/mobile/autumnFoodExpecPro/deleteMulit", /*此处需修改*/
        data: {ids: arr},
        async: false,
        error: function (XMLHttpRequest) {
          alert("error:" + XMLHttpRequest.status);
        },
        success: function (data) {
          if (data.message != null) alert(data.message);
          /*if(data.url != null) window.location.href = data.url;*/
          if (data.message == "删除成功")
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
    <li><a href="#">调查表列表</a></li>
  </ul>
</div>

<div class="rightinfo">

  <div class="tools">

    <ul class="toolbar">
      <li onclick="window.location.href='/mobile/autumnFoodExpecPro/add'" class="click"><span><img
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
      <th>调查村数</th>
      <th>调查户数</th>
      <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${list}">

      <tr>
        <td><input class="ctr" name="" type="checkbox" value="${item.id}"/></td>
        <td><my:ctr code="${item.registration_form_id}"/></td>
        <td>${item.survey_village_num}</td>
        <td>${item.survey_family_num}</td>
        <td><a href="/mobile/autumnFoodExpecPro/edit?id=${item.id}" class="tablelink">修改/查看</a> <a
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
        window.location.href = "/mobile/autumnFoodExpecPro/list?page=" + index;
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
