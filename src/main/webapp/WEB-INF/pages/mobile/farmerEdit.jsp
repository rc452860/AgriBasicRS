<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="Form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="/mobile/css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="/mobile/css/table.css">
    <script type="text/javascript" src="/mobile/js/jquery.js"></script>
    <script type="text/javascript" src="/mobile/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/mobile/kindeditor/kindeditor-min.js"></script>
    <script type="text/javascript" src="/mobile/kindeditor/lang/zh_CN.js"></script>
    <script type="text/javascript" src="/mobile/laydate/laydate.js"></script>

    <%--<script type="text/javascript">
        KindEditor.ready(function (K) {
            K.create("#note", {
                afterBlur: function () {
                    this.sync();
                }
            })
        })
    </script>--%>


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
        <form:hidden path="id"/>
        <table class="form-add" cellpadding="0" cellspacing="0">
                <%--<tr>
                    <td>testing</td>
                    <td colspan="3">
                        <input class="easyui-combotree validatebox-invalid" data-options="url:'/mobile/json/tree_test.json',method:'get',required:true" style="width:200px;height:24px;">
                    </td>
                </tr>--%>
            <tr>
                <td>序号</td><td><form:input required="required" path="no"/></td>
                <td>所在镇村组编号</td><td><form:input required="required" path="region_no"/></td>
            </tr>
            <tr>
                <td>所在镇村组</td><td><form:input class="easyui-validatebox" required="required" path="region"/></td>
                <td>姓名</td><td><form:input class="easyui-validatebox" validType="CHS" required="required" path="name"/></td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <form:select class="easyui-combobox" style="width:150px;height:24px;"  path="sex" >
                        <form:option value="男">男</form:option>
                        <form:option value="女">女</form:option>
                    </form:select>
                </td>
                <td>家庭人口</td><td><form:input class="easyui-numberbox" required="required" data-options="min:0" path="familypopulation"/></td>
            </tr>
            <tr>
                <td>座机</td><td><form:input  path="contact_landline"/></td>
                <td>手机</td><td><form:input  path="contact_phone"/></td>
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
                        <%--<div class='diy_select'>
                            <form:input type='hidden' path='flag' class='diy_select_input'/>
                            <div class='diy_select_txt'>--请选择--</div>
                            <div class='diy_select_btn'></div>
                            <ul class='diy_select_list'>
                                <li value="10">在线</li>
                                <li value="21">死亡注销</li>
                                <li value="22">资格取消</li>
                            </ul>
                        </div>--%>
                </td>
                <td>门牌号</td><td><form:input  path="house_no"/></td>
            </tr>
            <tr>
                <td>邮编</td><td><form:input class="easyui-validatebox" validType="zipcode" path="zip_code"/></td>
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
                        <%--<div class='diy_select'>
                            <form:input type='hidden' path='insurance' class='diy_select_input'/>
                           &lt;%&ndash; <div class='diy_select_txt'>--请选择--</div>
                            <div class='diy_select_btn'></div>
                            <ul class='diy_select_list'>

                            </ul>&ndash;%&gt;
                        </div>--%>
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
        <%--<div id="usual1" class="usual">

            <div class="itab">
                <ul>
                    <li><a href="#tab1" class="selected">基本信息</a></li>
                    <li><a href="#tab2">联系方式</a></li>
                    <li><a href="#tab3">承包地面积</a></li>
                    <li><a href="#tab4">常年农作物种植面积</a></li>
                    <li><a href="#tab5">其他</a></li>

                </ul>
            </div>

            <div id="tab1" class="tabson">&lt;%&ndash;联系方式&ndash;%&gt;

                <div class="formtext">Hi，<b>admin</b>，欢迎您试用信息发布功能！</div>

                <ul class="forminfo">
                    &lt;%&ndash;<li>
                        <label>调查表编号<b>*</b></label>
                        <div class='diy_select'>
                            <form:input type='hidden' path='registration_form_id' class='diy_select_input'/>
                            <div class='diy_select_txt'>--请选择--</div>
                            <div class='diy_select_btn'></div>
                            <ul class='diy_select_list'>
                                <li select="true" value="0">是</li>
                                <li value="1">否</li>
                            </ul>
                        </div>
                    </li>&ndash;%&gt;
                    <li><label>序号<b>*</b></label><form:input path="no" name="" type="text" class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>所在镇村组编号<b>*</b></label><form:input path="region_no" name="" type="text" class="dfinput"
                                                                  value="" style="width:518px;"/></li>
                    <li><label>所在镇村组<b>*</b></label><form:input path="region" name="" type="text" class="dfinput"
                                                                value="" style="width:518px;"/></li>
                    <li><label>姓名<b>*</b></label><form:input path="name" name="" type="text" class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>性别<b>*</b></label><form:input path="sex" name="" type="text" class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>家庭人口<b>*</b></label><form:input path="familypopulation" name="" type="text"
                                                               class="dfinput" value="" style="width:518px;"/></li>
                    <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(1)').click()"
                                                    class="btn" value="下一步"/></li>
                </ul>
                    &lt;%&ndash;<li><label>职位名称<b>*</b></label>&ndash;%&gt;


                    &lt;%&ndash;<div class="vocation">&ndash;%&gt;
                    &lt;%&ndash;<div class='diy_select'>&ndash;%&gt;
                    &lt;%&ndash;<input type='hidden' name='' class='diy_select_input'/>&ndash;%&gt;
                    &lt;%&ndash;<div class='diy_select_txt'>--请选择--</div>&ndash;%&gt;
                    &lt;%&ndash;<div class='diy_select_btn'></div>&ndash;%&gt;
                    &lt;%&ndash;<ul class='diy_select_list'>&ndash;%&gt;
                    &lt;%&ndash;<li>UI设计师</li>&ndash;%&gt;
                    &lt;%&ndash;<li>交互设计师</li>&ndash;%&gt;
                    &lt;%&ndash;<li>前端设计师</li>&ndash;%&gt;
                    &lt;%&ndash;<li>网页设计师</li>&ndash;%&gt;
                    &lt;%&ndash;<li>Flash动画</li>&ndash;%&gt;
                    &lt;%&ndash;<li>视觉设计师</li>&ndash;%&gt;
                    &lt;%&ndash;<li>插画设计师</li>&ndash;%&gt;
                    &lt;%&ndash;<li>美工</li>&ndash;%&gt;
                    &lt;%&ndash;<li>其他</li>&ndash;%&gt;
                    &lt;%&ndash;</ul>&ndash;%&gt;
                    &lt;%&ndash;</div>&ndash;%&gt;
                    &lt;%&ndash;</div>&ndash;%&gt;

                    &lt;%&ndash;</li>&ndash;%&gt;

                    &lt;%&ndash;<li><label>薪资待遇<b>*</b></label>&ndash;%&gt;

                    &lt;%&ndash;<div class="vocation">&ndash;%&gt;
                    &lt;%&ndash;<div class='diy_select'>&ndash;%&gt;
                    &lt;%&ndash;<input type='hidden' name='' class='diy_select_input'/>&ndash;%&gt;
                    &lt;%&ndash;<div class='diy_select_txt'>--请选择--</div>&ndash;%&gt;
                    &lt;%&ndash;<div class='diy_select_btn'></div>&ndash;%&gt;
                    &lt;%&ndash;<ul class='diy_select_list'>&ndash;%&gt;
                    &lt;%&ndash;<li>3000-5000</li>&ndash;%&gt;
                    &lt;%&ndash;<li>5000-8000</li>&ndash;%&gt;
                    &lt;%&ndash;<li>8000-10000</li>&ndash;%&gt;
                    &lt;%&ndash;<li>10000-15000</li>&ndash;%&gt;
                    &lt;%&ndash;</ul>&ndash;%&gt;
                    &lt;%&ndash;</div>&ndash;%&gt;
                    &lt;%&ndash;</div>&ndash;%&gt;
                    &lt;%&ndash;</li>&ndash;%&gt;

                    &lt;%&ndash;<li><label>通知内容<b>*</b></label>&ndash;%&gt;


                    &lt;%&ndash;<textarea id="content7" name="content" style="width:700px;height:250px;visibility:hidden;"></textarea>&ndash;%&gt;

                    &lt;%&ndash;</li>&ndash;%&gt;
                    &lt;%&ndash;<li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(1)').click()" class="btn" value="下一步"/></li>&ndash;%&gt;
                    &lt;%&ndash;</ul>&ndash;%&gt;


            </div>


            <div id="tab2" class="tabson">&lt;%&ndash;联系方式&ndash;%&gt;
                <ul class="forminfo">
                    <li><label>座机<b>*</b></label><form:input path="contact_landline" name="" type="text" class="dfinput"
                                                             value=""
                                                             style="width:518px;"/></li>

                    <li><label>手机<b>*</b></label><form:input path="contact_phone" name="" type="text" class="dfinput"
                                                             value=""
                                                             style="width:518px;"/></li>

                    <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(2)').click()"
                                                    class="btn" value="下一步"/></li>
                </ul>
            </div>
            <div id="tab3" class="tabson">&lt;%&ndash;承包地面积&ndash;%&gt;
                <ul class="forminfo">
                    <li><label>水田<b>*</b></label><form:input path="contract_paddyfield" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>水田中流转<b>*</b></label><form:input path="contract_paddyfield_exchange" name="" type="text"
                                                                class="dfinput" value=""
                                                                style="width:518px;"/></li>
                    <li><label>旱地<b>*</b></label><form:input path="contract_dryfield" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>旱地中流转<b>*</b></label><form:input path="contract_dryfield_exchange" name="" type="text"
                                                                class="dfinput" value=""
                                                                style="width:518px;"/></li>
                    <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(3)').click()"
                                                    class="btn" value="下一步"/></li>
                </ul>
            </div>

            <div id="tab4" class="tabson">&lt;%&ndash;常年农作物种植面积&ndash;%&gt;
                <ul class="forminfo">

                    <li><label>小麦<b>*</b></label><form:input path="plantingarea_xiaomai" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>马铃薯<b>*</b></label><form:input path="plantingarea_malingshu" name="" type="text"
                                                              class="dfinput" value=""
                                                              style="width:518px;"/></li>
                    <li><label>油菜籽<b>*</b></label><form:input path="plantingarea_youcaizi" name="" type="text"
                                                              class="dfinput" value=""
                                                              style="width:518px;"/></li>
                    <li><label>中稻<b>*</b></label><form:input path="plantingarea_zhongdao" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>晚稻<b>*</b></label><form:input path="plantingarea_wandao" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>

                    <li><label>玉米<b>*</b></label><form:input path="plantingarea_yumi" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>大豆<b>*</b></label><form:input path="plantingarea_dadou" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>红薯<b>*</b></label><form:input path="plantingarea_hongshu" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>棉花<b>*</b></label><form:input path="plantingarea_mianhua" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>花生<b>*</b></label><form:input path="plantingarea_huasheng" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>芝麻<b>*</b></label><form:input path="plantingarea_zhima" name="" type="text"
                                                             class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>设施蔬菜<b>*</b></label><form:input path="plantingarea_vegetable_facility" name=""
                                                               type="text" class="dfinput" value=""
                                                               style="width:518px;"/></li>
                    <li><label>露天蔬菜<b>*</b></label><form:input path="plantingarea_vegetables_outdoors" name=""
                                                               type="text" class="dfinput" value=""
                                                               style="width:518px;"/></li>
                    <li><label>备注<b>*</b></label><form:textarea path="note" id="note" name="" type="text"
                                                                class="dfinput" value=""
                                                                style="width:700px;height:250px;visibility:hidden;"/>
                    </li>
                    <li><label>标志<b>*</b></label>
                        <div class="vocation">
                            <div class='diy_select'>
                                <form:input type='hidden' path='flag' class='diy_select_input'/>
                                <div class='diy_select_txt'>--请选择--</div>
                                <div class='diy_select_btn'></div>
                                <ul class='diy_select_list'>
                                    <li value="10">在线</li>
                                    <li value="21">死亡注销</li>
                                    <li value="22">资格取消</li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(4)').click()"
                                                    class="btn" value="下一步"/></li>
                </ul>
            </div>
            <div id="tab5" class="tabson">&lt;%&ndash;其他&ndash;%&gt;
                <ul class="forminfo">

                    <li><label>门牌号<b>*</b></label><form:input path="house_no" name="" type="text" class="dfinput"
                                                              value=""
                                                              style="width:518px;"/></li>
                    <li><label>邮编<b>*</b></label><form:input path="zip_code" name="" type="text" class="dfinput"
                                                             value=""
                                                             style="width:518px;"/></li>
                    <li><label>民族<b>*</b></label><form:input path="nation" name="" type="text" class="dfinput" value=""
                                                             style="width:518px;"/></li>
                    <li><label>文化程度<b>*</b></label><form:input path="education" name="" type="text" class="dfinput"
                                                               value=""
                                                               style="width:518px;"/></li>
                    <li><label>政治面貌<b>*</b></label><form:input path="political_affiliation" name="" type="text"
                                                               class="dfinput" value=""
                                                               style="width:518px;"/></li>
                    <li><label>是否参加社保<b>*</b></label>
                        <div class="vocation">
                            <div class='diy_select'>
                                <form:input type='hidden' path='insurance' class='diy_select_input'/>
                                <div class='diy_select_txt'>--请选择--</div>
                                <div class='diy_select_btn'></div>
                                <ul class='diy_select_list'>
                                    <li select="true" value="0">是</li>
                                    <li value="1">否</li>
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li><label>创建时间<b>*</b></label><form:input path="create_date" name="" type="text" class="dfinput"
                                                               value=""
                                                               style="width:518px;" onclick="laydate()"/></li>
                    <li><label>录入信息日期<b>*</b></label><form:input path="record_date" name="" type="text" class="dfinput"
                                                                 value=""
                                                                 style="width:518px;" onclick="laydate()"/></li>
                    <li><label>修改信息日期<b>*</b></label><form:input path="update_date" name="" type="text" class="dfinput"
                                                                 value=""
                                                                 style="width:518px;" onclick="laydate()"/></li>
                    <li><label>录入人员<b>*</b></label><form:input path="record_person" name="" type="text" class="dfinput"
                                                               value=""
                                                               style="width:518px;"/></li>
                    <li><label>修改人员<b>*</b></label><form:input path="update_person" name="" type="text" class="dfinput"
                                                               value=""
                                                               style="width:518px;"/></li>
                    <li><label>&nbsp;</label><input type="button" id="submit_button" class="btn" value="提交"/></li>
                </ul>
            </div>


        </div>--%>
    </form:form>

    <%--此乃登陆代码--%>
    <script type="text/javascript">
        $(function () {
            if($("#FarmerForm").form('validate')) {
                $('#submit_button').click(function () {
                    $.ajax({
                        cache: false,
                        type: "POST",
                        url: "/mobile/manage/farmerEdit",
                        data: $('#FarmerForm').serialize(),
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
            }
        });
    </script>
</div>
</body>
</html>
