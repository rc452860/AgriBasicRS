<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>无标题文档</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascrip" src="js/IE8.js"></script>

    <![endif]-->

    <script language="JavaScript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function(){
            //导航切换
            $(".menuson .header").click(function(){
                var $parent = $(this).parent();
                $(this).closest("li").siblings().removeAttr("class").find('.sub-menus').hide();

                $parent.addClass("active");
                if(!!$(this).next('.sub-menus').size()){
                    if($parent.hasClass("open")){
                        $parent.removeClass("open").find('.sub-menus').hide();
                    }else{
                        $parent.addClass("open").find('.sub-menus').show();
                    }


                }
            });

            // 三级菜单点击
            $('.sub-menus li').click(function(e) {
                $(".sub-menus li.active").removeClass("active")
                $(this).addClass("active");
            });

            $('.title').click(function(){
                var $ul = $(this).next('ul');
                $('dd').find('.menuson').slideUp();
                if($ul.is(':visible')){
                    $(this).next('.menuson').slideUp();
                }else{
                    $(this).next('.menuson').slideDown();
                }
            });
        })
    </script>


</head>

<body style="background:#fff3e1;">
<div class="lefttop png"><span></span>通讯录</div>

<dl class="leftmenu">

    <dd>
        <div class="title">
            <span><img src="img/leftico01.png" /></span>管理信息
        </div>
        <ul class="menuson">
            <li>
                <div class="header">
                    <cite></cite>
                    <a href="index.html" target="rightFrame">农户基本信息</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    <li><a href="/mobile/manage/farmerAdd" target="rightFrame">添加农户基本信息</a></li>
                    <li><a href="/mobile/manage/farmerList" target="rightFrame">农户基本信息列表</a></li>
                </ul>
            </li>
            <%--<li>
                <div class="header">
                    <cite></cite>
                    <a href="index.html" target="rightFrame">首页模版</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    <li><a href="javascript:;">文件管理</a></li>
                    <li><a href="javascript:;">模型信息配置</a></li>
                    <li><a href="javascript:;">基本内容</a></li>
                    <li><a href="javascript:;">自定义</a></li>
                </ul>
            </li>

            <li>
                <div class="header">
                    <cite></cite>
                    <a href="right.html" target="rightFrame">数据列表</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    <li><a href="javascript:;">文件数据</a></li>
                    <li><a href="javascript:;">学生数据列表</a></li>
                    <li><a href="javascript:;">我的数据列表</a></li>
                    <li><a href="javascript:;">自定义</a></li>
                </ul>
            </li>--%>

            <%--<li><cite></cite><a href="form.html" target="rightFrame">添加编辑</a><i class ="png"></i></li>--%>

        </ul>
    </dd>


</dl>

</body>
</html>
