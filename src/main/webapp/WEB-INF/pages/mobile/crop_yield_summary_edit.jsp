<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-04-04
  Time: 22:55
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
                    total += this.getFValue(i);
                }
                return total;
            }
            calc.prototype.getFValue = function (key) {
                if (typeof key == "number")
                    return parseFloat($("[id='" + this.field[key] + "']").numberbox("getValue"));
                else if (typeof key == "string")
                    return parseFloat($("[id='" + key + "']").numberbox("getValue"));
            }
            var calcarr = [
                new calc(//本年预计
                        'total_of_fifteen_item.seededarea_thisyear', [
                            "list_item{0-15}.seededarea_thisyear"
                        ],
                        function () {
                            var result = 0;
                            var begin, end;
                            var pattern = /\{([0-9])*?-([0-9]*?)\}/;
                            var match = pattern.exec(this.field[0]);
                            begin = match[1];
                            end = match[2];
                            for (var i = begin; i < end; i++) {
                                result += this.getFValue(this.field[0].replace(pattern, i));
                            }
                            return result;
                        }
                ),
                new calc(
                        'total_of_fifteen_item.total_thisyear', [
                            "list_item{0-15}.total_thisyear"
                        ],
                        function () {
                            var result = 0;
                            var begin, end;
                            var pattern = /\{([0-9])*?-([0-9]*?)\}/;
                            var match = pattern.exec(this.field[0]);
                            begin = match[1];
                            end = match[2];
                            for (var i = begin; i < end; i++) {
                                result += this.getFValue(this.field[0].replace(pattern, i));
                            }
                            return result;
                        }
                ),
                new calc(
                        'total_of_fifteen_item.perunit_thisyear', [
                            'total_of_fifteen_item.total_thisyear',
                            'total_of_fifteen_item.seededarea_thisyear'
                        ],
                        function () {
                            var result = 0;
                            if (this.getFValue(1) != 0)
                                result = this.getFValue(0) / this.getFValue(1) * 1000;
                            return result;
                        }
                ),//上年实际
                new calc(
                        'total_of_fifteen_item.seededarea_lastyear', [
                            "list_item{0-15}.seededarea_lastyear"
                        ],
                        function () {
                            var result = 0;
                            var begin, end;
                            var pattern = /\{([0-9])*?-([0-9]*?)\}/;
                            var match = pattern.exec(this.field[0]);
                            begin = match[1];
                            end = match[2];
                            for (var i = begin; i < end; i++) {
                                result += this.getFValue(this.field[0].replace(pattern, i));
                            }
                            return result;
                        }
                ),
                new calc(
                        'total_of_fifteen_item.total_lastyear', [
                            "list_item{0-15}.total_lastyear"
                        ],
                        function () {
                            var result = 0;
                            var begin, end;
                            var pattern = /\{([0-9])*?-([0-9]*?)\}/;
                            var match = pattern.exec(this.field[0]);
                            begin = match[1];
                            end = match[2];
                            for (var i = begin; i < end; i++) {
                                result += this.getFValue(this.field[0].replace(pattern, i));
                            }
                            return result;
                        }
                ),
                new calc(
                        'total_of_fifteen_item.perunit_lastyear', [
                            'total_of_fifteen_item.total_lastyear',
                            'total_of_fifteen_item.seededarea_lastyear'
                        ],
                        function () {
                            var result = 0;
                            if (this.getFValue(1) != 0)
                                result = this.getFValue(0) / this.getFValue(1) * 1000;
                            return result;
                        }
                ),

            ]
            for (var i = 0; i < 15; i++) {
                var perunit_thisyear_template = "list_item" + i + ".perunit_thisyear",
                        total_thisyear_template = "list_item" + i + ".total_thisyear",
                        seededarea_thisyear_template = "list_item" + i + ".seededarea_thisyear";
                calcarr.push(new calc(perunit_thisyear_template, [
                            total_thisyear_template,
                            seededarea_thisyear_template
                        ],
                        function () {
                            var result = 0;
                            if (this.getFValue(1) != 0)
                                result = this.getFValue(0) / this.getFValue(1) * 1000;
                            return result;
                        }))
                var perunit_lastyear_template = "list_item" + i + ".perunit_lastyear",
                        total_lastyear_template = "list_item" + i + ".total_lastyear",
                        seededarea_lastyear_template = "list_item" + i + ".seededarea_lastyear";
                calcarr.push(new calc(perunit_lastyear_template, [
                            total_lastyear_template,
                            seededarea_lastyear_template
                        ],
                        function () {
                            var result = 0;
                            if (this.getFValue(1) != 0)
                                result = this.getFValue(0) / this.getFValue(1) * 1000;
                            return result;
                        }))
            }

            calcarr.push(new calc(
                    'simple_average_item.perunit_thisyear', [
                        "list_item{0-15}.perunit_thisyear"
                    ],
                    function () {
                        var result = 0;
                        var begin, end;
                        var pattern = /\{([0-9])*?-([0-9]*?)\}/;
                        var match = pattern.exec(this.field[0]);
                        begin = match[1];
                        end = match[2];
                        for (var i = begin; i < end; i++) {
                            result += this.getFValue(this.field[0].replace(pattern, i));
                        }
                        return result / (end - begin);
                    }
            ))
            calcarr.push(new calc(
                    'simple_average_item.perunit_lastyear', [
                        "list_item{0-15}.perunit_lastyear"
                    ],
                    function () {
                        var result = 0;
                        var begin, end;
                        var pattern = /\{([0-9])*?-([0-9]*?)\}/;
                        var match = pattern.exec(this.field[0]);
                        begin = match[1];
                        end = match[2];
                        for (var i = begin; i < end; i++) {
                            result += this.getFValue(this.field[0].replace(pattern, i));
                        }
                        return result / (end - begin);
                    }
            ))

            for (var i = 0; i < calcarr.length; i++) {
                $("[id='" + calcarr[i].name + "']").numberbox("disable");
            }
            $("#CropYieldSummaryForm input").blur(function () {
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
        <li><a href="#">农作物产量调查汇总表</a></li>
        <li><a href="#">修改调查信息</a></li>
    </ul>
</div>

<div class="formbody">

    <form:form commandName="CropYieldSummaryForm">
        <form:hidden path="cropYieldSummary.id"/>
        <form:hidden path="cropYieldSummary.total_of_fifteen_itemid"/>
        <form:hidden path="cropYieldSummary.simple_average_itemid"/>
        <form:hidden path="cropYieldSummary.list_itemid"/>
        <form:hidden path="total_of_fifteen_item.id"/>
        <form:hidden path="simple_average_item.id"/>
        <form:hidden path="list_item[0].id"/>
        <form:hidden path="list_item[1].id"/>
        <form:hidden path="list_item[2].id"/>
        <form:hidden path="list_item[3].id"/>
        <form:hidden path="list_item[4].id"/>
        <form:hidden path="list_item[5].id"/>
        <form:hidden path="list_item[6].id"/>
        <form:hidden path="list_item[7].id"/>
        <form:hidden path="list_item[8].id"/>
        <form:hidden path="list_item[9].id"/>
        <form:hidden path="list_item[10].id"/>
        <form:hidden path="list_item[11].id"/>
        <form:hidden path="list_item[12].id"/>
        <form:hidden path="list_item[13].id"/>
        <form:hidden path="list_item[14].id"/>
        <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3">调查表编号</td>
                <td colspan="5"><form:input class="easyui-combobox" required="true" data-options="url:'/mobile/registrationForm/selectJsonB/cropYieldSummary',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'" path="cropYieldSummary.registration_form_id"/></td>
            </tr>
            <tr>
                <td colspan="3">作物名称</td>
                <td colspan="5"><form:input path="cropYieldSummary.corp_name"/></td>
            </tr>

            <!--15基点户合计-->
            <tr>
                <td colspan="2">
                <td colspan="3">本年预计</td>
                <td colspan="3">上年实际</td>
            </tr>
            <tr>
                <td colspan="2">
                <td>播种面积（亩）</td>
                <td>单产（公斤/亩）</td>
                <td>总产量（吨）</td>
                <td>播种面积（亩）</td>
                <td>单产（公斤/亩）</td>
                <td>总产量（吨）</td>
            </tr>
            <!--15基点户合计-->
            <tr>
                <td colspan="2"></td>
                <td colspan="5">15基点户合计</td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="total_of_fifteen_item.seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="total_of_fifteen_item.perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="total_of_fifteen_item.total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="total_of_fifteen_item.seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="total_of_fifteen_item.perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="total_of_fifteen_item.total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>

            <!--15基点户-->
            <tr>
                <td colspan="2"></td>
                <td colspan="5">15基点户</td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[0].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[0].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[0].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[0].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[0].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[0].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[1].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[1].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[1].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[1].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[1].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[1].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[2].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[2].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[2].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[2].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[2].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[2].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[3].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[3].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[3].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[3].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[3].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[3].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[4].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[4].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[4].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[4].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[4].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[4].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[5].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[5].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[5].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[5].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[5].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[5].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[6].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[6].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[6].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[6].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[6].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[6].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[7].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[7].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[7].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[7].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[7].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[7].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[8].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[8].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[8].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[8].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[8].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[8].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[9].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[9].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[9].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[9].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[9].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[9].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[10].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[10].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[10].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[10].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[10].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[10].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[11].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[11].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[11].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[11].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[11].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[11].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[12].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[12].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[12].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[12].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[12].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[12].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[13].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[13].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[13].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[13].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[13].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[13].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td><form:input path="list_item[14].seededarea_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[14].perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[14].total_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[14].seededarea_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[14].perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td><form:input path="list_item[14].total_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
            </tr>

            <!--简单平均单产-->
            <tr>
                <td colspan="3">简单平均单产</td>
                <td><form:input path="simple_average_item.perunit_thisyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td colspan="2"></td>
                <td><form:input path="simple_average_item.perunit_lastyear" class="easyui-numberbox"
                                data-options="precision:2"/></td>
                <td colspan="1"></td>
            </tr>

            <tr>
                <td align="center" colspan="8"><input name="" type="button" id="submit_button"
                                                      value="提交"/>&nbsp;&nbsp;<input name="" type="reset" value="重置"/>
                </td>
            </tr>
        </table>

    </form:form>

    <%--此乃登陆代码--%>
    <script type="text/javascript">
        $(function () {
            $('#submit_button').click(function () {
                if ($('#CropYieldSummaryForm').form("validate")) {
                    if($('#CropYieldSummaryForm').form("validate")){
                        $.ajax({
                            cache: false,
                            type: "POST",
                            url: "/mobile/cropYieldSummary/edit",
                            data: $('#CropYieldSummaryForm').serialize(),
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
                }
            });
        });
    </script>
</div>
</body>
</html>
