<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-03-29
  Time: 23:41
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="/exam" prefix="my"%>
<%@ taglib prefix="Form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <title>无标题文档</title>
  <c:import url="references.jsp"></c:import>
  <script type="text/javascript">
    function inittree() {
      $(".tree-city").combotree("tree").tree({
        onBeforeExpand: function (node) {
          var children = $('.tree-city').combotree("tree").tree('getChildren', node.target);
          if (children.length > 0) {
            return;
          }
          //var level = node.attributes.level;
          var pid = node.id;
          //这里注意，请查看后面的有关这里的描述（最后的描述）
          $('.tree-city').combotree("tree").tree("options").url = "/mobile/region/getChild";
        }
      })
      setTimeout(function(){
        $(".tree-city").each(function(){
          $(this).next().find(".combo-text").val($(this).attr("displaytext"));
        })
      },200);
    }
  </script>
  <%--<link href="/mobile/css/style.css" rel="stylesheet" type="text/css"/>
  <link rel="stylesheet" href="/mobile/css/table.css">
  <script type="text/javascript" src="/mobile/js/jquery.js"></script>
  <script type="text/javascript" src="/mobile/js/jquery.idTabs.min.js"></script>
  <script type="text/javascript" src="/mobile/kindeditor/kindeditor-min.js"></script>
  <script type="text/javascript" src="/mobile/kindeditor/lang/zh_CN.js"></script>
  <script type="text/javascript" src="/mobile/laydate/laydate.js"></script>

  <script type="text/javascript">
    KindEditor.ready(function (K) {
      K.create("#note", {
        afterBlur: function () {
          this.sync();
        }
      })
    })
  </script>--%>


</head>

<body>


<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">调查表修改</a></li>
  </ul>
</div>

<div class="formbody">

  <form:form commandName="RegistrationFormForm">
    <form:hidden path="id"/>
        <table class="form-add" cellpadding="0" cellspacing="0">
          <tr>
            <td>序号</td>
            <td><form:input path="no" style="width:150px;height:24px;" type="text"/></td>
            <td>名称</td>
            <td><form:input path="name" style="width:150px;height:24px;" type="text"/></td>
          </tr>
          <tr>
            <td>区域单位编号</td>
            <td><form:input path="region_id" displaytext='${region.name}' class="easyui-combotree tree-city" data-options="url:'/mobile/region/getRoot',method:'get',required:true" style="width:152px;height:26px;" type="text"/></td>
            <td>表格类型</td>
            <td><form:input path="form_type" style="width:150px;height:24px;" type="text"/></td>
          </tr>
          <tr>
            <td>是否多数据表</td>
            <td><form:input path="is_multidata" style="width:150px;height:24px;" type="text"/></td>
            <td>填表时间</td>
            <td><form:input path="record_date" class="easyui-datebox" style="width:152px;height:26px;" type="text"/></td>
          </tr>
          <tr>
            <td>截止时间</td>
            <td><form:input path="end_date" class="easyui-datebox" style="width:152px;height:26px;" type="text"/></td>
            <td>填报单位</td>
            <td><form:input path="record_entity" style="width:150px;height:24px;" type="text"/></td>
          </tr>
          <tr>
            <td>调查员姓名</td>
            <td><form:input path="record_person_name"  style="width:150px;height:24px;" type="text"/></td>
            <td>调查员联系电话</td>
            <td><form:input path="record_person_phone" style="width:150px;height:24px;" type="text"/></td>
          </tr>
          <tr>
            <td align="center" colspan="4"><input name="" type="button" id="submit_button" value="提交"/>&nbsp;&nbsp;<input name="" type="reset" value="重置"/></td>
          </tr>
        </table>
    <%--<div id="usual1" class="usual">

      <div class="itab">
        <ul>
          <li><a href="#tab1" class="selected">基本信息</a></li>
        </ul>
      </div>

      <div id="tab1" class="tabson">
        <ul class="forminfo">
          <li><label>序号<b>*</b></label><form:input path="no" name="" type="text" class="dfinput" value=""
                                                   style="width:518px;"/></li>
          <li><label>名称<b>*</b></label><form:input path="name" name="" type="text" class="dfinput"
                                                   value="" style="width:518px;"/></li>
          <li><label>区域单位编号<b>*</b></label><form:input path="region_id" name="" type="text" class="dfinput"
                                                       value="" style="width:518px;"/></li>
          <li><label>表格类型<b>*</b></label><form:input path="form_type" name="" type="text" class="dfinput"
                                                     value="" style="width:518px;"/></li>
          <li><label>是否多数据表<b>*</b></label><form:input path="multidata" name="" type="text" class="dfinput" value=""
                                                       style="width:518px;"/></li>
          <li><label>填表时间<b>*</b></label><form:input path="record_date" name="" type="text" class="dfinput" value=""
                                                     style="width:518px;" onclick="laydate()"/></li>
          <li><label>截止时间<b>*</b></label><form:input path="end_date" name="" type="text"
                                                     class="dfinput" value="" style="width:518px;" onclick="laydate()"/></li>
          <li><label>填报单位<b>*</b></label><form:input path="record_entity" name="" type="text"
                                                     class="dfinput" value="" style="width:518px;"/></li>
          <li><label>调查员姓名<b>*</b></label><form:input path="record_person_name" name="" type="text"
                                                      class="dfinput" value="" style="width:518px;"/></li>
          <li><label>调查员联系电话<b>*</b></label><form:input path="record_person_phone" name="" type="text"
                                                        class="dfinput" value="" style="width:518px;"/></li>
          <li><label>&nbsp;</label><input type="button" id="submit_button" class="btn" value="提交"/></li>
        </ul>
      </div>

    </div>--%>
  </form:form>

  <%--此乃登陆代码--%>
  <script type="text/javascript">
    $(function () {
      $('#submit_button').click(function () {
        $.ajax({
          cache: false,
          type: "POST",
          url: "/mobile/registrationForm/edit",
          data: $('#RegistrationFormForm').serialize(),
          async: false,
          error: function (XMLHttpRequest) {
            alert("error:" + XMLHttpRequest.status);
          },
          success: function (data) {
            if (data.message != null) alert(data.message);
            if (data.url != null) window.location.href = data.url;
          }
        });
      });
    });
  </script>

</div>
</body>
</html>
