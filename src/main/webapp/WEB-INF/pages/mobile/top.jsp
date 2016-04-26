<%@ page import="abrs.system.web.context.SessionContext" %>
<%@ page import="abrs.system.dao.Entity.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>襄州区农业基点调查信息系统</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" />

    <script language="JavaScript" src="js/jquery.js"></script>
    <script type="text/javascript">
        $(function(){
            //顶部导航切换
            $(".nav li a").click(function(){
                $(".nav li a.selected").removeClass("selected")
                $(this).addClass("selected");
            })
        })
    </script>


</head>

<body style="background:url(img/topbg.gif) repeat-x;">

<div class="topleft">
    <a href="main.html" target="_parent"><img src="img/logo.png" title="系统首页" /></a>
</div>

<ul class="nav">

</ul>

<div class="topright">
    <ul>
        <li><span><img src="img/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
        <li><a href="login.html" target="_parent">退出</a></li>
    </ul>

    <div class="user">
        <span><%=((User)session.getAttribute(SessionContext.CURRENT_USER)).getName()%></span>
    </div>

</div>

</body>
</html>
