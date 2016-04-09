<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-03-30
  Time: 22:56
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

  <form:form commandName="SummerFoodAndRapeseedExpecProForm">
    <form:hidden path="summerFoodAndRapeseedExpecPro.id"/>
    <form:hidden path="summerFoodAndRapeseedExpecPro.food_itemid"/>
    <form:hidden path="summerFoodAndRapeseedExpecPro.food_xiaomai_food_itemid"/>
    <form:hidden path="summerFoodAndRapeseedExpecPro.rapeseed_youcaizi_itemid"/>
    <form:hidden path="food_item.id"/>
    <form:hidden path="food_xiaomai_food_item.id"/>
    <form:hidden path="rapeseed_food_item.id"/>

    <table class="form-add" cellpadding="0" cellspacing="0">
      <tr>
        <td>调查表编号</td>
        <td><form:input path="summerFoodAndRapeseedExpecPro.registration_form_id" /></td>
      </tr>
      <tr>
        <td>调查村数</td>
        <td><form:input path="summerFoodAndRapeseedExpecPro.survey_village_num" /></td>
      </tr>
      <tr>
        <td>调查户数</td>
        <td><form:input path="summerFoodAndRapeseedExpecPro.survey_family_num" /></td>
      </tr>
      <tr>
        <td colspan="2">夏粮</td>
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
            <tr>
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
            </tr>
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
        <td colspan="2">其中：小麦</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_xiaomai_food_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="food_xiaomai_food_item.seededarea_thisyear" /></td>
            </tr>
            <tr>
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
            </tr>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="food_xiaomai_food_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="food_xiaomai_food_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="2">其中：油菜籽</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">播种面积（亩）</td>
            </tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="rapeseed_food_item.seededarea_lastyear" /></td>
              <td>本年预计</td>
              <td><form:input path="rapeseed_food_item.seededarea_thisyear" /></td>
            </tr>
            <tr>
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
            </tr>
            <tr><td colspan="4">总产量（吨）</td></tr>
            <tr>
              <td>上年实际</td>
              <td><form:input path="rapeseed_food_item.total_lastyear"/></td>
              <td>本年预计</td>
              <td><form:input path="rapeseed_food_item.total_thisyear"/></td>
            </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td align="center" colspan="4"><input name="" type="button" id="submit_button" value="提交"/>&nbsp;&nbsp;<input name="" type="reset" value="重置"/></td>
      </tr>
    </table>
    <%--<div id="usual1" class="usual">

      <div class="itab">
        <ul>
          <li><a href="#tab1" class="selected">基本信息</a></li>
          <li><a href="#tab2">夏粮</a></li>
          <li><a href="#tab3">其中：小麦</a></li>
          <li><a href="#tab4">油菜籽</a></li>
        </ul>
      </div>

      <div id="tab1" class="tabson">&lt;%&ndash;基本信息&ndash;%&gt;

        <ul class="forminfo">
          <li><label>调查表编号<b>*</b></label><form:input path="summerFoodAndRapeseedExpecPro.registration_form_id" name="" type="text" class="dfinput" value=""
                                                      style="width:518px;"/></li>
          <li><label>调查村数<b>*</b></label><form:input path="summerFoodAndRapeseedExpecPro.survey_village_num" name="" type="text" class="dfinput" value=""
                                                     style="width:518px;"/></li>
          <li><label>调查户数<b>*</b></label><form:input path="summerFoodAndRapeseedExpecPro.survey_family_num" name="" type="text" class="dfinput" value=""
                                                     style="width:518px;"/></li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(1)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab2" class="tabson">&lt;%&ndash;夏粮&ndash;%&gt;
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>绝对数<b>*</b></label><form:input path="food_item.seededarea_Increasedecrease_absolute" name="" type="text" class="dfinput" value=""/></li>
                <li><label>相对数<b>*</b></label><form:input path="food_item.seededarea_Increasedecrease_relative" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
            &lt;%&ndash;
                      <li>
                        <div class="formbody">
                          <div class="formtitle"><span>单产（公斤/亩）</span></div>
                          <ul class="forminfo">
                            <li><label>上年实际<b>*</b></label><form:input path="food_item.perunit_lastyear" name="" type="text" class="dfinput" value=""/></li>
                            <li><label>本年预计<b>*</b></label><form:input path="food_item.perunit_thisyear" name="" type="text" class="dfinput" value=""/></li>
                            <li><label>绝对数<b>*</b></label><form:input path="food_item.perunit_Increasedecrease_absolute" name="" type="text" class="dfinput" value=""/></li>
                            <li><label>相对数<b>*</b></label><form:input path="food_item.perunit_Increasedecrease_relative" name="" type="text" class="dfinput" value=""/></li>
                          </ul>
                        </div>
                      </li>
            &ndash;%&gt;
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>绝对数<b>*</b></label><form:input path="food_item.total_Increasedecrease_absolute" name="" type="text" class="dfinput" value=""/></li>
                <li><label>相对数<b>*</b></label><form:input path="food_item.total_Increasedecrease_relative" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(2)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab3" class="tabson">&lt;%&ndash;其中：小麦&ndash;%&gt;
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_xiaomai_food_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_xiaomai_food_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>绝对数<b>*</b></label><form:input path="food_xiaomai_food_item.seededarea_Increasedecrease_absolute" name="" type="text" class="dfinput" value=""/></li>
                <li><label>相对数<b>*</b></label><form:input path="food_xiaomai_food_item.seededarea_Increasedecrease_relative" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
            &lt;%&ndash;
                        <li>
                          <div class="formbody">
                            <div class="formtitle"><span>单产（公斤/亩）</span></div>
                            <ul class="forminfo">
                              <li><label>上年实际<b>*</b></label><form:input path="food_xiaomai_food_item.perunit_lastyear" name="" type="text" class="dfinput" value=""/></li>
                              <li><label>本年预计<b>*</b></label><form:input path="food_xiaomai_food_item.perunit_thisyear" name="" type="text" class="dfinput" value=""/></li>
                              <li><label>绝对数<b>*</b></label><form:input path="food_xiaomai_food_item.perunit_Increasedecrease_absolute" name="" type="text" class="dfinput" value=""/></li>
                              <li><label>相对数<b>*</b></label><form:input path="food_xiaomai_food_item.perunit_Increasedecrease_relative" name="" type="text" class="dfinput" value=""/></li>
                            </ul>
                          </div>
                        </li>
              &ndash;%&gt;
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_xiaomai_food_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_xiaomai_food_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>绝对数<b>*</b></label><form:input path="food_xiaomai_food_item.total_Increasedecrease_absolute" name="" type="text" class="dfinput" value=""/></li>
                <li><label>相对数<b>*</b></label><form:input path="food_xiaomai_food_item.total_Increasedecrease_relative" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(3)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>

      <div id="tab4" class="tabson">&lt;%&ndash;油菜籽&ndash;%&gt;
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="rapeseed_food_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="rapeseed_food_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>绝对数<b>*</b></label><form:input path="rapeseed_food_item.seededarea_Increasedecrease_absolute" name="" type="text" class="dfinput" value=""/></li>
                <li><label>相对数<b>*</b></label><form:input path="rapeseed_food_item.seededarea_Increasedecrease_relative" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
            &lt;%&ndash;
                <li>
                  <div class="formbody">
                    <div class="formtitle"><span>单产（公斤/亩）</span></div>
                    <ul class="forminfo">
                      <li><label>上年实际<b>*</b></label><form:input path="rapeseed_food_item.perunit_lastyear" name="" type="text" class="dfinput" value=""/></li>
                      <li><label>本年预计<b>*</b></label><form:input path="rapeseed_food_item.perunit_thisyear" name="" type="text" class="dfinput" value=""/></li>
                      <li><label>绝对数<b>*</b></label><form:input path="rapeseed_food_item.perunit_Increasedecrease_absolute" name="" type="text" class="dfinput" value=""/></li>
                      <li><label>相对数<b>*</b></label><form:input path="rapeseed_food_item.perunit_Increasedecrease_relative" name="" type="text" class="dfinput" value=""/></li>
                    </ul>
                  </div>
                </li>
            &ndash;%&gt;
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="rapeseed_food_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="rapeseed_food_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>绝对数<b>*</b></label><form:input path="rapeseed_food_item.total_Increasedecrease_absolute" name="" type="text" class="dfinput" value=""/></li>
                <li><label>相对数<b>*</b></label><form:input path="rapeseed_food_item.total_Increasedecrease_relative" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" id="submit_button" class="btn" value="提交"/></li>
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
          url: "/mobile/summerFoodAndRapeseedExpecPro/edit",
          data: $('#SummerFoodAndRapeseedExpecProForm').serialize(),
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
