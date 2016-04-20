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
<script type="text/javascript">
    /*计算代码*/
    $(function () {
        function calc(name, field, func) {
            this.name = name;
            this.field = field;
            if (typeof func == 'function')
                this.func = func;
        }

        calc.prototype.func = function () {
            var total = 0;
            for (var i = 0; i < this.field.length; i++) {
                total +=this.getFValue(i);
            }
            return total;
        }
        calc.prototype.getFValue = function(key){


                return parseFloat($("[id='" + this.field[key] + "']").numberbox("getValue"));
        }
        var calcarr = [
            new calc(
                    'costBenefitOfPig.costbenefit_perhead_main_product_output_value', [
                        'costBenefitOfPig.costbenefit_perhead_main_product_output',
                        'costBenefitOfPig.costbenefit_percentummainproduct_average_sale_price'
                    ],
                    function(){
                        var result = this.getFValue(0)*this.getFValue(1)/100;
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_perhead_total_product_output_value', [
                        'costBenefitOfPig.costbenefit_perhead_main_product_output_value',
                        'costBenefitOfPig.costbenefit_perhead_by_product_output_value'
                    ]
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_perhead_material_cost', [
                        'costBenefitOfPig.head_num',
                        'costBenefitOfPig.material_cost_total'
                    ],
                    function(){
                        var result = 0;
                        if(this.getFValue(0)!=0){
                            result = this.getFValue(1)/this.getFValue(0)
                        }
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_perhead_employee_total', [
                        'costBenefitOfPig.costbenefit_perhead_employee_num',
                        'costBenefitOfPig.costbenefit_perhead_employee_price'
                    ],
                    function(){
                        var result = 0;
                        result = this.getFValue(1)*this.getFValue(0)
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_perhead_production_cost', [
                        'costBenefitOfPig.costbenefit_perhead_material_cost',
                        'costBenefitOfPig.costbenefit_perhead_employee_total'
                    ],
                    function(){
                        var result = 0;
                        result = this.getFValue(1)+this.getFValue(0)
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_perhead_net_production_value', [
                        'costBenefitOfPig.costbenefit_perhead_total_product_output_value',
                        'costBenefitOfPig.costbenefit_perhead_material_cost'
                    ],
                    function(){
                        var result = 0;
                            result = this.getFValue(0)-this.getFValue(1)
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_perhead_net_income_without_tax', [
                        'costBenefitOfPig.costbenefit_perhead_total_product_output_value',
                        'costBenefitOfPig.costbenefit_perhead_production_cost',
                        'costBenefitOfPig.costbenefit_perhead_tax'
                    ],
                    function(){
                        var result = 0;
                        result = this.getFValue(0)-this.getFValue(1)-this.getFValue(2);
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_perhead_net_income', [
                        'costBenefitOfPig.costbenefit_perhead_net_income_without_tax',
                        'costBenefitOfPig.costbenefit_perhead_production_cost'
                    ],
                    function(){
                        var result = 0;
                        if(this.getFValue(1)!=0)
                                result = this.getFValue(0)/this.getFValue(1)*100;
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_perhead_fine_feed_grain', [
                        'costBenefitOfPig.note_concentrated_feed_grain',
                        'costBenefitOfPig.head_num'
                    ],
                    function(){
                        var result = 0;
                        if(this.getFValue(1)!=0)
                            result = this.getFValue(0)/this.getFValue(1);
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_percentumoutput_material_cost', [
                        'costBenefitOfPig.costbenefit_perhead_material_cost',
                        'costBenefitOfPig.costbenefit_perhead_total_product_output_value'
                    ],
                    function(){
                        var result = 0;
                        if(this.getFValue(1)!=0)
                            result = this.getFValue(0)/this.getFValue(1)*100;
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_percentumoutput_production_cost', [
                        'costBenefitOfPig.costbenefit_perhead_production_cost',
                        'costBenefitOfPig.costbenefit_perhead_total_product_output_value'
                    ],
                    function(){
                        var result = 0;
                        if(this.getFValue(1)!=0)
                            result = this.getFValue(0)/this.getFValue(1)*100;
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_percentummainproduct_production_cost', [
                        'costBenefitOfPig.costbenefit_perhead_production_cost',
                        'costBenefitOfPig.costbenefit_perhead_main_product_output'
                    ],
                    function(){
                        var result = 0;
                        if(this.getFValue(1)!=0)
                            result = this.getFValue(0)/this.getFValue(1)*100;
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_percentummainproduct_production_cost_with_tax', [
                        'costBenefitOfPig.costbenefit_perhead_tax',
                        'costBenefitOfPig.costbenefit_perhead_main_product_output',
                        'costBenefitOfPig.costbenefit_percentummainproduct_production_cost'
                    ],
                    function(){
                        var result = 0;
                        if(this.getFValue(1)!=0)
                            result = this.getFValue(0)/this.getFValue(1)*100+this.getFValue(2);
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_percentummainproduct_consumption_grain', [
                        'costBenefitOfPig.costbenefit_perhead_fine_feed_grain',
                        'costBenefitOfPig.costbenefit_perhead_main_product_output'
                    ],
                    function(){
                        var result = 0;
                        if(this.getFValue(1)!=0)
                            result = this.getFValue(0)/this.getFValue(1)*100;
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_perworkday_main_product_output', [
                        'costBenefitOfPig.costbenefit_perhead_main_product_output',
                        'costBenefitOfPig.costbenefit_perhead_employee_num'
                    ],
                    function(){
                        var result = 0;
                        if(this.getFValue(1)!=0)
                            result = this.getFValue(0)/this.getFValue(1);
                        return result;
                    }
            ),
            new calc(
                    'costBenefitOfPig.costbenefit_perworkday_net_production_value', [
                        'costBenefitOfPig.costbenefit_perhead_net_production_value',
                        'costBenefitOfPig.costbenefit_perhead_employee_num'
                    ],
                    function(){
                        var result = 0;
                        if(this.getFValue(1)!=0)
                            result = this.getFValue(0)/this.getFValue(1);
                        return result;
                    }
            ),
        ]
        for (var i = 0; i < calcarr.length; i++) {
            $("[id='" + calcarr[i].name + "']").numberbox("disable");
        }
        $("#CostBenefitOfPigForm input").blur(function () {
            for (var i = 0; i < calcarr.length; i++) {
                $("[id='" + calcarr[i].name + "']").numberbox("setValue", calcarr[i].func());
            }

        })
    })
