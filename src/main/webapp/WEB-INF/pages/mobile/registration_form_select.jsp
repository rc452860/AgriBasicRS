<%--
  Created by IntelliJ IDEA.
  User: rc452
  Date: 2016/4/13
  Time: 20:18
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
<table id="datagrid">
</table>
<script type="text/javascript">
    $(function(){
        $('#datagrid').datagrid({
            border:false,
            fitColumns:true,
            singleSelect: true,
            pagination:true,
            method:"GET",
            url:"/mobile/registrationForm/selectJson",
            columns:[[
                {field:'no',title:'序号',width:20},
                {field:'name',title:'名称',width:40},
                {field:'region_id',title:"区域",width:40},
                {field:'opt',title:'操作',width:50,align:'center',
                    formatter:function(value,rec){
                        var btn = '<a class="editcls" onclick="choose(\''+rec.no+'\',\''+rec.name+'\')" href="javascript:void(0)">选择</a>';
                        return btn;
                    }
                }
            ]],
            onLoadSuccess:function(data){
                $('.editcls').linkbutton({text:'选择',plain:true,iconCls:'icon-ok'});
            }
        }).datagrid('resize', {
            width: $("#datagrid").parent().width(),
            height: $("#datagrid").parent().height()
        });
        $(window).resize(function () {
            $('#datagrid').datagrid('resize', {
                width: $("#datagrid").parent().width(),
                height: $("#datagrid").parent().height()
            })
        });
        /*window.choose = function(no,name){
            console.log(no+":"+name)
        }*/
    })
</script>
</body>
</html>
