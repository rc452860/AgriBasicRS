<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-04-04
  Time: 21:27
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
    <li><a href="#">主要农产品和农业生产资料价格监测旬报表(市场价格)</a></li>
    <li><a href="#">新增调查信息</a></li>
  </ul>
</div>

<div class="formbody">
  <form:form commandName="ProductsAndMeansMarketPriceForm">
    <table class="form-add" cellpadding="0" cellspacing="0">
      <tr>
        <td>调查表编号</td><td colspan="5"><form:input class="easyui-combobox" required="true" data-options="url:'/mobile/registrationForm/selectJsonB/productsAndMeansMarketPrice',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'" path="productsAndMeansMarketPrice.registration_form_id"/></td>
      </tr>
      <tr>
        <td>乡镇名称</td><td colspan="5"><form:input  path="productsAndMeansMarketPrice.townships"/></td>
      </tr>
      <!--原粮-->
      <tr>
        <td colspan="6">原粮</td>
      </tr>
      <tr>
        <td>早籼稻</td><td><form:input  path="productsAndMeansMarketPrice.raw_grain_zaoxiandao"/></td>
        <td>中籼稻</td><td><form:input  path="productsAndMeansMarketPrice.raw_grain_zhongxiandao"/></td>
        <td>晚籼稻</td><td><form:input  path="productsAndMeansMarketPrice.raw_grain_wanxiandao"/></td>
      </tr>
      <tr>
        <td>粳稻</td><td><form:input  path="productsAndMeansMarketPrice.raw_grain_jingdao"/></td>
        <td>小麦</td><td><form:input  path="productsAndMeansMarketPrice.raw_grain_xiaomai"/></td>
        <td>玉米</td><td><form:input  path="productsAndMeansMarketPrice.raw_grain_yumi"/></td>
      </tr>
      <tr>
        <td>大豆</td><td><form:input  path="productsAndMeansMarketPrice.raw_grain_dadou"/></td>
        <td colspan="4"></td>
      </tr>

      <!--成品粮-->
      <tr>
        <td colspan="6">成品粮</td>
      </tr>
      <tr>
        <td>早籼米</td><td><form:input  path="productsAndMeansMarketPrice.processed_grain_zaoxianmi"/></td>
        <td>中晚籼米</td><td><form:input  path="productsAndMeansMarketPrice.processed_grain_zhongwanxianmi"/></td>
        <td>粳米</td><td><form:input  path="productsAndMeansMarketPrice.processed_grain_jingmi"/></td>
      </tr>
      <tr>
        <td>标准粉</td><td><form:input  path="productsAndMeansMarketPrice.processed_grain_biaozhunfen"/></td>
        <td>精粉</td><td><form:input  path="productsAndMeansMarketPrice.processed_grain_jingfen"/></td>
        <td>玉米面</td><td><form:input  path="productsAndMeansMarketPrice.processed_grain_yumimian"/></td>
      </tr>
      <tr>
        <td>小米</td><td><form:input  path="productsAndMeansMarketPrice.processed_grain_xiaomi"/></td>
        <td>大麦</td><td><form:input  path="productsAndMeansMarketPrice.processed_grain_damai"/></td>
        <td colspan="2"></td>
      </tr>

      <!--经养产品-->
      <tr>
        <td colspan="6">经养产品</td>
      </tr>
      <tr>
        <td>花生米</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_huashengmi"/></td>
        <td>油菜籽</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_youcaizi"/></td>
        <td>生猪</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_shengzhu"/></td>
      </tr>
      <tr>
        <td>仔猪</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_zaizhu"/></td>
        <td>鸡蛋</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_jidan"/></td>
        <td>花生油</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_huashengyou"/></td>
      </tr>
      <tr>
        <td>菜籽油</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_caiziyou"/></td>
        <td>豆油</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_douyou"/></td>
        <td>籽棉</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_zimian"/></td>
      </tr>
      <tr>
        <td>皮棉</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_pimian"/></td>
        <td>甘蔗</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_ganze"/></td>
        <td>猪肉</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_zhurou"/></td>
      </tr>
      <tr>
        <td>牛肉</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_niurou"/></td>
        <td>羊肉</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_yangrou"/></td>
        <td>鸡肉</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_jirou"/></td>
      </tr>
      <tr>
        <td>鲤鱼</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_liyu"/></td>
        <td>鲢鱼</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_lianyu"/></td>
        <td>草鱼</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_caoyu"/></td>
      </tr>
      <tr>
        <td>带鱼</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_daiyu"/></td>
        <td>白菜</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_baicai"/></td>
        <td>西红柿</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_xihongshi"/></td>
      </tr>
      <tr>
        <td>黄瓜</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_huanggua"/></td>
        <td>菜椒</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_caijiao"/></td>
        <td>土豆</td><td><form:input  path="productsAndMeansMarketPrice.raised_product_tudou"/></td>
      </tr>

      <!--生产资料-->
      <tr>
        <td colspan="6">生产资料</td>
      </tr>
      <tr>
        <td>国产尿素</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_guochanniaosu"/></td>
        <td>进口尿素</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_jinkouniaosu"/></td>
        <td>碳酸氢铵</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_tansuanqingan"/></td>
      </tr>
      <tr>
        <td>国产磷酸二铵</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_guochanlinsuaneran"/></td>
        <td>进口磷酸二铵</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_jinkoulinsuaneran"/></td>
        <td>普通过磷酸钙</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_putongguolinsuangai"/></td>
      </tr>
      <tr>
        <td>钙镁磷肥</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_gaimeilinfei"/></td>
        <td>国产氯化钾</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_guochanlvhuagai"/></td>
        <td>国产复合肥(1)</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_guochanfuhefei1"/></td>
      </tr>
      <tr>
        <td>国产复合肥(2)</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_guochanfuhefei2"/></td>
        <td>国产复合肥(3)</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_guochanfuhefei3"/></td>
        <td>地膜</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_dimo"/></td>
      </tr>
      <tr>
        <td>普通棚膜</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_putongpengmo"/></td>
        <td>农用柴油</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_nongyongchaiyou"/></td>
        <td>育肥猪配合饲料</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_yufeizhupeihesiliao"/></td>
      </tr>
      <tr>
        <td>蛋鸡配合饲料</td><td><form:input  path="productsAndMeansMarketPrice.means_of_production_danjipeihesiliao"/></td>
        <td colspan="4"></td>
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
          url: "/mobile/productsAndMeansMarketPrice/add",
          data: $('#ProductsAndMeansMarketPriceForm').serialize(),
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
