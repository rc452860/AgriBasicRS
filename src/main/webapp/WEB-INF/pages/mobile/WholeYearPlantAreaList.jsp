<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-03-29
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" uri="/exam" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <c:import url="references.jsp"></c:import>
    <script type="text/javascript">
        window.deleteUrl = "/mobile/WholeYearPlantArea/delete";
        window.deleteMulUrl = "/mobile/WholeYearPlantArea/deleteMulit";
    </script>

</head>


<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">全年农作物播种面积意向（预计）调查</a></li>
        <li><a href="#">全全年农作物播种面积意向（预计）调查列表</a></li>
    </ul>
</div>

<div class="rightinfo">

    <div class="tools">

        <ul class="toolbar">
            <li onclick="window.dialog('/mobile/WholeYearPlantArea/add')" class="click"><span><img
                    src="/mobile/img/t01.png"/></span>添加
            </li>
            <li onclick="DeleteMulit()"><span><img src="/mobile/img/t03.png"/></span>删除</li>
        </ul>
    </div>

    <ul class="seachform1 clearfix">
        <li><label>调查表:</label><input name="name" type="text" class="scinput1 choose"/></li>
    </ul>
    <ul class="seachform1 clearfix">
        <li class="sarchbtn">
            <label>&nbsp;</label>
            <input name="" type="button" onclick="search()" id="search-button" class="scbtn" value="查询"/>
            <input name="" type="button" class="scbtn2" value="导出"/></li>
    </ul>

    <div class="formtitle clearfix"><span>全全年农作物播种面积意向（预计）调查列表</span></div>

    <table class="tablelist">
        <thead>
        <tr>
            <th><input name="" type="checkbox" id="ctrall" value=""/></th>
            <th>调查表</th>
            <th>农户id</th>
            <th>调查形式</th>
            <th>农作物总面积</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">
            <tr>
                <td><input class="ctr" name="" type="checkbox" value="${item.id}"/></td>
                <td>${item.registration_form_id}</td>
                <td>${item.farmer_id}</td>
                <td><my:investigation num="${item.form_tag}"/></td>
                <td>${item.plant_total}</td>
                <td><a href="/mobile/WholeYearPlantArea/edit?id=${item.id}" class="tablelink">修改/查看</a> <a
                        href="javascript:Delete('${item.id}')" class="tablelink"> 删除</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>


    <div class="pagin">
        <div class="message">共<i class="blue">${count}</i>条记录，当前显示第&nbsp;<i class="blue">${index}</i>页</div>
        <div id="pageGro" class="cb">

        </div>
        <script type="text/javascript">/*分页插件*/
        $('#pageGro').pagination({
            coping: true,
            homePage: '首页',
            endPage: '末页',
            prevContent: '上页',
            nextContent: '下页',
            current:${index},
            pageCount:${countpage},
            callback: function (index) {
                window.location.href = "/mobile/WholeYearPlantArea/list?page=" + index;
            }
        });
        </script>
    </div>
</div>


<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');
</script>

</body>

</html>
