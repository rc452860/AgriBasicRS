<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-03-31
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="Form" uri="http://www.springframework.org/tags/form" %>
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
    <li><a href="#">调查表修改</a></li>
  </ul>
</div>

<div class="formbody">
  <form:form commandName="AutumnFoodExpecProForm">
    <form:hidden path="autumnFoodExpecPro.id"/>
    <form:hidden path="autumnFoodExpecPro.food_itemid"/>
    <form:hidden path="autumnFoodExpecPro.food_zhongdaoyijidao_itemid"/>
    <form:hidden path="autumnFoodExpecPro.food_shuangjiwandao_itemid"/>
    <form:hidden path="autumnFoodExpecPro.food_yumi_itemid"/>
    <form:hidden path="autumnFoodExpecPro.food_dadou_itemid"/>
    <form:hidden path="autumnFoodExpecPro.rapeseed_itemid"/>
    <form:hidden path="autumnFoodExpecPro.rapeseed_huasheng_itemid"/>
    <form:hidden path="autumnFoodExpecPro.cotton_itemid"/>
    <form:hidden path="autumnFoodExpecPro.sugar_itemid"/>
    <form:hidden path="food_item.id"/>
    <form:hidden path="food_zhongdaoyijidao_item.id"/>
    <form:hidden path="food_shuangjiwandao_item.id"/>
    <form:hidden path="food_yumi_item.id"/>
    <form:hidden path="food_dadou_item.id"/>
    <form:hidden path="rapeseed_item.id"/>
    <form:hidden path="rapeseed_huasheng_item.id"/>
    <form:hidden path="cotton_item.id"/>
    <form:hidden path="sugar_item.id"/>

    <table class="form-add" cellpadding="0" cellspacing="0">
      <tr>
        <td>调查表编号</td>
        <td><form:input class="easyui-combobox" required="true" data-options="url:'/mobile/registrationForm/selectJsonB',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'" path="autumnFoodExpecPro.registration_form_id" /></td>
      </tr>
      <tr>
        <td>调查村数</td>
        <td><form:input path="autumnFoodExpecPro.survey_village_num" /></td>
      </tr>
      <tr>
        <td>调查户数</td>
        <td><form:input path="autumnFoodExpecPro.survey_family_num" /></td>
      </tr>
      <tr>
        <td colspan="2">秋粮合计</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="food_item.seededarea_thisyear" /></td>
            </tr>
              <%--<tr>
                <td colspan="4">单产（公斤/亩）</td>
              </tr>
              <tr>
                <td>上年实际</td>
                <td><form:input path="food_item.perunit_lastyear" /></td>
                <td>本年预计</td>
                <td><form:input path="food_item.perunit_thisyear" /></td>
              </tr>
              <tr>
                <td>绝对数</td>
                <td><form:input path="food_item.perunit_Increasedecrease_absolute" /></td>
                <td>相对数</td>
                <td><form:input path="food_item.perunit_Increasedecrease_relative" /></td>
              </tr>--%>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="food_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">其中：中稻及一季稻</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_zhongdaoyijidao_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="food_zhongdaoyijidao_item.seededarea_thisyear" /></td>
            </tr>
              <%--<tr>
                <td colspan="4">单产（公斤/亩）</td>
              </tr>
              <tr>
                <td>上年实际</td>
                <td><form:input path="food_xiaomai_food_item.perunit_lastyear" /></td>
                <td>本年预计</td>
                <td><form:input path="food_xiaomai_food_item.perunit_thisyear" /></td>
              </tr>
              <tr>
                <td>绝对数</td>
                <td><form:input path="food_xiaomai_food_item.perunit_Increasedecrease_absolute" /></td>
                <td>相对数</td>
                <td><form:input path="food_xiaomai_food_item.perunit_Increasedecrease_relative" /></td>
              </tr>--%>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_zhongdaoyijidao_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="food_zhongdaoyijidao_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">其中：双季晚稻</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_shuangjiwandao_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="food_shuangjiwandao_item.seededarea_thisyear" /></td>
            </tr>
              <%--<tr>
                <td colspan="4">单产（公斤/亩）</td>
              </tr>
              <tr>
                <td>上年实际</td>
                <td><form:input path="rapeseed_food_item.perunit_lastyear" /></td>
                <td>本年预计</td>
                <td><form:input path="rapeseed_food_item.perunit_thisyear" /></td>
              </tr>
              <tr>
                <td>绝对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_absolute" /></td>
                <td>相对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_relative" /></td>
              </tr>--%>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_shuangjiwandao_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="food_shuangjiwandao_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">其中：玉米</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_yumi_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="food_yumi_item.seededarea_thisyear" /></td>
            </tr>
              <%--<tr>
                <td colspan="4">单产（公斤/亩）</td>
              </tr>
              <tr>
                <td>上年实际</td>
                <td><form:input path="rapeseed_food_item.perunit_lastyear" /></td>
                <td>本年预计</td>
                <td><form:input path="rapeseed_food_item.perunit_thisyear" /></td>
              </tr>
              <tr>
                <td>绝对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_absolute" /></td>
                <td>相对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_relative" /></td>
              </tr>--%>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_yumi_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="food_yumi_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">其中：大豆</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_dadou_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="food_dadou_item.seededarea_thisyear" /></td>
            </tr>
              <%--<tr>
                <td colspan="4">单产（公斤/亩）</td>
              </tr>
              <tr>
                <td>上年实际</td>
                <td><form:input path="rapeseed_food_item.perunit_lastyear" /></td>
                <td>本年预计</td>
                <td><form:input path="rapeseed_food_item.perunit_thisyear" /></td>
              </tr>
              <tr>
                <td>绝对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_absolute" /></td>
                <td>相对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_relative" /></td>
              </tr>--%>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_dadou_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="food_dadou_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
      </tr>

      <tr>
        <td colspan="2">油料</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="rapeseed_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="rapeseed_item.seededarea_thisyear" /></td>
            </tr>
              <%--<tr>
                <td colspan="4">单产（公斤/亩）</td>
              </tr>
              <tr>
                <td>上年实际</td>
                <td><form:input path="rapeseed_food_item.perunit_lastyear" /></td>
                <td>本年预计</td>
                <td><form:input path="rapeseed_food_item.perunit_thisyear" /></td>
              </tr>
              <tr>
                <td>绝对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_absolute" /></td>
                <td>相对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_relative" /></td>
              </tr>--%>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="rapeseed_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="rapeseed_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
      </tr>

      <tr>
        <td colspan="2">其中：花生</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="rapeseed_huasheng_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="rapeseed_huasheng_item.seededarea_thisyear" /></td>
            </tr>
              <%--<tr>
                <td colspan="4">单产（公斤/亩）</td>
              </tr>
              <tr>
                <td>上年实际</td>
                <td><form:input path="rapeseed_food_item.perunit_lastyear" /></td>
                <td>本年预计</td>
                <td><form:input path="rapeseed_food_item.perunit_thisyear" /></td>
              </tr>
              <tr>
                <td>绝对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_absolute" /></td>
                <td>相对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_relative" /></td>
              </tr>--%>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="rapeseed_huasheng_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="rapeseed_huasheng_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
      </tr>

      <tr>
        <td colspan="2">棉花</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="cotton_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="cotton_item.seededarea_thisyear" /></td>
            </tr>
              <%--<tr>
                <td colspan="4">单产（公斤/亩）</td>
              </tr>
              <tr>
                <td>上年实际</td>
                <td><form:input path="rapeseed_food_item.perunit_lastyear" /></td>
                <td>本年预计</td>
                <td><form:input path="rapeseed_food_item.perunit_thisyear" /></td>
              </tr>
              <tr>
                <td>绝对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_absolute" /></td>
                <td>相对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_relative" /></td>
              </tr>--%>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="cotton_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="cotton_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
      </tr>

      <tr>
        <td colspan="2">糖料(甘蔗)</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="sugar_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="sugar_item.seededarea_thisyear" /></td>
            </tr>
              <%--<tr>
                <td colspan="4">单产（公斤/亩）</td>
              </tr>
              <tr>
                <td>上年实际</td>
                <td><form:input path="rapeseed_food_item.perunit_lastyear" /></td>
                <td>本年预计</td>
                <td><form:input path="rapeseed_food_item.perunit_thisyear" /></td>
              </tr>
              <tr>
                <td>绝对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_absolute" /></td>
                <td>相对数</td>
                <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_relative" /></td>
              </tr>--%>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="sugar_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="sugar_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
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
          url: "/mobile/autumnFoodExpecPro/edit",
          data: $('#AutumnFoodExpecProForm').serialize(),
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
