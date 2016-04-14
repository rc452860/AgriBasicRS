<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-04-03
  Time: 1:26
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
    <li><a href="#">种植业产品生产成本、收益与劳动生产率</a></li>
    <li><a href="#">修改调查信息</a></li>
  </ul>
</div>

<div class="formbody">

  <form:form commandName="CostBenefitProductivityOfPlantForm">
    <form:hidden path="costBenefitProductivityOfPlant.id"/>
    <table class="form-add" cellpadding="0" cellspacing="0">
      <tr>
        <td>调查表编号</td>
        <td><form:input class="easyui-combobox" required="true" data-options="url:'/mobile/registrationForm/selectJsonB',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'" path="costBenefitProductivityOfPlant.registration_form_id"/></td>
      </tr>
      <tr>
        <td>调查县数</td>
        <td><form:input path="costBenefitProductivityOfPlant.county_num"/></td>
      </tr>
      <tr>
        <td>调查户数</td>
        <td><form:input path="costBenefitProductivityOfPlant.family_num"/></td>
      </tr>
      <tr>
        <td>调查面积</td>
        <td><form:input path="costBenefitProductivityOfPlant.area_num"/></td>
      </tr>

      <tr>
        <td colspan="2">一、成本与收益</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="4">每    亩</td>
            </tr>

            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td colspan="4">产量</td>
                  </tr>
                  <tr>
                    <td>主产品</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_main_product_output" /></td>
                    <td>副产品</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_by_product_output" /></td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td colspan="6">产值</td>
                  </tr>
                  <tr>
                    <td>总产值合计</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_total_product_output_value" /></td>
                    <td>主产品产值</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_main_product_output_value" /></td>
                    <td>副产品产值</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_by_product_output_value" /></td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td >总成本</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_total_cost" /></td>
                  </tr>
                  <tr>
                    <td >生产成本合计</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_cost" /></td>
                  </tr>
                  <tr>
                    <td>物质费用</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_material_cost" /></td>
                  </tr>

                  <tr>
                    <td>人工成本</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_cost" /></td>
                  </tr>
                  <tr>
                    <td>家庭用工作价</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_total" /></td>
                    <td>家庭用工数量</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_num" /></td>
                    <td>家庭用工日工价</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_price" /></td>
                  </tr>
                  <tr>
                    <td>雇工费用</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_total" /></td>
                    <td>雇工数量</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_num" /></td>
                    <td>雇工工价</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_price" /></td>
                  </tr>

                  <tr>
                    <td>土地成本</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_land_cost" /></td>
                  </tr>
                  <tr>
                    <td>自营地折租</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_land_self_cost" /></td>
                    <td>流转地租金</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_production_land_other_cost" /></td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td >净产值</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_net_production_value" /></td>
                    <td >纯收益</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_net_income" /></td>
                    <td >成本纯收益率</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_cost_net_income_rate" /></td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td colspan="4">每50公斤主产品</td>
            </tr>
            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td >平均出售价格</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_average_selling_price" /></td>
                  </tr>
                  <tr>
                    <td >总成本</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_total_cost" /></td>
                  </tr>
                  <tr>
                    <td >生产成本</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_production_cost" /></td>
                    <td >物质费用</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_material_cost" /></td>
                  </tr>
                  <tr>
                    <td >净产值</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_net_production_value" /></td>
                    <td >纯收益</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_net_income" /></td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td colspan="4">每一劳动日</td>
            </tr>
            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td >主产品产量</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_perworkday_main_product_output" /></td>
                    <td >净产值</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_perworkday_net_production_value" /></td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td colspan="4">每亩</td>
            </tr>
            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td >主产品出售量</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_main_product_sale_num" /></td>
                    <td >主产品出售价值</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_permu_net_production_sale_value" /></td>
                  </tr>
                </table>
              </td>
            </tr>

            <tr>
              <td colspan="4">附记</td>
            </tr>
            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td >每亩成本外支出</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_note_permu_ext_cost" /></td>
                    <td >每亩补贴收入</td>
                    <td><form:input path="costBenefitProductivityOfPlant.costbenefit_note_permu_subsidy_income" /></td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>

      <tr>
        <td colspan="2">二、每亩物质费用合计</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td colspan="4">每亩物质费用合计</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total"/></td>
                  </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td colspan="6">（一）直接生产费用小计</td>
                  </tr>
                  <tr>
                    <td >直接生产费用小计</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_subtotal"/></td>
                    <td >种籽、种苗费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_seedsseedlings"/></td>
                    <td >农家肥费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_farmmanure"/></td>
                  </tr>
                  <tr>
                    <td >化肥费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_fertilizer"/></td>
                    <td >农膜费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_plasticsheeting"/></td>
                    <td >农药费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_pesticide"/></td>
                  </tr>
                  <tr>
                    <td >畜力费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_animal"/></td>
                    <td >机械作业费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_mechanical"/></td>
                    <td >排灌费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_irrigation"/></td>
                  </tr>
                  <tr>
                    <td >其中：水费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_irrigation_water"/></td>
                    <td >燃料动力费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_fuelpower"/></td>
                    <td >工具材料费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_toolmaterial"/></td>
                  </tr>
                  <tr>
                    <td >技术服务费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_technicalservice"/></td>
                    <td >其他直接生产费用</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_other"/></td>
                  </tr>

                  <tr>
                    <td colspan="6">（二）间接生产费用小计</td>
                  </tr>
                  <tr>
                    <td >间接生产费用小计</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_subtotal"/></td>
                  </tr>
                  <tr>
                    <td >固定资产折旧费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_depreciation"/></td>
                    <td >保险费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_insurance"/></td>
                    <td >管理费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_management"/></td>
                  </tr>
                  <tr>
                    <td >财务费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_finance"/></td>
                    <td >销售费</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_sale"/></td>
                  </tr>

                  <tr>
                    <td colspan="6">附记</td>
                  </tr>
                  <tr>
                    <td >每亩化肥混合施用量</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_material_cost_total_note_mixed_application_rate"/></td>
                  </tr>

                </table>
              </td>
            </tr>
          </table>
        </td>
      </tr>

      <tr>
        <td colspan="2">三、每亩家庭用工合计</td>
      </tr>
      <tr>
        <td colspan="2">
          <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
              <td colspan="2">
                <table class="form-add" cellpadding="0" cellspacing="0">
                  <tr>
                    <td colspan="4">每亩家庭用工合计</td>
                    <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total"/></td>
                  </tr>
                </table>
              </td>
            </tr>
            <td colspan="2">
              <table class="form-add" cellpadding="0" cellspacing="0">
                <tr>
                  <td colspan="6">（一）直接生产用工小计</td>
                </tr>
                <tr>
                  <td >直接用工费用小计</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_subtotal"/></td>
                </tr>
                <tr>
                  <td >播种前翻耕整地用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_beforesowing"/></td>
                  <td >种籽准备与播种用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_preparationsowing"/></td>
                  <td >施肥用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_fertilizer"/></td>
                </tr>
                <tr>
                  <td >排灌用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_irrigation"/></td>
                  <td >田间管理用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_fieldmanagement"/></td>
                  <td >收获用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_harvest"/></td>
                </tr>
                <tr>
                  <td >初制加工用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_primaryprocessing"/></td>
                  <td >其他直接生产用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_other"/></td>
                </tr>

                <tr>
                  <td colspan="6">（二）间接生产用工小计</td>
                </tr>
                <tr>
                  <td >间接生产用工小计</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_subtotal"/></td>
                </tr>
                <tr>
                  <td >初期生产用工分摊</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_initialproduction"/></td>
                  <td >积肥用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_compost"/></td>
                  <td >经营管理用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_managementl"/></td>
                </tr>
                <tr>
                  <td >一事一议酬劳</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_oneone"/></td>
                  <td >其他间接生产用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_other"/></td>
                  <td >销售用工</td>
                  <td ><form:input path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_sale"/></td>
                </tr>
              </table>
            </td>
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
          url: "/mobile/costBenefitProductivityOfPlant/edit",
          data: $('#CostBenefitProductivityOfPlantForm').serialize(),
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
  <%--激活tab面板--%>
  <script type="text/javascript">
    $("#usual1 ul").idTabs();
  </script>
  <%--列表js虽然现在删除了列表--%>
  <script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
  </script>
  <%--选择器js--%>
  <script type="text/javascript">
    function diy_select() {
      this.init.apply(this, arguments)
    }
    ;
    diy_select.prototype = {
      init: function (opt) {
        this.setOpts(opt);
        this.o = this.getByClass(this.opt.TTContainer, document, 'div');//容器
        this.b = this.getByClass(this.opt.TTDiy_select_btn);//按钮
        this.t = this.getByClass(this.opt.TTDiy_select_txt);//显示
        this.l = this.getByClass(this.opt.TTDiv_select_list);//列表容器
        this.ipt = this.getByClass(this.opt.TTDiy_select_input);//列表容器
        this.lengths = this.o.length;
        this.showSelect();
      },
      addClass: function (o, s)//添加class
      {
        o.className = o.className ? o.className + ' ' + s : s;
      },
      removeClass: function (o, st)//删除class
      {
        var reg = new RegExp('\\b' + st + '\\b');
        o.className = o.className ? o.className.replace(reg, '') : '';
      },
      addEvent: function (o, t, fn)//注册事件
      {
        return o.addEventListener ? o.addEventListener(t, fn, false) : o.attachEvent('on' + t, fn);
      },
      showSelect: function ()//显示下拉框列表
      {
        var This = this;
        var iNow = 0;
        for (var i = 0; i < this.lengths; i++) {
          var item = This.l[i].getElementsByTagName('li');
          for (var j = 0; j < item.length; j++) {
            /*console.log(item[j].getAttribute('select'))
             if (item[j].getAttribute('select') != null && This.ipt[i].value !=null) {
             This.t[i].innerHTML = item[j].innerHTML;
             This.ipt[i].value = item[j].getAttribute('value');
             }*/
            if(This.ipt[i].value == item[j].getAttribute('value')){
              This.t[i].innerHTML = item[j].innerHTML;
            }
          }
        }
        this.addEvent(document, 'click', function () {
          for (var i = 0; i < This.lengths; i++) {
            This.l[i].style.display = 'none';
          }
        })
        for (var i = 0; i < this.lengths; i++) {
          this.l[i].index = this.b[i].index = this.t[i].index = i;
          this.t[i].onclick = this.b[i].onclick = function (ev) {
            var e = window.event || ev;
            var index = this.index;
            This.item = This.l[index].getElementsByTagName('li');

            This.l[index].style.display = This.l[index].style.display == 'block' ? 'none' : 'block';
            This.o[index].style.zIndex = '999'

            for (var j = 0; j < This.lengths; j++) {
              if (j != index) {
                This.l[j].style.display = 'none';


                This.o[j].style.zIndex = '1'
              }
            }
            This.addClick(This.item);
            e.stopPropagation ? e.stopPropagation() : (e.cancelBubble = true); //阻止冒泡
          }
        }
      }
      ,
      addClick: function (o)//点击回调函数
      {

        if (o.length > 0) {
          var This = this;
          for (var i = 0; i < o.length; i++) {
            o[i].onmouseover = function () {
              This.addClass(this, This.opt.TTFcous);
            }
            o[i].onmouseout = function () {
              This.removeClass(this, This.opt.TTFcous);
            }
            o[i].onclick = function () {
              var index = this.parentNode.index;//获得列表
              //This.t[index].innerHTML = This.ipt[index].value = this.innerHTML.replace(/^\s+/, '').replace(/\s+&/, '');
              This.t[index].innerHTML = this.innerHTML.replace(/^\s+/, '').replace(/\s+&/, '');
              This.ipt[index].value = this.getAttribute('value');
              This.l[index].style.display = 'none';
            }
          }
        }
      }
      ,
      getByClass: function (s, p, t)//使用class获取元素
      {
        var reg = new RegExp('\\b' + s + '\\b');
        var aResult = [];
        var aElement = (p || document).getElementsByTagName(t || '*');

        for (var i = 0; i < aElement.length; i++) {
          if (reg.test(aElement[i].className)) {
            aResult.push(aElement[i])
          }
        }
        return aResult;
      }
      ,

      setOpts: function (opt) //以下参数可以不设置  //设置参数
      {
        this.opt = {
          TTContainer: 'diy_select',//控件的class
          TTDiy_select_input: 'diy_select_input',//用于提交表单的class
          TTDiy_select_txt: 'diy_select_txt',//diy_select用于显示当前选中内容的容器class
          TTDiy_select_btn: 'diy_select_btn',//diy_select的打开按钮
          TTDiv_select_list: 'diy_select_list',//要显示的下拉框内容列表class
          TTFcous: 'focus'//得到焦点时的class
        }
        for (var a in opt)  //赋值 ,请保持正确,没有准确判断的
        {
          this.opt[a] = opt[a] ? opt[a] : this.opt[a];
        }
      }
    }


    var TTDiy_select = new diy_select({  //参数可选
      TTContainer: 'diy_select',//控件的class
      TTDiy_select_input: 'diy_select_input',//用于提交表单的class
      TTDiy_select_txt: 'diy_select_txt',//diy_select用于显示当前选中内容的容器class
      TTDiy_select_btn: 'diy_select_btn',//diy_select的打开按钮
      TTDiv_select_list: 'diy_select_list',//要显示的下拉框内容列表class
      TTFcous: 'focus'//得到焦点时的class
    });//如同时使用多个时请保持各class一致.
  </script>
</div>
</body>
</html>
