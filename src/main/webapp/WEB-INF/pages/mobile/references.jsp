<%--
  Created by IntelliJ IDEA.
  User: rc452
  Date: 2016/4/9
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="/mobile/css/style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="/mobile/css/table.css">
<script type="text/javascript" src="/mobile/js/jquery.js"></script>
<%--<script type="text/javascript" src="/mobile/js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="/mobile/laydate/laydate.js"></script>--%>
<link href="/mobile/easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
<link href="/mobile/easyui/themes/metro/easyui.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="/mobile/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/mobile/easyui/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript" src="/mobile/easyui/plugins/validator.js"></script>

<script type="text/javascript">
    $(function(){
        if(typeof(inittree) != "undefined"){
            inittree();
            $("input[readonly]").css({background:"#CCC"});
        }
    })
</script>