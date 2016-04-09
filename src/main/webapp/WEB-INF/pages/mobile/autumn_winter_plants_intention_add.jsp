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
        <li><a href="#">秋冬作物播种面积意向</a></li>
        <li><a href="#">新增调查信息</a></li>
    </ul>
</div>

<div class="formbody">

    <form:form commandName="AutumnWinterPlantsIntentionForm">
        <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
                <td>调查表编号</td>
                <td><form:input path="autumnWinterPlantsIntention.registration_form_id"/></td>
            </tr>
            <tr>
                <td>农户id</td>
                <td><form:input path="autumnWinterPlantsIntention.farmer_id"/></td>
            </tr>
            <tr>
                <td>播种总面积</td>
                <td><form:input path="autumnWinterPlantsIntention.plant_total"/></td>
            </tr>
            <tr>
                <td>粮食合计</td>
                <td><form:input path="autumnWinterPlantsIntention.food_total"/></td>
            </tr>
            <tr>
                <td>谷物</td>
                <td><form:input path="autumnWinterPlantsIntention.food_grain"/></td>
            </tr>
            <tr>
                <td>其中：冬小麦</td>
                <td><form:input path="autumnWinterPlantsIntention.food_grain_dongxiaomai"/></td>
            </tr>
            <tr>
                <td>豆类 合计</td>
                <td><form:input path="autumnWinterPlantsIntention.food_legume"/></td>
            </tr>
            <tr>
                <td>薯类 合计</td>
                <td><form:input path="autumnWinterPlantsIntention.food_potato"/></td>
            </tr>
            <tr>
                <td>油料作物</td>
                <td><form:input path="autumnWinterPlantsIntention.oilplant_total"/></td>
            </tr>
            <tr>
                <td>其中：油菜籽</td>
                <td><form:input path="autumnWinterPlantsIntention.oilplant_youcaizi"/></td>
            </tr>
            <tr>
                <td>蔬菜</td>
                <td><form:input path="autumnWinterPlantsIntention.vegetables_total"/></td>
            </tr>
            <tr>
                <td>其他作物</td>
                <td><form:input path="autumnWinterPlantsIntention.otherplant_total"/></td>
            </tr>
            <tr>
                <td>其中：青饲料</td>
                <td><form:input path="autumnWinterPlantsIntention.otherplant_qingsiliaol"/></td>
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
                    url: "/mobile/autumnWinterPlantsIntention/add",
                    data: $('#AutumnWinterPlantsIntentionForm').serialize(),
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
