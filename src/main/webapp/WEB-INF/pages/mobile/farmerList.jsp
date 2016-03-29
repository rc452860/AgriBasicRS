<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="/mobile/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="/mobile/js/jquery.js"></script>

    <%--<script type="text/javascript">--%>
    <%--$(document).ready(function () {--%>
    <%--$(".click").click(function () {--%>
    <%--$(".tip").fadeIn(200);--%>
    <%--});--%>

    <%--$(".tiptop a").click(function () {--%>
    <%--$(".tip").fadeOut(200);--%>
    <%--});--%>

    <%--$(".sure").click(function () {--%>
    <%--$(".tip").fadeOut(100);--%>
    <%--});--%>

    <%--$(".cancel").click(function () {--%>
    <%--$(".tip").fadeOut(100);--%>
    <%--});--%>

    <%--});--%>
    <%--</script>--%>
    <script type="text/javascript">
        function Delete(id) {/*删除脚本*/
            $.ajax({
                cache: false,
                type: "POST",
                url: "/mobile/manage/farmerDelete", /*此处需修改*/
                data: {'id': id},
                async: false,
                error: function (XMLHttpRequest) {
                    alert("error:" + XMLHttpRequest.status);
                },
                success: function (data) {
                    if (data.message != null) alert(data.message);
                    /*if(data.url != null) window.location.href = data.url;*/
                    if (data.message == "删除成功")
                        window.location.reload();
                }
            });
        }
        function DeleteMulit() {
            var arr = new Array();
            $(".ctr:checked").each(function () {
                arr.push($(this).val())
            });
            console.log(arr)
            $.ajax({
                cache: false,
                type: "POST",
                url: "/mobile/manage/farmerDeleteMulit", /*此处需修改*/
                data: {ids: arr},
                async: false,
                error: function (XMLHttpRequest) {
                    alert("error:" + XMLHttpRequest.status);
                },
                success: function (data) {
                    if (data.message != null) alert(data.message);
                    /*if(data.url != null) window.location.href = data.url;*/
                    if (data.message == "删除成功")
                        window.location.reload();
                }
            });
        }
        $(function () {
            $("#ctrall").click(function () {
                $(".ctr").attr("checked", $(this).attr("checked") != null);
            })
        })
    </script>
    <%--分页插件--%>
    <link rel="stylesheet" href="/mobile/css/pagination.css">
    <script type="text/javascript" src="/mobile/js/jquery.pagination.min.js"></script>
</head>


<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">农户基本信息</a></li>
        <li><a href="#">农户基本信息列表</a></li>
    </ul>
</div>

<div class="rightinfo">

    <div class="tools">

        <ul class="toolbar">
            <li onclick="window.location.href='/mobile/manage/farmerAdd'" class="click"><span><img
                    src="/mobile/img/t01.png"/></span>添加
            </li>
            <%--<li class="click"><span><img src="/mobile/img/t02.png"/></span>修改</li>--%>
            <li onclick="DeleteMulit()"><span><img src="/mobile/img/t03.png"/></span>删除</li>
            <%--<li><span><img src="/mobile/img/t04.png"/></span>统计</li>--%>
        </ul>


        <%--<ul class="toolbar1">--%>
        <%--<li><span><img src="/mobile/img/t05.png"/></span>设置</li>--%>
        <%--</ul>--%>

    </div>


    <table class="tablelist">
        <thead>
        <tr>
            <th><input name="" type="checkbox" id="ctrall" value=""/></th>
            <%--<th>编号<i class="sort"><img src="/mobile/img/px.gif"/></i></th>--%>
            <th>所在镇村组编号</th>
            <th>所在镇村组</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>家庭人口</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">

            <tr>
                <td><input class="ctr" name="" type="checkbox" value="${item.id}"/></td>
                <td>${item.region_no}</td>
                <td>${item.region}</td>
                <td>${item.name}</td>
                <td>${item.sex}</td>
                <td>${item.age}</td>
                <td>${item.familypopulation}</td>
                <td><a href="/mobile/manage/farmerEdit?id=${item.id}" class="tablelink">修改/查看</a> <a
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
                window.location.href = "/mobile/manage/farmerList?page=" + index;
            }
        });
        </script>
        <%--<ul class="paginList">
            <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
            <li class="paginItem"><a href="javascript:;">1</a></li>
            <li class="paginItem current"><a href="javascript:;">2</a></li>
            <li class="paginItem"><a href="javascript:;">3</a></li>
            <li class="paginItem"><a href="javascript:;">4</a></li>
            <li class="paginItem"><a href="javascript:;">5</a></li>
            <li class="paginItem more"><a href="javascript:;">...</a></li>
            <li class="paginItem"><a href="javascript:;">10</a></li>
            <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>--%>
    </div>


    <%--<div class="tip">--%>
    <%--<div class="tiptop"><span>提示信息</span><a></a></div>--%>

    <%--<div class="tipinfo">--%>
    <%--<span><img src="/mobile/img/ticon.png"/></span>--%>
    <%--<div class="tipright">--%>
    <%--<p>是否确认对信息的修改 ？</p>--%>
    <%--<cite>如果是请点击确定按钮 ，否则请点取消。</cite>--%>
    <%--</div>--%>
    <%--</div>--%>

    <%--<div class="tipbtn">--%>
    <%--<input name="" type="button" class="sure" value="确定"/>&nbsp;--%>
    <%--<input name="" type="button" class="cancel" value="取消"/>--%>
    <%--</div>--%>

</div>


<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');


</script>

</body>

</html>