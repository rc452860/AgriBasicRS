<%--
  Created by IntelliJ IDEA.
  User: rc452
  Date: 2016/3/31
  Time: 17:00
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
                    total += parseFloat($("[id='" + this.field[i] + "']").numberbox("getValue"));
                }
                return total;
            }
            var calcarr = [
                new calc(
                        'food_grain_daogu',[
                            'food_grain_daogu_zaodao',
                            'food_grain_daogu_zhongdao',
                            'food_grain_daogu_wandao'
                        ]
                ),
                new calc('food_grain', ["food_grain_daogu",
                    "food_grain_xiaomai",
                    "food_grain_yumi",
                    "food_grain_guzi",
                    "food_grain_gaoliang",
                    "food_grain_other"]
                ),
                new calc(
                        'sugar_total',
                        [
                            'sugar_ganzhe',
                            'sugar_tiancai'
                        ]
                ),
                new calc(
                        'food_total',
                        [
                            'food_grain',
                            'food_legume',
                            'food_potato',
                            'food_summerl'
                        ]
                ),
                new calc(
                        'plant_total',
                        [
                            'food_grain',
                            'oilplant_total',
                            'cotton_total',
                            'rawjute_total',
                            'sugar_total',
                            'tobacco_total',
                            'vegetables_total',
                            'fruit_total',
                            'otherplant_total',
                        ]
                )

            ]
            for (var i = 0; i < calcarr.length; i++) {
                $("[id='" + calcarr[i].name+"']").numberbox("disable");
            }
            $("#WholeYearPlantAreaForm input").blur(function () {
                for (var i = 0; i < calcarr.length; i++) {
                    $("[id='" + calcarr[i].name+"']").numberbox("setValue", calcarr[i].func());
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
        <li><a href="#">全年农作物播种面积意向（预计）调查修改</a></li>
    </ul>
</div>

<div class="formbody">

    <form:form commandName="WholeYearPlantAreaForm">
        <form:hidden path="id"/>
        <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
                <td>调查表编号</td>
                <td><form:input class="easyui-combobox" required="true" data-options="url:'/mobile/registrationForm/selectJsonB',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'" path="registration_form_id"/></td>
                <td>农户</td>
                <td><form:input path="farmer_id"/></td>
            </tr>
            <tr>
                <td>调查形式</td>
                <td colspan="3">
                    <form:select path="form_tag" cssClass="easyui-combobox" cssStyle="width: 150px;height: 24px;">
                        <form:option value="0">意向调查</form:option>
                        <form:option value="1">预计调查</form:option>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>夏粮</td>
                <td><form:input path="food_summerl" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>稻谷</td>
                <td><form:input path="food_grain_daogu" class="easyui-numberbox" data-options="precision:2"/></td>

            </tr>
            <tr>
                <td>早稻</td>
                <td><form:input path="food_grain_daogu_zaodao" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td>中稻</td>
                <td><form:input path="food_grain_daogu_zhongdao" class="easyui-numberbox"
                                data-options="precision:2"/></td>

            </tr>
            <tr>
                <td>双季晚稻</td>
                <td><form:input path="food_grain_daogu_wandao" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td>小麦</td>
                <td><form:input path="food_grain_xiaomai" class="easyui-numberbox" data-options="precision:2"/></td>

            </tr>
            <tr>
                <td>玉米</td>
                <td><form:input path="food_grain_yumi" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>谷子</td>
                <td><form:input path="food_grain_guzi" class="easyui-numberbox" data-options="precision:2"/></td>

            </tr>
            <tr>
                <td>高粱</td>
                <td><form:input path="food_grain_gaoliang" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>其他</td>
                <td><form:input path="food_grain_other" class="easyui-numberbox" data-options="precision:2"/></td>

            </tr>
            <tr>
                <td>谷物合计</td>
                <td colspan="3"><form:input path="food_grain" class="easyui-numberbox" data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>大豆</td>
                <td><form:input path="food_legume_dadou" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>豆类合计</td>
                <td><form:input path="food_legume" validType="gte['food_legume_dadou']" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>马铃薯</td>
                <td><form:input path="food_potato_malingshu" class="easyui-numberbox" validType="gte['food_potato']"
                                data-options="precision:2"/></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>薯类合计</td>
                <td colspan="3"><form:input path="food_potato" class="easyui-numberbox"
                                            data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>花生</td>
                <td><form:input path="oilplant_huasheng" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>油菜籽</td>
                <td><form:input path="oilplant_youcaizi" class="easyui-numberbox" data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>芝麻</td>
                <td><form:input path="oilplant_zhima" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>油料作物合计</td>
                <td><form:input path="oilplant_total" class="easyui-numberbox"
                                validType="gte['oilplant_huasheng','oilplant_youcaizi','oilplant_zhima']"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>棉花</td>
                <td><form:input path="cotton_total" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>生麻</td>
                <td><form:input path="rawjute_total" class="easyui-numberbox" data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>生黄红麻</td>
                <td><form:input path="rawjute_hongma" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>甘蔗</td>
                <td><form:input path="sugar_ganzhe" class="easyui-numberbox" data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>糖类合计</td>
                <td><form:input path="sugar_total" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>甜菜</td>
                <td><form:input path="sugar_tiancai" class="easyui-numberbox" data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>烟叶</td>
                <td><form:input path="tobacco_total" validType="gte['tobacco_kaoyan']" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td>烤烟</td>
                <td><form:input path="tobacco_kaoyan" class="easyui-numberbox" data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>蔬菜</td>
                <td><form:input path="vegetables_total" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>瓜果</td>
                <td><form:input path="fruit_total" class="easyui-numberbox" data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>其他作物</td>
                <td><form:input path="otherplant_total" validType="gte['otherplant_qingsiliaol']"
                                class="easyui-numberbox" data-options="precision:2"/></td>
                <td>青饲料</td>
                <td colspan="3"><form:input path="otherplant_qingsiliaol" class="easyui-numberbox"
                                            data-options="precision:2"/></td>
            </tr>
            <tr>
                <td>粮食合计</td>
                <td><form:input path="food_total" class="easyui-numberbox" data-options="precision:2"/></td>
                <td>农作物总面积</td>
                <td><form:input path="plant_total" class="easyui-numberbox" data-options="precision:2"/></td>
            </tr>
            <tr>
                <td align="center" colspan="4"><input name="" type="button" id="submit_button"
                                                      value="提交"/>&nbsp;&nbsp;<input name="" type="reset" value="重置"/>
                </td>
            </tr>
        </table>
    </form:form>

    <%--此乃提交代码--%>
    <script type="text/javascript">
        $(function () {
            $('#submit_button').click(function () {
                if ($("#WholeYearPlantAreaForm").form("validate")) {
                    $.ajax({
                        cache: false,
                        type: "POST",
                        url: "/mobile/WholeYearPlantArea/edit",
                        data: $('#WholeYearPlantAreaForm').serialize(),
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
