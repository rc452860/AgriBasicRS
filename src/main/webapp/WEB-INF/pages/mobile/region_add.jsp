<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-03-29
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>无标题文档</title>
  <link href="/mobile/css/style.css" rel="stylesheet" type="text/css"/>
  <link rel="stylesheet" href="/mobile/css/table.css">
  <script type="text/javascript" src="/mobile/js/jquery.js"></script>
  <script type="text/javascript" src="/mobile/js/jquery.idTabs.min.js"></script>
  <script type="text/javascript" src="/mobile/kindeditor/kindeditor-min.js"></script>
  <script type="text/javascript" src="/mobile/kindeditor/lang/zh_CN.js"></script>
  <script type="text/javascript" src="/mobile/laydate/laydate.js"></script>

  <script type="text/javascript">
    KindEditor.ready(function(K){
      K.create("#note",{
        afterBlur:function(){
          this.sync();
        }
      })
    })
  </script>


</head>

<body>


<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">系统设置</a></li>
  </ul>
</div>

<div class="formbody">

  <form:form commandName="RegionForm">
    <table class="form-add" cellpadding="0" cellspacing="0">
      <tr>
        <td>序号</td><td><form:input  path="no"/></td>
        <td>名称</td><td><form:input  path="name"/></td>
      </tr>
     <%-- <tr>
        <td>全称</td><td><form:input  path="fullname"/></td>
        <td>父区域单位编号</td><td><form:input  path="fatherno"/></td>
      </tr>
      <tr>
        <td>短码1</td><td><form:input  path="shortnoone"/></td>
        <td>短码2</td><td><form:input  path="shortnotwo"/></td>
      </tr>--%>
      <tr>
        <td align="center" colspan="4"><input name="" type="button" id="submit_button" value="提交"/>&nbsp;&nbsp;<input name="" type="reset" value="重置"/></td>
      </tr>
    </table>
  </form:form>

  <%--此乃登陆代码--%>
  <script type="text/javascript">
    $(function () {
      $('#submit_button').click(function () {
        $.ajax({
          cache: false,
          type: "POST",
          url: "/mobile/region/add",
          data: $('#RegionForm').serialize(),
          async: false,
          error: function (XMLHttpRequest) {
            alert("error:" + XMLHttpRequest.status);
          },
          success: function (data) {
            if(data.message != null) alert(data.message);
            if(data.url != null) window.location.href = data.url;
          }
        });
      });
    });
  </script>

</div>
</body>
</html>
