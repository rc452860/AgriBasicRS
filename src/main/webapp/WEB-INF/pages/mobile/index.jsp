<%@ page import="abrs.system.web.context.SessionContext" %>
<%@ page import="abrs.system.dao.Entity.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/mobile/css/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/mobile/js/jquery.js"></script>
    <script type="text/javascript" src="/mobile/easyui/src/easyloader.js"></script>

    <script type="text/javascript">
        easyloader.base = "/mobile/easyui/";
        easyloader.theme = "metro";
        easyloader.locale = "zh_CN";
        easyloader.load(['tooltip','combotree','calendar','combobox','resizable','tabs'],function(){
            $("#tt").tabs({
                height:($(window).height()-$("#tt").offset().top)
            })
            $(window).resize(function(){
                $("#tt").tabs({
                    height:($(window).height()-$("#tt").offset().top)
                })
            })
            })
    </script>
    <script type="text/javascript">
        function addTab(title, url){
//            if ($('#tt').tabs('exists', title)){
//                $('#tt').tabs('select', title);
//            } else {
                var content = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
                $('#tt').tabs('add',{
                    title:title,
                    content:content,
                    closable:true,
                    fit:true,
                    height:$(window).height()-$("#tt").offset().top
                });
//            }
        }
        /*function addTab(title, href,icon){
            var tt = $('#tabs');
            if (tt.tabs('exists', title)){//如果tab已经存在,则选中并刷新该tab
                tt.tabs('select', title);
                refreshTab({tabTitle:title,url:href});
            } else {
                if (href){
                    var content = '<iframe scrolling="no" frameborder="0"  src="'+href+'" style="width:100%;height:100%;"></iframe>';
                } else {
                    var content = '未实现';
                }
                tt.tabs('add',{
                    title:title,
                    closable:true,
                    content:content,
                    iconCls:icon||'icon-default'
                });
            }
        }
        /!**
         * 刷新tab
         * @cfg
         *example: {tabTitle:'tabTitle',url:'refreshUrl'}
         *如果tabTitle为空，则默认刷新当前选中的tab
         *如果url为空，则默认以原来的url进行reload
         *!/
        function refreshTab(cfg){
            var refresh_tab = cfg.tabTitle?$('#tabs').tabs('getTab',cfg.tabTitle):$('#tabs').tabs('getSelected');
            if(refresh_tab && refresh_tab.find('iframe').length > 0){
                var _refresh_ifram = refresh_tab.find('iframe')[0];
                var refresh_url = cfg.url?cfg.url:_refresh_ifram.src;
                //_refresh_ifram.src = refresh_url;
                _refresh_ifram.contentWindow.location.href=refresh_url;
            }
        }*/
    </script>

</head>


<body>
<div id="tt" class="easyui-tabs" style="">
    <div title="首页">
        <div class="place">
            <span>位置：</span>
            <ul class="placeul">
                <li><a href="#">首页</a></li>
            </ul>
        </div>

        <div class="mainindex">


            <div class="welinfo">
                <span><img src="img/sun.png" alt="天气" /></span>
                <b><%=((User)session.getAttribute(SessionContext.CURRENT_USER)).getName()%>您好，欢迎使用信息管理系统</b>
                <a href="#">帐号设置</a>
            </div>


            <div class="xline"></div>

            <div class="box"></div>

            <div class="welinfo">
                <span><img src="img/dp.png" alt="提醒" /></span>
                <b>襄州区农业基点调查信息系统使用指南</b>
            </div>

            <ul class="infolist">
                <li><span>您可以快速进行登记表填写或管理</span></li>
                <li><span>您可以快速发布登记表或管理登记表</span></li>
                <li><span>您可以进行密码修改账户设置等操作</span></li>
            </ul>

            <div class="xline"></div>

        </div>
    </div>
</div>
<%--<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
    </ul>
</div>

<div class="mainindex">


    <div class="welinfo">
        <span><img src="img/sun.png" alt="天气" /></span>
        <b>Admin早上好，欢迎使用信息管理系统</b>(admin@uimaker.com)
        <a href="#">帐号设置</a>
    </div>

    <div class="welinfo">
        <span><img src="img/time.png" alt="时间" /></span>
        <i>您上次登录的时间�?2013-10-09 15:22</i> （不是您登录的？<a href="#">请点这里</a>�?
    </div>

    <div class="xline"></div>

    <ul class="iconlist clearfix">
        <li><img src="img/ico01.png" /><p><a href="#">管理设置</a></p></li>
        <li><img src="img/ico02.png" /><p><a href="#">发布文章</a></p></li>
        <li><img src="img/ico03.png" /><p><a href="#">数据统计</a></p></li>
        <li><img src="img/ico04.png" /><p><a href="#">文件上传</a></p></li>
        <li><img src="img/ico05.png" /><p><a href="#">目录管理</a></p></li>
        <li><img src="img/ico06.png" /><p><a href="#">查询</a></p></li>
    </ul>

    <div class="ibox clearfix"><a class="ibtn"><img src="img/iadd.png" />添加新的快捷功能</a></div>

    <div class="xline"></div>
    <div class="box"></div>

    <div class="welinfo">
        <span><img src="img/dp.png" alt="提醒" /></span>
        <b>Uimaker信息管理系统使用指南</b>
    </div>

    <ul class="infolist">
        <li><span>您可以快速进行文章发布管理操�?</span><a class="ibtn">发布或管理文�?</a></li>
        <li><span>您可以快速发布产�?</span><a class="ibtn">发布或管理产�?</a></li>
        <li><span>您可以进行密码修改�?�账户设置等操作</span><a class="ibtn">账户管理</a></li>
    </ul>

    <div class="xline"></div>

    <div class="uimakerinfo"><b>查看Uimaker网站使用指南，您可以了解到多种风格的B/S后台管理界面,软件界面设计，图标设计，手机界面等相关信�?</b>(<a href="http://www.uimaker.com" target="_blank">www.uimaker.com</a>)</div>

    <ul class="umlist">
        <li><a href="#">如何发布文章</a></li>
        <li><a href="#">如何访问网站</a></li>
        <li><a href="#">如何管理广告</a></li>
        <li><a href="#">后台用户设置(权限)</a></li>
        <li><a href="#">系统设置</a></li>
    </ul>


</div>--%>



</body>

</html>
