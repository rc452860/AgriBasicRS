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

    <form:form commandName="FarmerForm">
        <table class="form-add" cellpadding="0" cellspacing="0">

            <tr>
                <td>序号</td><td><form:input class="easyui-validatebox" required="required" path="no"/></td>
                <td>所在镇村组编号</td><td><form:input readonly="true" path="region_no"/></td>
            </tr>
            <tr>
                <td>所在镇村组</td><td><form:input path="region" class="easyui-combotree tree-city" data-options="url:'/mobile/region/getRoot',method:'get',required:true" style="width:200px;height:24px;"/></td>
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
       <%-- <div id="usual1" class="usual">

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

                <ul class="forminfo">
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
                                    <li value="0">是</li>
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
                    <li><label>&nbsp;</label><input name="" type="button" id="submit_button" class="btn" value="提交"/></li>
                </ul>
            </div>


        </div>--%>
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
    <%--激活tab面板--%>
    <script type="text/javascript">
        $("#usual1 ul").idTabs();
    </script>
    <%--列表js虽然现在删除了列表--%>
    <script type="text/javascript">
        $('.tablelist tbody tr:odd').addClass('odd');
    </script>
    <%--选择器js--%>
    <script type="text/javascript">
        function diy_select() {
            this.init.apply(this, arguments)
        }
        ;
        diy_select.prototype = {
            init: function (opt) {
                this.setOpts(opt);
                this.o = this.getByClass(this.opt.TTContainer, document, 'div');//容器
                this.b = this.getByClass(this.opt.TTDiy_select_btn);//按钮
                this.t = this.getByClass(this.opt.TTDiy_select_txt);//显示
                this.l = this.getByClass(this.opt.TTDiv_select_list);//列表容器
                this.ipt = this.getByClass(this.opt.TTDiy_select_input);//列表容器
                this.lengths = this.o.length;
                this.showSelect();
            },
            addClass: function (o, s)//添加class
            {
                o.className = o.className ? o.className + ' ' + s : s;
            },
            removeClass: function (o, st)//删除class
            {
                var reg = new RegExp('\\b' + st + '\\b');
                o.className = o.className ? o.className.replace(reg, '') : '';
            },
            addEvent: function (o, t, fn)//注册事件
            {
                return o.addEventListener ? o.addEventListener(t, fn, false) : o.attachEvent('on' + t, fn);
            },
            showSelect: function ()//显示下拉框列表
            {
                var This = this;
                var iNow = 0;
                for (var i = 0; i < this.lengths; i++) {
                    var item = This.l[i].getElementsByTagName('li');
                    for (var j = 0; j < item.length; j++) {
                        if(This.ipt[i].value == item[j].getAttribute('value')){
                            This.t[i].innerHTML = item[j].innerHTML;
                        }
                    }
                }

                this.addEvent(document, 'click', function () {
                    for (var i = 0; i < This.lengths; i++) {
                        This.l[i].style.display = 'none';
                    }
                })
                for (var i = 0; i < this.lengths; i++) {
                    this.l[i].index = this.b[i].index = this.t[i].index = i;
                    this.t[i].onclick = this.b[i].onclick = function (ev) {
                        var e = window.event || ev;
                        var index = this.index;
                        This.item = This.l[index].getElementsByTagName('li');

                        This.l[index].style.display = This.l[index].style.display == 'block' ? 'none' : 'block';
                        This.o[index].style.zIndex = '999'

                        for (var j = 0; j < This.lengths; j++) {
                            if (j != index) {
                                This.l[j].style.display = 'none';


                                This.o[j].style.zIndex = '1'
                            }
                        }
                        This.addClick(This.item);
                        e.stopPropagation ? e.stopPropagation() : (e.cancelBubble = true); //阻止冒泡
                    }
                }
            },
            addClick: function (o)//点击回调函数
            {

                if (o.length > 0) {
                    var This = this;
                    for (var i = 0; i < o.length; i++) {
                        o[i].onmouseover = function () {
                            This.addClass(this, This.opt.TTFcous);
                        }
                        o[i].onmouseout = function () {
                            This.removeClass(this, This.opt.TTFcous);
                        }
                        o[i].onclick = function () {
                            var index = this.parentNode.index;//获得列表
                            This.t[index].innerHTML = this.innerHTML.replace(/^\s+/, '').replace(/\s+&/, '');
                            This.ipt[index].value = this.getAttribute('value');
                            This.l[index].style.display = 'none';
                        }
                    }
                }
            },
            getByClass: function (s, p, t)//使用class获取元素
            {
                var reg = new RegExp('\\b' + s + '\\b');
                var aResult = [];
                var aElement = (p || document).getElementsByTagName(t || '*');

                for (var i = 0; i < aElement.length; i++) {
                    if (reg.test(aElement[i].className)) {
                        aResult.push(aElement[i])
                    }
                }
                return aResult;
            },

            setOpts: function (opt) //以下参数可以不设置  //设置参数
            {
                this.opt = {
                    TTContainer: 'diy_select',//控件的class
                    TTDiy_select_input: 'diy_select_input',//用于提交表单的class
                    TTDiy_select_txt: 'diy_select_txt',//diy_select用于显示当前选中内容的容器class
                    TTDiy_select_btn: 'diy_select_btn',//diy_select的打开按钮
                    TTDiv_select_list: 'diy_select_list',//要显示的下拉框内容列表class
                    TTFcous: 'focus'//得到焦点时的class
                }
                for (var a in opt)  //赋值 ,请保持正确,没有准确判断的
                {
                    this.opt[a] = opt[a] ? opt[a] : this.opt[a];
                }
            }
        }


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
