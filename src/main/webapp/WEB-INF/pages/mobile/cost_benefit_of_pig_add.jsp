<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-04-03
  Time: 0:05
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
  <c:import url="references.jsp"></c:import>
</head>

<body>


<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">出栏肥猪生产成本、收益</a></li>
    <li><a href="#">新增调查信息</a></li>
  </ul>
</div>

<div class="formbody">
  <div id="dd"></div>
  <script type="text/javascript">
    $(function(){
      $(".choose").click(function(){
        $('#dd').dialog({
          title: '选择编号',
          width: 700,
          height: 400,
          closed: false,
          cache: false,
          href: '/mobile/registrationForm/select',
          modal: true
        });
        window.chooser = $(this);
      })
      window.choose = function(no,name){
        window.chooser.val(no);
        $('#dd').dialog("close");
      }
    })
  </script>
  <form:form commandName="CostBenefitOfPigForm">
    <table class="form-add" cellpadding="0" cellspacing="0">
      <tr>
        <td>调查表编号</td>
        <td><form:input class="choose easyui-validatebox" required="true" readonly="true" path="costBenefitOfPig.registration_form_id"/></td>
      </tr>
      <tr>
        <td>调查县数</td>
        <td><form:input path="costBenefitOfPig.county_num"/></td>
      </tr>
      <tr>
        <td>调查户数</td>
        <td><form:input path="costBenefitOfPig.family_num"/></td>
      </tr>
      <tr>
        <td>调查头数</td>
        <td><form:input path="costBenefitOfPig.head_num"/></td>
      </tr>
      <tr>
        <td>平均饲养时间</td>
        <td><form:input path="costBenefitOfPig.average_feeding_time"/></td>
      </tr>
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
          url: "/mobile/costBenefitOfPig/add",
          data: $('#CostBenefitOfPigForm').serialize(),
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
