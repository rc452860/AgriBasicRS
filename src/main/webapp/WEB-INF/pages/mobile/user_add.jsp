<%--
  Created by IntelliJ IDEA.
  User: rc452
  Date: 2016/4/15
  Time: 12:45
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

    <script type="text/javascript">
        function inittree() {
            $(".tree-city").combotree("tree").tree({
                onBeforeExpand: function (node) {
                    var children = $('.tree-city').combotree("tree").tree('getChildren', node.target);
                    if (children.length > 0) {
                        return;
                    }
                    //var level = node.attributes.level;
                    var pid = node.id;
                    //这里注意，请查看后面的有关这里的描述（最后的描述）
                    $('.tree-city').combotree("tree").tree("options").url = "/mobile/region/getChild";
                },
                onSelect: function (node) {
                    $("#region_no").val(node.id);
                    setTimeout(function(){
                        $("input[name=region]").val(node.text);
                    },50);
                }
            })
        }
    </script>

</head>

<body>


<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">系统设置</a></li>
    </ul>
</div>

<div class="formbody">

    <form:form commandName="UserForm">
        <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
                <td>选择区域</td>
                <td><form:input path="regionCode" class="easyui-combotree tree-city" style="width:150px;height:24px;" data-options="url:'/mobile/region/getRoot',method:'get',required:true" /></td>
                <td>昵称</td>
                <td>
                    <form:input path="name"/>
                </td>
            </tr>
            <tr>
                <td>用户名</td>
                <td><form:input path="username"/></td>
                <td>密码</td>
                <td><form:input path="password"/></td>
            </tr>
            <tr>
                <td>部门</td>
                <td><form:input path="department"/></td>
                <td>手机</td>
                <td><form:input path="phone"/></td>
            </tr>
            <tr>
                <td>QQ</td>
                <td><form:input path="qq"/></td>
                <td>Email</td>
                <td><form:input path="Email"/></td>
            </tr>
            <tr>
                <td>状态</td>
                <td>
                    <form:select class="easyui-combobox" style="width:150px"  path="role" >
                    <form:option value="1">启用</form:option>
                    <form:option value="2">注销</form:option>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>类型</td>
                <td>
                <form:select class="easyui-combobox" style="width:150px"  path="role" >
                    <form:option value="USER">农户调查对象</form:option>
                    <form:option value="ADMIN">基层调查员</form:option>
                    <form:option value="INFOADMIN">信息审核员</form:option>
                    <form:option value="SUPERADMIN">管理员</form:option>
                </form:select>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4"><input name="" type="button" id="submit_button" value="提交"/>&nbsp;&nbsp;<input name="" type="reset" value="重置"/></td>
            </tr>
        </table>
    </form:form>

    <%--此乃提交代码--%>
    <script type="text/javascript">
        $(function () {
            $('#submit_button').click(function () {
                $.ajax({
                    cache: false,
                    type: "POST",
                    url: "/mobile/user/add",
                    data: $('#UserForm').serialize(),
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
