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

    <script language="JavaScript" src="/mobile/js/jquery.js"></script>
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
            $("a[target=rightFrame]").on("click",function (){
                if(self==top){
                    return true;
                }else{
                    var target = top.frames["rightFrame"];
                    if(!/(#|javascript)/.test($(this).attr('href'))){
                        target.addTab($(this).text(),$(this).attr('href'));
                        return false;
                    }
                }
            })


            //限制字符个数
            $(".menuson li a").each(function(){
                var maxwidth=10;
                if($(this).text().length>maxwidth){
                    $(this).text($(this).text().substring(0,maxwidth));
                    $(this).html($(this).html()+'...');
                }
            });
        })
    </script>



</head>

<body style="background:#fff3e1;">
<div class="lefttop png"><span></span></div>

<dl class="leftmenu">

    <dd>
        <div class="title">
            <span><img src="img/leftico01.png" /></span>管理信息
        </div>
        <ul class="menuson">
            <c:if test="${RoleAuth > 1}">
                <li>
                    <div class="header">
                        <cite></cite>
                        <a href="javascript:void(0)" target="rightFrame">系统设置</a>
                        <i class ="png"></i>
                    </div>
                    <ul class="sub-menus">
                        <li><a href="/mobile/user/list" target="rightFrame">用户列表</a></li>
                        <c:if test="${RoleAuth > 2}">
                            <li><a href="/mobile/region/add" target="rightFrame">添加区域单位</a></li>
                            <li><a href="/mobile/region/list" target="rightFrame">区域单位列表</a></li>
                        </c:if>
                        <c:if test="${RoleAuth > 3}">
                            <li><a href="javascript:void(0)">权限设置</a></li>
                            <li><a href="javascript:void(0)">数据备份</a></li>
                            <li><a href="javascript:void(0)">系统日志</a></li>
                        </c:if>
                    </ul>
                </li>
            </c:if>
            <li>
                <div class="header">
                    <cite></cite>
                    <a href="javascript:void(0)" target="rightFrame">农户基本信息</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    <li><a href="/mobile/manage/farmerAdd" target="rightFrame">添加农户基本信息</a></li>
                    <li><a href="/mobile/manage/farmerList" target="rightFrame">农户基本信息列表</a></li>
                </ul>
            </li>

            <c:if test="${RoleAuth > 1}">
                <li>
                    <div class="header">
                        <cite></cite>
                        <a href="javascript:void(0)" target="rightFrame">调查表信息</a>
                        <i class ="png"></i>
                    </div>
                    <ul class="sub-menus">
                        <li><a href="/mobile/registrationForm/add" target="rightFrame">添加调查表信息</a></li>
                        <li><a href="/mobile/registrationForm/list" target="rightFrame">调查表信息列表</a></li>
                        <li><a href="/mobile/registrationForm/workflowlist" target="rightFrame">调查表上报审核</a></li>
                        <li><a href="/mobile/registrationForm/workflowprocesslist" target="rightFrame">工作进度</a></li>
                    </ul>
                </li>
            </c:if>

            <li>
                <div class="header">
                    <cite></cite>
                    <a href="javascript:void(0)" target="rightFrame">夏粮、夏收油菜籽产量..</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    <li><a href="/mobile/summerFoodAndRapeseedExpecPro/add" target="rightFrame">添加调查表信息</a></li>
                    <li><a href="/mobile/summerFoodAndRapeseedExpecPro/list" target="rightFrame">调查表信息列表</a></li>
                </ul>
            </li>
            <li>
                <div class="header">
                    <cite></cite>
                    <a href="javascript:void(0)" target="rightFrame">全年农作物播种面积意向..</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    <li><a href="/mobile/WholeYearPlantArea/add" target="rightFrame">添加调查表信息</a></li>
                    <li><a href="/mobile/WholeYearPlantArea/list" target="rightFrame">调查表信息列表</a></li>
                </ul>
            </li>
            <li>
                <div class="header">
                    <cite></cite>
                    <a href="javascript:void(0)" target="rightFrame">秋收作物产量预计</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    <li><a href="/mobile/autumnFoodExpecPro/add" target="rightFrame">添加调查表信息</a></li>
                    <li><a href="/mobile/autumnFoodExpecPro/list" target="rightFrame">调查表信息列表</a></li>
                </ul>
            </li>
            <li>
                <div class="header">
                    <cite></cite>
                    <a href="javascript:void(0)" target="rightFrame">秋冬作物播种面积意向</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    <li><a href="/mobile/autumnWinterPlantsIntention/add" target="rightFrame">添加调查表信息</a></li>
                    <li><a href="/mobile/autumnWinterPlantsIntention/list" target="rightFrame">调查表信息列表</a></li>
                </ul>
            </li>
            <li>
                <div class="header">
                    <cite></cite>
                    <a href="javascript:void(0)" target="rightFrame">出栏肥猪生产成本、收益..</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    <li><a href="/mobile/costBenefitOfPig/add" target="rightFrame">添加调查表信息</a></li>
                    <li><a href="/mobile/costBenefitOfPig/list" target="rightFrame">调查表信息列表</a></li>
                </ul>
            </li>
            <li>
                <div class="header">
                    <cite></cite>
                    <a href="javascript:void(0)" target="rightFrame">种植业产品生产成本、收益..</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    <li><a href="/mobile/costBenefitProductivityOfPlant/add" target="rightFrame">添加调查表信息</a></li>
                    <li><a href="/mobile/costBenefitProductivityOfPlant/list" target="rightFrame">调查表信息列表</a></li>
                </ul>
            </li>
            <c:if test="${RoleAuth > 1}">
                <li>
                    <div class="header">
                        <cite></cite>
                        <a href="javascript:void(0)" target="rightFrame">主要农产品和农业生产资料价格监测旬报表(农民售价)</a>
                        <i class ="png"></i>
                    </div>
                    <ul class="sub-menus">
                        <li><a href="/mobile/productsAndMeansFarmerPrice/add" target="rightFrame">添加调查表信息</a></li>
                        <li><a href="/mobile/productsAndMeansFarmerPrice/list" target="rightFrame">调查表信息列表</a></li>
                    </ul>
                </li>
                <li>
                    <div class="header">
                        <cite></cite>
                        <a href="javascript:void(0)" target="rightFrame">主要农产品和农业生产资料价格监测旬报表(市场价格)</a>
                        <i class ="png"></i>
                    </div>
                    <ul class="sub-menus">
                        <li><a href="/mobile/productsAndMeansMarketPrice/add" target="rightFrame">添加调查表信息</a></li>
                        <li><a href="/mobile/productsAndMeansMarketPrice/list" target="rightFrame">调查表信息列表</a></li>
                    </ul>
                </li>

                <li>
                    <div class="header">
                        <cite></cite>
                        <a href="javascript:void(0)" target="rightFrame">农作物产量调查汇总表</a>
                        <i class ="png"></i>
                    </div>
                    <ul class="sub-menus">
                        <li><a href="/mobile/cropYieldSummary/add" target="rightFrame">添加调查表信息</a></li>
                        <li><a href="/mobile/cropYieldSummary/list" target="rightFrame">调查表信息列表</a></li>
                    </ul>
                </li>
            </c:if>
           <%-- <li>
                <div class="header">
                    <cite></cite>
                    <a href="javascript:void(0)" target="rightFrame">用户管理</a>
                    <i class ="png"></i>
                </div>
                <ul class="sub-menus">
                    &lt;%&ndash;<li><a href="/mobile/user/add" target="rightFrame">添加用户</a></li>&ndash;%&gt;
                    <li><a href="/mobile/user/list" target="rightFrame">用户列表</a></li>
                </ul>
            </li>--%>
            <%--<li>
                <div class="header">
                    <cite></cite>
                    <a href="javascript:void(0)" target="rightFrame">首页模版</a>
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
