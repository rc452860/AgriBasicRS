<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-04-02
  Time: 22:01
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="my" uri="/exam" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <script type="text/javascript">
        window.deleteUrl = "/mobile/autumnWinterPlantsIntention/delete";
        window.deleteMulUrl = "/mobile/autumnWinterPlantsIntention/deleteMulit";
    </script>
    <c:import url="references.jsp"></c:import>
</head>


<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">秋冬作物播种面积意向</a></li>
        <li><a href="#">秋冬作物播种面积列表</a></li>
    </ul>
</div>

<div class="rightinfo">

    <div class="tools">

        <ul class="toolbar">
            <li onclick="window.location.href='/mobile/autumnWinterPlantsIntention/add'" class="click"><span><img
                    src="/mobile/img/t01.png"/></span>添加
            </li>
            <li onclick="DeleteMulit()"><span><img src="/mobile/img/t03.png"/></span>删除</li>
        </ul>
    </div>


    <table class="tablelist">
        <thead>
        <tr>
            <th><input name="" type="checkbox" id="ctrall" value=""/></th>
            <th>调查表</th>
            <th>农户id</th>
            <th>播种总面积</th>
            <th>粮食合计</th>
            <th>谷物</th>
            <th>豆类</th>
            <th>薯类</th>
            <th>油料作物</th>
            <th>蔬菜</th>
            <th>其他作物</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">

            <tr>
                <td><input class="ctr" name="" type="checkbox" value="${item.id}"/></td>
                <td><my:ctr code="${item.registration_form_id}"/></td>
                <td>${item.farmer_id}</td>
                <td>${item.plant_total}</td>
                <td>${item.food_total}</td>
                <td>${item.food_grain}</td>
                <td>${item.food_legume}</td>
                <td>${item.food_potato}</td>
                <td>${item.oilplant_total}</td>
                <td>${item.vegetables_total}</td>
                <td>${item.otherplant_total}</td>
                <td><a href="/mobile/autumnWinterPlantsIntention/edit?id=${item.id}" class="tablelink">修改/查看</a> <a
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
                window.location.href = "/mobile/autumnWinterPlantsIntention/list?page=" + index;
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
