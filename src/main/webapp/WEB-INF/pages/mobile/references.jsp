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
<script type="text/javascript" src="/mobile/js/jquery.idTabs.min.js"></script>
<%--<script type="text/javascript" src="/mobile/kindeditor/kindeditor-min.js"></script>
<script type="text/javascript" src="/mobile/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript">
    KindEditor.ready(function(K){
        K.create("#note",{
            afterBlur:function(){
                this.sync();
            }
        })
    })
</script>--%>
<script type="text/javascript" src="/mobile/laydate/laydate.js"></script>
<script type="text/javascript" src="/mobile/easyui/src/easyloader.js"></script>

<script type="text/javascript">
    easyloader.base = "/mobile/easyui/";
    easyloader.theme = "metro";
    easyloader.locale = "zh_CN";
    easyloader.load(['tooltip','combotree','calendar','combobox','resizable'])
</script>