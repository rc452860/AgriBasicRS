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
            var temp = [
                new calc(//夏良
                        'food_item.seededarea_Increasedecrease_absolute',[
                            'food_item.seededarea_thisyear',
                            'food_item.seededarea_lastyear',
                        ],function(){
                            var result;
                            result = parseFloat($("[id='" + this.field[0] + "']").numberbox("getValue"))
                                    - parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"));
                            return result;
                        }
                ),
                new calc(
                        'food_item.seededarea_Increasedecrease_relative',[
                            'food_item.seededarea_Increasedecrease_absolute',
                            'food_item.seededarea_lastyear',
                        ],function(){
                            var result = 0;
                            if(parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"))!=0){
                                result = parseFloat($("[id='" + this.field[0] + "']").numberbox("getValue"))
                                        / parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"));
                            }
                            return result;
                        }
                ),
                new calc(
                        'food_item.total_Increasedecrease_absolute',[
                            'food_item.total_thisyear',
                            'food_item.total_lastyear',
                        ],function(){
                            var result;
                            result = parseFloat($("[id='" + this.field[0] + "']").numberbox("getValue"))
                                    - parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"));
                            return result;
                        }
                ),
                new calc(
                        'food_item.total_Increasedecrease_relative',[
                            'food_item.total_Increasedecrease_absolute',
                            'food_item.total_lastyear',
                        ],function(){
                            var result = 0;
                            if(parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"))!=0){
                                result = parseFloat($("[id='" + this.field[0] + "']").numberbox("getValue"))
                                        / parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"));
                            }
                            return result;
                        }
                ),
                new calc(
                        'food_item.perunit_thisyear',[
                            'food_item.total_thisyear',
                            'food_item.seededarea_thisyear',
                        ],function(){
                            var result = 0;
                            if(parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"))!=0){
                                result = parseFloat($("[id='" + this.field[0] + "']").numberbox("getValue"))
                                        / parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"))
                                        *1000;
                            }
                            return result;
                        }
                ),
                new calc(
                        'food_item.perunit_lastyear',[
                            'food_item.total_lastyear',
                            'food_item.seededarea_lastyear',
                        ],function(){
                            var result = 0;
                            if(parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"))!=0){
                                result = parseFloat($("[id='" + this.field[0] + "']").numberbox("getValue"))
                                        / parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"))
                                        *1000;
                            }
                            return result;
                        }
                ),
                new calc(
                        'food_item.perunit_Increasedecrease_absolute',[
                            'food_item.perunit_thisyear',
                            'food_item.perunit_lastyear',
                        ],function(){
                            var result;
                            result = parseFloat($("[id='" + this.field[0] + "']").numberbox("getValue"))
                                    - parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"));
                            return result;
                        }
                ),
                new calc(
                        'food_item.perunit_Increasedecrease_relative',[
                            'food_item.perunit_Increasedecrease_absolute',
                            'food_item.perunit_lastyear',
                        ],function(){
                            var result = 0;
                            if(parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"))!=0){
                                result = parseFloat($("[id='" + this.field[0] + "']").numberbox("getValue"))
                                        / parseFloat($("[id='" + this.field[1] + "']").numberbox("getValue"));
                            }
                            return result;
                        }
                ),

            ]
            //重复模式 替换方法
            var pattern = [
                "food_item",
                "food_xiaomai_food_item",
                "rapeseed_food_item",
            ]
            var calcarr = [];
            for(var i = 0;i<pattern.length;i++){
                for (var j = 0; j < temp.length; j++) {
                    var obj = new calc("",[]);
                    obj.name = temp[j].name.replace("food_item",pattern[i]);
                    for(var k = 0;k<temp[j].field.length;k++){
                        obj.field.push(temp[j].field[k].replace("food_item",pattern[i]));
                    }
                    obj.func = temp[j].func;

                    calcarr.push(obj);
                }
            }

            for (var i = 0; i < calcarr.length; i++) {
                $("[id='" + calcarr[i].name+"']").numberbox("disable");
            }
            $("#SummerFoodAndRapeseedExpecProForm input").blur(function () {
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
        <li><a href="#">新增调查表</a></li>
    </ul>
</div>

<div class="formbody">
    <form:form commandName="SummerFoodAndRapeseedExpecProForm">
        <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
                <td>调查表</td>
                <td><form:input class="easyui-combobox" required="true" data-options="url:'/mobile/registrationForm/selectJsonB/summerFoodAndRapeseedExpecPro',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'" path="summerFoodAndRapeseedExpecPro.registration_form_id"/></td>
            </tr>
            <tr>
                <td>调查村数</td>
                <td><form:input path="summerFoodAndRapeseedExpecPro.survey_village_num" class="easyui-numberbox" data-options="precision:0"/></td>
            </tr>
            <tr>
                <td>调查户数</td>
                <td><form:input path="summerFoodAndRapeseedExpecPro.survey_family_num" class="easyui-numberbox" data-options="precision:0"/></td>
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
                            <td><form:input path="food_item.seededarea_lastyear" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>本年预计</td>
                            <td><form:input path="food_item.seededarea_thisyear" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>绝对数</td>
                            <td><form:input path="food_item.seededarea_Increasedecrease_absolute" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>相对数</td>
                            <td><form:input path="food_item.seededarea_Increasedecrease_relative" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td colspan="4">单产（公斤/亩）</td>
                        </tr>
                        <tr>
                            <td>上年实际</td>
                            <td><form:input path="food_item.perunit_lastyear" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>本年预计</td>
                            <td><form:input path="food_item.perunit_thisyear" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>绝对数</td>
                            <td><form:input path="food_item.perunit_Increasedecrease_absolute" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>相对数</td>
                            <td><form:input path="food_item.perunit_Increasedecrease_relative" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td colspan="4">总产量（吨）</td>
                        </tr>
                        <tr>
                            <td>上年实际</td>
                            <td><form:input path="food_item.total_lastyear" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>本年预计</td>
                            <td><form:input path="food_item.total_thisyear" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>绝对数</td>
                            <td><form:input path="food_item.total_Increasedecrease_absolute" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>相对数</td>
                            <td><form:input path="food_item.total_Increasedecrease_relative" class="easyui-numberbox" data-options="precision:2"/></td>
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
                            <td><form:input path="food_xiaomai_food_item.seededarea_lastyear" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>本年预计</td>
                            <td><form:input path="food_xiaomai_food_item.seededarea_thisyear" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>绝对数</td>
                            <td><form:input path="food_xiaomai_food_item.seededarea_Increasedecrease_absolute" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>相对数</td>
                            <td><form:input path="food_xiaomai_food_item.seededarea_Increasedecrease_relative" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td colspan="4">单产（公斤/亩）</td>
                        </tr>
                        <tr>
                            <td>上年实际</td>
                            <td><form:input path="food_xiaomai_food_item.perunit_lastyear" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>本年预计</td>
                            <td><form:input path="food_xiaomai_food_item.perunit_thisyear" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>绝对数</td>
                            <td><form:input path="food_xiaomai_food_item.perunit_Increasedecrease_absolute" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>相对数</td>
                            <td><form:input path="food_xiaomai_food_item.perunit_Increasedecrease_relative" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td colspan="4">总产量（吨）</td>
                        </tr>
                        <tr>
                            <td>上年实际</td>
                            <td><form:input path="food_xiaomai_food_item.total_lastyear" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>本年预计</td>
                            <td><form:input path="food_xiaomai_food_item.total_thisyear" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>绝对数</td>
                            <td><form:input path="food_xiaomai_food_item.total_Increasedecrease_absolute" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>相对数</td>
                            <td><form:input path="food_xiaomai_food_item.total_Increasedecrease_relative" class="easyui-numberbox" data-options="precision:2"/></td>
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
                            <td><form:input path="rapeseed_food_item.seededarea_lastyear" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>本年预计</td>
                            <td><form:input path="rapeseed_food_item.seededarea_thisyear" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>绝对数</td>
                            <td><form:input path="rapeseed_food_item.seededarea_Increasedecrease_absolute" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>相对数</td>
                            <td><form:input path="rapeseed_food_item.seededarea_Increasedecrease_relative" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td colspan="4">单产（公斤/亩）</td>
                        </tr>
                        <tr>
                            <td>上年实际</td>
                            <td><form:input path="rapeseed_food_item.perunit_lastyear" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>本年预计</td>
                            <td><form:input path="rapeseed_food_item.perunit_thisyear" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>绝对数</td>
                            <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_absolute" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>相对数</td>
                            <td><form:input path="rapeseed_food_item.perunit_Increasedecrease_relative" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>

                        <tr>
                            <td colspan="4">总产量（吨）</td>
                        </tr>
                        <tr>
                            <td>上年实际</td>
                            <td><form:input path="rapeseed_food_item.total_lastyear" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>本年预计</td>
                            <td><form:input path="rapeseed_food_item.total_thisyear" class="easyui-numberbox" data-options="precision:2"/></td>
                        </tr>
                        <tr>
                            <td>绝对数</td>
                            <td><form:input path="rapeseed_food_item.total_Increasedecrease_absolute" class="easyui-numberbox" data-options="precision:2"/></td>
                            <td>相对数</td>
                            <td><form:input path="rapeseed_food_item.total_Increasedecrease_relative" class="easyui-numberbox" data-options="precision:2"/></td>
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
                if ($("#SummerFoodAndRapeseedExpecProForm").form("validate")) {
                    $.ajax({
                        cache: false,
                        type: "POST",
                        url: "/mobile/summerFoodAndRapeseedExpecPro/add",
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
                }
            });
        });
    </script>
</div>
</body>
</html>
