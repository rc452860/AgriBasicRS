<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link rel="stylesheet" type="text/css" href="src/main/webapp/mobile/css/table.css"/>
    <link rel="stylesheet" type="text/css" href="table.css"/>
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
//                        setTimeout(function(){
//                            $("input[name=region]").val(node.text);
//                        },50);
                    }
                })
            };
            /*计算代码*/
            $(function(){
                $("#FarmerForm input").blur(function(){
                    $("#contract_total").numberbox("setValue",
                            parseFloat($("#contract_paddyfield").numberbox("getValue"))
                            +parseFloat($("#contract_dryfield").numberbox("getValue"))
                    );
                    $("#contract_total_exchange").numberbox("setValue",
                            parseFloat($("#contract_paddyfield_exchange").numberbox("getValue"))
                            +parseFloat($("#contract_dryfield_exchange").numberbox("getValue"))
                    )
                })
            })
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

    <form:form commandName="FarmerForm">
        <table class="form-add" cellpadding="0" cellspacing="0">
            <tr>
                <td>调查表编号</td>
                <td><form:input class="easyui-combobox" required="true" data-options="url:'/mobile/registrationForm/selectJsonB/manage',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'" path="registration_form_id"/></td>
            </tr>
            <tr>
                <td>所在镇村组编号</td><td><form:input readonly="true" style="width:150px;height:24px;" path="region_no"/></td>
                <td>所在镇村组</td><td><form:input path="region" class="easyui-combotree tree-city" style="width:150px;height:24px;" data-options="url:'/mobile/region/getRoot',method:'get',required:true" /></td>
            </tr>
            <tr>
                <td>姓名</td><td><form:input class="easyui-validatebox" validType="CHS" style="width:150px;height:24px;" required="required" path="name"/></td>
                <td>性别</td>
                <td>
                    <form:select class="easyui-combobox" style="width:150px;height:24px;"  path="sex" >
                        <form:option value="男">男</form:option>
                        <form:option value="女">女</form:option>
                    </form:select>
                </td>
            </tr>
            <tr>
                <td>年龄</td><td><form:input class="easyui-numberbox" required="required" data-options="min:0" path="age"/></td>
                <td>家庭人口</td><td><form:input class="easyui-numberbox" required="required" data-options="min:0" path="familypopulation"/></td>
            </tr>
            <tr>
                <td>座机</td><td><form:input style="width:150px;height:24px;" path="contact_landline"/></td>
                <td>手机</td><td><form:input style="width:150px;height:24px;" path="contact_phone"/></td>
            </tr>
            <tr>
                <td>水田</td><td><form:input class="easyui-numberbox" data-options="precision:2"  path="contract_paddyfield"/></td>
                <td>水田中流转</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="contract_paddyfield_exchange"/></td>
            </tr>
            <tr>
                <td>旱地</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="contract_dryfield"/></td>
                <td>旱地中流转</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="contract_dryfield_exchange"/></td>
            </tr>
            <tr>
                <td>合计</td><td><form:input class="easyui-numberbox" readonly="true" data-options="precision:2" path="contract_total"/></td>
                <td>流转合计</td><td><form:input class="easyui-numberbox" readonly="true" data-options="precision:2" path="contract_total_exchange"/></td>
            </tr>
            <tr>
                <td>小麦</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_xiaomai"/></td>
                <td>马铃薯</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_malingshu"/></td>
            </tr>
            <tr>
                <td>油菜籽</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_youcaizi"/></td>
                <td>中稻</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_zhongdao"/></td>
            </tr>
            <tr>
                <td>晚稻</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_wandao"/></td>
                <td>玉米</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_yumi"/></td>
            </tr>
            <tr>
                <td>大豆</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_dadou"/></td>
                <td>红薯</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_hongshu"/></td>
            </tr>
            <tr>
                <td>棉花</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_mianhua"/></td>
                <td>花生</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_huasheng"/></td>
            </tr>
            <tr>
                <td>芝麻</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_zhima"/></td>
                <td>设施蔬菜</td><td><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_vegetable_facility"/></td>
            </tr>
            <tr>
                <td>露天蔬菜</td><td colspan="3"><form:input class="easyui-numberbox" data-options="precision:2" path="plantingarea_vegetables_outdoors"/></td>
            </tr>
            <tr>
                <td>备注</td><td colspan="3"><form:textarea style="width:600px;height:80px;"   path="note"/></td>
            </tr>
            <tr>
                <td>标志</td>
                <td>
                    <form:select class="easyui-combobox" style="width:150px;height:24px;"  path="" >
                        <form:option value="10">在线</form:option>
                        <form:option value="21">死亡注销</form:option>
                        <form:option value="22">资格取消</form:option>
                    </form:select>
                </td>
                <td>门牌号</td><td><form:input  path="house_no"/></td>
            </tr>
            <tr>
                <td>邮编</td><td><form:input path="zip_code"/></td>
                <td>民族</td><td><form:input  path="nation"/></td>
            </tr>
            <tr>
                <td>文化程度</td><td><form:input  path="education"/></td>
                <td>政治面貌</td><td><form:input  path="political_affiliation"/></td>
            </tr>
            <tr>
                <td>是否参加社保</td>
                <td>
                    <form:select class="easyui-combobox" style="width:150px;height:24px;" path="insurance">
                        <form:option value="0">是</form:option>
                        <form:option value="1">否</form:option>
                    </form:select>
               </td>
                <td>创建时间</td><td><form:input class="easyui-datebox" style="width:150px;height:24px;" path="create_date"/></td>
            </tr>
            <tr>
                <td>录入信息日期</td><td><form:input class="easyui-datebox" style="width:150px;height:24px;" path="record_date"/></td>
                <td>修改信息日期</td><td><form:input class="easyui-datebox" style="width:150px;height:24px;" path="update_date"/></td>
            </tr>
            <tr>
                <td>录入人员</td><td><form:input class="easyui-validatebox" required="required" path="record_person"/></td>
                <td>修改人员</td><td><form:input class="easyui-validatebox" required="required" path="update_person"/></td>
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
                if($("#FarmerForm").form('validate')){
                    $.ajax({
                        cache: false,
                        type: "POST",
                        url: "/mobile/manage/farmerAdd",
                        data: $('#FarmerForm').serialize(),
                        async: false,
                        error: function (XMLHttpRequest) {
                            alert("error:" + XMLHttpRequest.status);
                        },
                        success: function (data) {
                            if(data.message != null) alert(data.message);
                            if(data.url != null) window.location.href = data.url;
                        }
                    });
                }
            });
        });
    </script>
</div>
</body>
</html>
