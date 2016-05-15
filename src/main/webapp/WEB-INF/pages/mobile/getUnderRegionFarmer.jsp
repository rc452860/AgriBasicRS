<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>选择农户</title>
    <c:import url="references.jsp"></c:import>
</head>

<body>
    <div style="width: 450px;margin: 0 auto;">
        <h3 style="text-align: center;padding: 8px 0;">请选择农户</h3>
        <table id="dg"></table>
        <div id="tb" style="padding:5px;height:auto;">
            <div>
                姓名: <input id="name" name="name" class="easyui-textbox" style="height:22px;border:1px solid #CCCCCC;width:80px">
                <a href="javascript:void(0)" id="btn-search" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#btn-search").click(function(){
            var term = $("#name").val();
            $('#dg').datagrid("load",{
                name:term
            });
        })
        $('#dg').datagrid({
            url:'/mobile/region/getUnderRegionFarmer',//url
            method:'get',
            columns:[[
                {field:'name',title:'姓名',width:'100px',align:"center",halign:"center"},
                {field:'region',title:'所在村组',width:'100px',align:"center",halign:"center"},
                {field:'region_no',title:'区域代码',width:'100px',align:"center",halign:"center"},
                {field:'id',title:'操作',width:'100px',align:"center",halign:"center",
                    formatter: function(value,row,index){
                        return "<a href='/mobile/region/redirect?id="+value+"'>选择</a>";
                    }
                }
            ]],
            pagination:true,
            toolbar:"#tb"
        });
    </script>
</body>
</html>