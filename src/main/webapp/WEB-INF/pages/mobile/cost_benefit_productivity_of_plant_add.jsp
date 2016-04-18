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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <c:import url="references.jsp"></c:import>
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
                        'costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_average_selling_price', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_net_production_sale_value',
                            'costBenefitProductivityOfPlant.costbenefit_permu_main_product_sale_num'
                        ],
                        function(){
                            var result = 0;
                            if(this.getFValue(1)!=0)
                                result =  this.getFValue(0)/this.getFValue(1)*50;
                            return result;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_main_product_output_value', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_main_product_output',
                            'costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_average_selling_price'
                        ],
                        function(){
                            return this.getFValue(0)*this.getFValue(1)/50;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_total_product_output_value', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_main_product_output_value',
                            'costBenefitProductivityOfPlant.costbenefit_permu_by_product_output_value'
                        ]
                ),//新一轮计算

                new calc(
                        'costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_subtotal', [
                            'costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_beforesowing',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_preparationsowing',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_fertilizer',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_irrigation',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_fieldmanagement',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_harvest',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_primaryprocessing',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_other',
                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_subtotal', [
                            'costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_initialproduction',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_compost',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_managementl',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_oneone',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_other',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_sale'
                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.permu_family_cost_total', [
                            'costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_subtotal',
                            'costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_subtotal',

                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_num', [
                            'costBenefitProductivityOfPlant.permu_family_cost_total',
                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_total', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_num',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_price',
                        ],
                        function(){
                            return this.getFValue(0)*this.getFValue(1);
                        }
                ),

                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_total', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_num',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_price',
                        ],function(){
                            return this.getFValue(0)*this.getFValue(1);
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_production_person_cost', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_total',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_total',
                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_subtotal', [
                            'costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_depreciation',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_insurance',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_management',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_finance',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_sale',
                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_subtotal', [
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_seedsseedlings',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_farmmanure',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_fertilizer',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_plasticsheeting',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_pesticide',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_animal',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_mechanical',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_irrigation',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_fuelpower',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_toolmaterial',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_technicalservice',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_other'

                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.permu_material_cost_total', [
                            'costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_subtotal',
                            'costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_subtotal'
                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_production_material_cost', [
                            'costBenefitProductivityOfPlant.permu_material_cost_total'
                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_production_cost', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_material_cost',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_cost'
                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_production_land_cost', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_land_self_cost',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_land_other_cost'
                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_total_cost', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_cost',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_land_cost'
                        ]
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_net_production_value', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_total_product_output_value',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_material_cost'
                        ],function(){
                            return this.getFValue(0)-this.getFValue(1);
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_average_selling_price', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_main_product_sale_num',
                            'costBenefitProductivityOfPlant.costbenefit_permu_net_production_sale_value'
                        ],function(){
                                return  this.getFValue(0)*this.getFValue(1)*50;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_total_cost', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_total_cost',
                            'costBenefitProductivityOfPlant.costbenefit_permu_main_product_output'
                        ],function(){
                            var result = 0;
                            if(this.getFValue(1)!=0)
                                result =  this.getFValue(0)/this.getFValue(1)*50;
                            return result;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_production_cost', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_cost',
                            'costBenefitProductivityOfPlant.costbenefit_permu_main_product_output'
                        ],function(){
                            var result = 0;
                            if(this.getFValue(1)!=0)
                                result =  this.getFValue(0)/this.getFValue(1)*50;
                            return result;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_material_cost', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_material_cost',
                            'costBenefitProductivityOfPlant.costbenefit_permu_main_product_output'
                        ],function(){
                            var result = 0;
                            if(this.getFValue(1)!=0)
                                result =  this.getFValue(0)/this.getFValue(1)*50;
                            return result;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_net_production_value', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_net_production_value',
                            'costBenefitProductivityOfPlant.costbenefit_permu_main_product_output'
                        ],function(){
                            var result = 0;
                            if(this.getFValue(1)!=0)
                                result =  this.getFValue(0)/this.getFValue(1)*50;
                            return result;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_net_income', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_total_product_output_value',
                            'costBenefitProductivityOfPlant.costbenefit_permu_total_cost'
                        ],function(){
                            var result = 0;
                            if(this.getFValue(1)!=0)
                                result =  this.getFValue(0)-this.getFValue(1);
                            return result;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_permu_cost_net_income_rate', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_net_income',
                            'costBenefitProductivityOfPlant.costbenefit_permu_total_cost'
                        ],function(){
                            var result = 0;
                            if(this.getFValue(1)!=0)
                                result =  this.getFValue(0)/this.getFValue(1)*100;
                            return result;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_net_income', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_net_income',
                            'costBenefitProductivityOfPlant.costbenefit_permu_main_product_output'
                        ],function(){
                            var result = 0;
                            if(this.getFValue(1)!=0)
                                result =  this.getFValue(0)/this.getFValue(1)*50;
                            return result;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_perworkday_main_product_output', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_main_product_output',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_num',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_num'
                        ],function(){
                            var result = 0;
                            if((this.getFValue(1)+this.getFValue(2))!=0)
                                result =  this.getFValue(0)/(this.getFValue(1)+this.getFValue(2));
                            return result;
                        }
                ),
                new calc(
                        'costBenefitProductivityOfPlant.costbenefit_perworkday_net_production_value', [
                            'costBenefitProductivityOfPlant.costbenefit_permu_net_production_value',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_num',
                            'costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_num'
                        ],function(){
                            var result = 0;
                            if((this.getFValue(1)+this.getFValue(2))!=0)
                                result =  this.getFValue(0)/(this.getFValue(1)+this.getFValue(2));
                            return result;
                        }
                ),


            ]
            for (var i = 0; i < calcarr.length; i++) {
                $("[id='" + calcarr[i].name + "']").numberbox("disable");
            }
            $("#CostBenefitProductivityOfPlantForm input").blur(function () {
                for (var i = 0; i < calcarr.length; i++) {
                    $("[id='" + calcarr[i].name + "']").numberbox("setValue", calcarr[i].func());
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
        <li><a href="#">种植业产品生产成本、收益与劳动生产率</a></li>
        <li><a href="#">新增调查信息</a></li>
    </ul>
</div>

<div class="formbody">
    <form:form commandName="CostBenefitProductivityOfPlantForm">
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
                <td><form:input path="costBenefitProductivityOfPlant.county_num" class="easyui-numberbox" data-options="precision:0"/></td>
            </tr>
            <tr>
                <td>调查户数</td>
                <td><form:input path="costBenefitProductivityOfPlant.family_num" class="easyui-numberbox" data-options="precision:0"/></td>
            </tr>
            <tr>
                <td>调查面积</td>
                <td><form:input path="costBenefitProductivityOfPlant.area_num" class="easyui-numberbox" data-options="precision:2"/></td>
            </tr>

            <tr>
                <td colspan="2">一、成本与收益</td>
            </tr>
            <tr>
                <td colspan="2">
                    <table class="form-add" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="4">每 亩</td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <table class="form-add" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td colspan="4">产量</td>
                                    </tr>
                                    <tr>
                                        <td>主产品</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_main_product_output" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>副产品</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_by_product_output" class="easyui-numberbox" data-options="precision:2"/></td>
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
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_total_product_output_value" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>主产品产值</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_main_product_output_value" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>副产品产值</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_by_product_output_value" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <table class="form-add" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>总成本</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_total_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>生产成本合计</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>物质费用</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_material_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>

                                    <tr>
                                        <td>人工成本</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>家庭用工作价</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_total" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>家庭用工数量</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_num" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>家庭用工日工价</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_family_price" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>雇工费用</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_total" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>雇工数量</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_num" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>雇工工价</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_person_employee_price" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>

                                    <tr>
                                        <td>土地成本</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_land_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>自营地折租</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_land_self_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>流转地租金</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_production_land_other_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <table class="form-add" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>净产值</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_net_production_value" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>纯收益</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_net_income" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>成本纯收益率</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_cost_net_income_rate" class="easyui-numberbox" data-options="precision:2"/></td>
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
                                        <td>平均出售价格</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_average_selling_price" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>总成本</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_total_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>生产成本</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_production_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>物质费用</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_material_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>净产值</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_net_production_value" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>纯收益</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_perfiftykgmainproducts_net_income" class="easyui-numberbox" data-options="precision:2"/></td>
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
                                        <td>主产品产量</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_perworkday_main_product_output" class="easyui-numberbox" data-options="precision:1"/></td>
                                        <td>净产值</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_perworkday_net_production_value" class="easyui-numberbox" data-options="precision:2"/></td>
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
                                        <td>主产品出售量</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_main_product_sale_num" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>主产品出售价值</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_permu_net_production_sale_value" class="easyui-numberbox" data-options="precision:2"/></td>
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
                                        <td>每亩成本外支出</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_note_permu_ext_cost" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>每亩补贴收入</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.costbenefit_note_permu_subsidy_income" class="easyui-numberbox" data-options="precision:2"/></td>
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
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total" class="easyui-numberbox" data-options="precision:2"/></td>
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
                                        <td>直接生产费用小计</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_subtotal" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>种籽、种苗费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_seedsseedlings" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>农家肥费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_farmmanure" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>化肥费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_fertilizer" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>农膜费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_plasticsheeting" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>农药费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_pesticide" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>畜力费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_animal" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>机械作业费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_mechanical" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>排灌费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_irrigation" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>其中：水费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_irrigation_water" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>燃料动力费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_fuelpower" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>工具材料费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_toolmaterial" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>技术服务费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_technicalservice" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>其他直接生产费用</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_direct_cost_other" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>

                                    <tr>
                                        <td colspan="6">（二）间接生产费用小计</td>
                                    </tr>
                                    <tr>
                                        <td>间接生产费用小计</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_subtotal" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>固定资产折旧费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_depreciation" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>保险费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_insurance" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>管理费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_management" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>
                                    <tr>
                                        <td>财务费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_finance" class="easyui-numberbox" data-options="precision:2"/></td>
                                        <td>销售费</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_indirect_cost_sale" class="easyui-numberbox" data-options="precision:2"/></td>
                                    </tr>

                                    <tr>
                                        <td colspan="6">附记</td>
                                    </tr>
                                    <tr>
                                        <td>每亩化肥混合施用量</td>
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_material_cost_total_note_mixed_application_rate" class="easyui-numberbox" data-options="precision:2"/></td>
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
                                        <td><form:input
                                                path="costBenefitProductivityOfPlant.permu_family_cost_total" class="easyui-numberbox" data-options="precision:2"/></td>
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
                                    <td>直接用工费用小计</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_subtotal" class="easyui-numberbox" data-options="precision:2"/></td>
                                </tr>
                                <tr>
                                    <td>播种前翻耕整地用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_beforesowing" class="easyui-numberbox" data-options="precision:2"/></td>
                                    <td>种籽准备与播种用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_preparationsowing" class="easyui-numberbox" data-options="precision:2"/></td>
                                    <td>施肥用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_fertilizer" class="easyui-numberbox" data-options="precision:2"/></td>
                                </tr>
                                <tr>
                                    <td>排灌用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_irrigation" class="easyui-numberbox" data-options="precision:2"/></td>
                                    <td>田间管理用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_fieldmanagement" class="easyui-numberbox" data-options="precision:2"/></td>
                                    <td>收获用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_harvest" class="easyui-numberbox" data-options="precision:2"/></td>
                                </tr>
                                <tr>
                                    <td>初制加工用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_primaryprocessing" class="easyui-numberbox" data-options="precision:2"/></td>
                                    <td>其他直接生产用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_direct_employ_other" class="easyui-numberbox" data-options="precision:2"/></td>
                                </tr>

                                <tr>
                                    <td colspan="6">（二）间接生产用工小计</td>
                                </tr>
                                <tr>
                                    <td>间接生产用工小计</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_subtotal" class="easyui-numberbox" data-options="precision:2"/></td>
                                </tr>
                                <tr>
                                    <td>初期生产用工分摊</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_initialproduction" class="easyui-numberbox" data-options="precision:2"/></td>
                                    <td>积肥用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_compost" class="easyui-numberbox" data-options="precision:2"/></td>
                                    <td>经营管理用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_managementl" class="easyui-numberbox" data-options="precision:2"/></td>
                                </tr>
                                <tr>
                                    <td>一事一议酬劳</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_oneone" class="easyui-numberbox" data-options="precision:2"/></td>
                                    <td>其他间接生产用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_other" class="easyui-numberbox" data-options="precision:2"/></td>
                                    <td>销售用工</td>
                                    <td><form:input
                                            path="costBenefitProductivityOfPlant.permu_family_cost_total_indirect_employ_sale" class="easyui-numberbox" data-options="precision:2"/></td>
                                </tr>
                            </table>
                        </td>
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
                if($('#CostBenefitProductivityOfPlantForm').form("validate")){
                    $.ajax({
                        cache: false,
                        type: "POST",
                        url: "/mobile/costBenefitProductivityOfPlant/add",
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
                }
            });
        });
    </script>
</div>
</body>
</html>