</script>
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
    <form:form commandName="CostBenefitOfPigForm">
        <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
                <td>调查表编号</td>
                <td><form:input class="easyui-combobox" required="true" data-options="url:'/mobile/registrationForm/selectJsonB/costBenefitOfPig',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'" path="costBenefitOfPig.registration_form_id"/></td>
            </tr>
            <tr>
                <td>调查县数</td>
                <td><form:input path="costBenefitOfPig.county_num" class="easyui-numberbox"
                                data-options="precision:0"/></td>
            </tr>
            <tr>
                <td>调查户数</td>
                <td><form:input path="costBenefitOfPig.family_num" class="easyui-numberbox"
                                data-options="precision:0"/></td>
            </tr>
            <tr>
                <td>调查头数</td>
                <td><form:input path="costBenefitOfPig.head_num" class="easyui-numberbox"
                                data-options="precision:0"/></td>
            </tr>
            <tr>
                <td>平均饲养时间</td>
                <td><form:input path="costBenefitOfPig.average_feeding_time" class="easyui-numberbox"
                                data-options="precision:0"/></td>
            </tr>

            <tr>
                <td colspan="2">一、成本与收益</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table class="form-add" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="4">每 头</td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <table class="form-add" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="4">产量</td>
                                    </tr>
                                    <tr>
                                        <td>主产品</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_main_product_output"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>副产品</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_by_product_output"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
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
                                        <td>合计</td>
                                        <td><form:input
                                                path="costBenefitOfPig.costbenefit_perhead_total_product_output_value"
                                                class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>主产品</td>
                                        <td><form:input
                                                path="costBenefitOfPig.costbenefit_perhead_main_product_output_value"
                                                class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>副产品</td>
                                        <td><form:input
                                                path="costBenefitOfPig.costbenefit_perhead_by_product_output_value"
                                                class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <table class="form-add" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>物质费用</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_material_cost"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>用工作价</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_employee_total"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>标准用工量</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_employee_num"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>劳动日工价</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_employee_price"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>总生产成本</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_production_cost"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>税金</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_tax"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>净产值</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_net_production_value"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>减税纯收益</td>
                                        <td><form:input
                                                path="costBenefitOfPig.costbenefit_perhead_net_income_without_tax"
                                                class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>成本纯收益率</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_net_income"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>精饲料折粮</td>
                                        <td><form:input path="costBenefitOfPig.costbenefit_perhead_fine_feed_grain"
                                                        class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>


                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <table class="form-add" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="4">每百元产值</td>
                        </tr>
                        <tr>
                            <td>物质费用</td>
                            <td><form:input path="costBenefitOfPig.costbenefit_percentumoutput_material_cost"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>生产成本</td>
                            <td><form:input path="costBenefitOfPig.costbenefit_percentumoutput_production_cost"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <table class="form-add" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="4">每百斤主产品</td>
                        </tr>
                        <tr>
                            <td>生产成本</td>
                            <td><form:input path="costBenefitOfPig.costbenefit_percentummainproduct_production_cost"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>含税生产成本</td>
                            <td><form:input
                                    path="costBenefitOfPig.costbenefit_percentummainproduct_production_cost_with_tax"
                                    class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>平均出售价格</td>
                            <td><form:input path="costBenefitOfPig.costbenefit_percentummainproduct_average_sale_price"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>耗粮数量</td>
                            <td><form:input path="costBenefitOfPig.costbenefit_percentummainproduct_consumption_grain"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <table class="form-add" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="4">每一劳动日</td>
                        </tr>
                        <tr>
                            <td>主产品产量</td>
                            <td><form:input path="costBenefitOfPig.costbenefit_perworkday_main_product_output"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>净产值</td>
                            <td><form:input path="costBenefitOfPig.costbenefit_perworkday_net_production_value"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <table class="form-add" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="4">附报</td>
                        </tr>
                        <tr>
                            <td>每头成本外支出</td>
                            <td><form:input path="costBenefitOfPig.costbenefit_note_perhead_ext_cost"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="2">二、物质费用</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table class="form-add" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>物质费用总计</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total" class="easyui-numberbox"
                                            data-options="precision:2"/></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <table class="form-add" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="6">直接生产费用</td>
                        </tr>
                        <tr>
                            <td>直接生产费用</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_direct_cost"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>仔猪进价</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_direct_pigletsprice"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>精饲料费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_direct_concentratedfeed"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>青粗饲料费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_direct_coarsefeed"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>饲料加工费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_direct_feedprocessing"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>燃料动力费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_direct_fuelpower"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>医疗防疫费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_direct_medical"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>死亡损失费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_direct_death"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>工具材料费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_direct_toolmaterial"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>其它直接费用</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_direct_other"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>

                        <tr>
                            <td colspan="6">间接生产费用</td>
                        </tr>
                        <tr>
                            <td>间接生产费用</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_indirect_cost"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>固定资产折旧费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_indirect_cost_depreciation"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>销售费用</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_indirect_cost_sale"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>修理费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_indirect_cost_fix"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>管理费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_indirect_cost_management"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>其它间接生产费</td>
                            <td><form:input path="costBenefitOfPig.material_cost_total_indirect_cost_other"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <table class="form-add" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="6">附报</td>
                        </tr>
                        <tr>
                            <td>仔猪重量</td>
                            <td><form:input path="costBenefitOfPig.note_piglet_weight" class="easyui-numberbox"
                                            data-options="precision:2"/></td>
                            <td>精饲料用量</td>
                            <td><form:input path="costBenefitOfPig.note_concentrated_feed_num" class="easyui-numberbox"
                                            data-options="precision:2"/></td>
                            <td>精饲料折粮</td>
                            <td><form:input path="costBenefitOfPig.note_concentrated_feed_grain"
                                            class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>每头成本外支出</td>
                            <td><form:input path="costBenefitOfPig.note_perhead_ext_cost" class="easyui-numberbox"
                                            data-options="precision:2"/></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td align="center" colspan="4"><input name="" type="button" id="submit_button"
                                                      value="提交"/>&nbsp;&nbsp;<input name="" type="reset" value="重置"/>
                </td>
            </tr>
        </table>
    </form:form>

    <%--此乃登陆代码--%>
    <script type="text/javascript">
        $(function () {
            $('#submit_button').click(function () {
                if($('#CostBenefitOfPigForm').form("validate")){
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
                            if (data.message != null) alert(data.message);
                            if (data.url != null) window.location.href = data.url;
                        }
                    });
                }
            });
        });
    </script>
</div>
</body>
</html>
