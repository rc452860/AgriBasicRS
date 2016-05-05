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
    <li><a href="#">主要农产品和农业生产资料价格监测旬报表(农民售价)</a></li>
    <li><a href="#">修改调查信息</a></li>
  </ul>
</div>

<div class="formbody">


  <form:form commandName="ProductsAndMeansFarmerPriceForm">
    <form:hidden path="productsAndMeansFarmerPrice.id"/>
    <table class="form-add" cellpadding="0" cellspacing="0">
      <tr>
        <td>调查表编号</td><td colspan="5"><form:input  class="easyui-combobox" required="true" data-options="url:'/mobile/registrationForm/selectJsonB/productsAndMeansFarmerPrice',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'" path="productsAndMeansFarmerPrice.registration_form_id"/></td>
      </tr>
      <tr>
        <td>乡镇名称</td><td colspan="5"><form:input  path="productsAndMeansFarmerPrice.townships"/></td>
      </tr>
      <!--原粮-->
      <tr>
        <td colspan="6">原粮</td>
      </tr>
      <tr>
        <td>早籼稻</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_zaoxiandao"/></td>
        <td>中籼稻</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_zhongxiandao"/></td>
        <td>晚籼稻</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_wanxiandao"/></td>
      </tr>
      <tr>
        <td>粳稻</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_jingdao"/></td>
        <td>小麦</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_xiaomai"/></td>
        <td>玉米</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_yumi"/></td>
      </tr>
      <tr>
        <td>大豆</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_dadou"/></td>
        <td colspan="4"></td>
      </tr>

      <!--经养产品-->
      <tr>
        <td colspan="6">经养产品</td>
      </tr>
      <tr>
        <td>带壳花生</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_daikehuasheng"/></td>
        <td>花生米</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_huashengmi"/></td>
        <td>油菜籽</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_youcaizi"/></td>
      </tr>
      <tr>
        <td>生猪</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_shengzhu"/></td>
        <td>仔猪</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_zaizhu"/></td>
        <td>活鸡</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_huoji"/></td>
      </tr>
      <tr>
        <td>鸡蛋</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_jidan"/></td>
        <td>籽棉</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_zimian"/></td>
        <td>甘蔗</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_ganze"/></td>
      </tr>
      <tr>
        <td>鲤鱼</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_liyu"/></td>
        <td>鲢鱼</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_lianyu"/></td>
        <td>草鱼</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_caoyu"/></td>
      </tr>
      <tr>
        <td>白菜</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_baicai"/></td>
        <td>西红柿</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_xihongshi"/></td>
        <td>黄瓜</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_huanggua"/></td>
      </tr>
      <tr>
        <td>菜椒</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_caijiao"/></td>
        <td>土豆</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_tudou"/></td>
        <td colspan="2"></td>
      </tr>

      <tr>
        <td align="center" colspan="6"><input name="" type="button" id="submit_button" value="提交"/>&nbsp;&nbsp;<input name="" type="reset" value="重置"/></td>
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
          url: "/mobile/productsAndMeansFarmerPrice/edit",
          data: $('#ProductsAndMeansFarmerPriceForm').serialize(),
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
