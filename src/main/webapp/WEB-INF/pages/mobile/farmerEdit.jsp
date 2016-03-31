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
    <script type="text/javascript" src="/mobile/js/jquery.js"></script>
    <script type="text/javascript" src="/mobile/js/jquery.idTabs.min.js"></script>
    <script type="text/javascript" src="/mobile/kindeditor/kindeditor-min.js"></script>
    <script type="text/javascript" src="/mobile/kindeditor/lang/zh_CN.js"></script>
    <script type="text/javascript" src="/mobile/laydate/laydate.js"></script>

    <script type="text/javascript">
        KindEditor.ready(function (K) {
            K.create("#note", {
                afterBlur: function () {
                    this.sync();
                }
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
        <form:hidden path="id"/>
        <div id="usual1" class="usual">

            <div class="itab">
                <ul>
                    <li><a href="#tab1" class="selected">基本信息</a></li>
                    <li><a href="#tab2">联系方式</a></li>
                    <li><a href="#tab3">承包地面积</a></li>
                    <li><a href="#tab4">常年农作物种植面积</a></li>
                    <li><a href="#tab5">其他</a></li>

                </ul>
            </div>

            <div id="tab1" class="tabson"><%--联系方式--%>

                <div class="formtext">Hi，<b>admin</b>，欢迎您试用信息发布功能！</div>

                <ul class="forminfo">
                    <%--<li>
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
                    </li>--%>
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
                    <%--<li><label>职位名称<b>*</b></label>--%>


                    <%--<div class="vocation">--%>
                    <%--<div class='diy_select'>--%>
                    <%--<input type='hidden' name='' class='diy_select_input'/>--%>
                    <%--<div class='diy_select_txt'>--请选择--</div>--%>
                    <%--<div class='diy_select_btn'></div>--%>
                    <%--<ul class='diy_select_list'>--%>
                    <%--<li>UI设计师</li>--%>
                    <%--<li>交互设计师</li>--%>
                    <%--<li>前端设计师</li>--%>
                    <%--<li>网页设计师</li>--%>
                    <%--<li>Flash动画</li>--%>
                    <%--<li>视觉设计师</li>--%>
                    <%--<li>插画设计师</li>--%>
                    <%--<li>美工</li>--%>
                    <%--<li>其他</li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <%--</li>--%>

                    <%--<li><label>薪资待遇<b>*</b></label>--%>

                    <%--<div class="vocation">--%>
                    <%--<div class='diy_select'>--%>
                    <%--<input type='hidden' name='' class='diy_select_input'/>--%>
                    <%--<div class='diy_select_txt'>--请选择--</div>--%>
                    <%--<div class='diy_select_btn'></div>--%>
                    <%--<ul class='diy_select_list'>--%>
                    <%--<li>3000-5000</li>--%>
                    <%--<li>5000-8000</li>--%>
                    <%--<li>8000-10000</li>--%>
                    <%--<li>10000-15000</li>--%>
                    <%--</ul>--%>
                    <%--</div>--%>
                    <%--</div>--%>
                    <%--</li>--%>

                    <%--<li><label>通知内容<b>*</b></label>--%>


                    <%--<textarea id="content7" name="content" style="width:700px;height:250px;visibility:hidden;"></textarea>--%>

                    <%--</li>--%>
                    <%--<li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(1)').click()" class="btn" value="下一步"/></li>--%>
                    <%--</ul>--%>


            </div>


            <div id="tab2" class="tabson"><%--联系方式--%>
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
            <div id="tab3" class="tabson"><%--承包地面积--%>
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

            <div id="tab4" class="tabson"><%--常年农作物种植面积--%>
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
            <div id="tab5" class="tabson"><%--其他--%>
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


        </div>
    </form:form>

    <%--此乃登陆代码--%>
    <script type="text/javascript">
        $(function () {
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
        });
    </script>
    <%--激活tab面板--%>
    <script type="text/javascript">
        $("#usual1 ul").idTabs();
    </script>
    <%--列表js虽然现在删除了列表--%>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
    <%--选择器js--%>
    <script type="text/javascript" src="/mobile/js/diy_select.js"></script>
    <script type="text/javascript">
        var TTDiy_select = new diy_select({  //参数可选
            TTContainer: 'diy_select',//控件的class
            TTDiy_select_input: 'diy_select_input',//用于提交表单的class
            TTDiy_select_txt: 'diy_select_txt',//diy_select用于显示当前选中内容的容器class
            TTDiy_select_btn: 'diy_select_btn',//diy_select的打开按钮
            TTDiv_select_list: 'diy_select_list',//要显示的下拉框内容列表class
            TTFcous: 'focus'//得到焦点时的class
        });//如同时使用多个时请保持各class一致.
    </script>
</div>
</body>
</html>
