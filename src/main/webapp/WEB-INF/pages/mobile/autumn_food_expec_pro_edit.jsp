<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-03-31
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
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
    <li><a href="#">调查表修改</a></li>
  </ul>
</div>

<div class="formbody">
  <form:form commandName="AutumnFoodExpecProForm">
    <form:hidden path="autumnFoodExpecPro.id"/>
    <form:hidden path="autumnFoodExpecPro.food_itemid"/>
    <form:hidden path="autumnFoodExpecPro.food_zhongdaoyijidao_itemid"/>
    <form:hidden path="autumnFoodExpecPro.food_shuangjiwandao_itemid"/>
    <form:hidden path="autumnFoodExpecPro.food_yumi_itemid"/>
    <form:hidden path="autumnFoodExpecPro.food_dadou_itemid"/>
    <form:hidden path="autumnFoodExpecPro.rapeseed_itemid"/>
    <form:hidden path="autumnFoodExpecPro.rapeseed_huasheng_itemid"/>
    <form:hidden path="autumnFoodExpecPro.cotton_itemid"/>
    <form:hidden path="autumnFoodExpecPro.sugar_itemid"/>
    <div id="usual1" class="usual">

      <div class="itab">
        <ul>
          <li><a href="#tab1" class="selected">基本信息</a></li>
          <li><a href="#tab2">一、秋粮合计</a></li>
          <li><a href="#tab3">其中：中稻及一季稻</a></li>
          <li><a href="#tab4">双季晚稻</a></li>
          <li><a href="#tab5">玉米</a></li>
          <li><a href="#tab6">大豆</a></li>
          <li><a href="#tab7">二、油料</a></li>
          <li><a href="#tab8">其中：花生</a></li>
          <li><a href="#tab9">三、棉花</a></li>
          <li><a href="#tab10">四、糖料（甘蔗）</a></li>
        </ul>
      </div>

      <div id="tab1" class="tabson"><%--基本信息--%>

        <ul class="forminfo">
          <li><label>调查表编号<b>*</b></label><form:input path="autumnFoodExpecPro.registration_form_id" name="" type="text" class="dfinput" value=""
                                                      style="width:518px;"/></li>
          <li><label>调查村数<b>*</b></label><form:input path="autumnFoodExpecPro.survey_village_num" name="" type="text" class="dfinput" value=""
                                                     style="width:518px;"/></li>
          <li><label>调查户数<b>*</b></label><form:input path="autumnFoodExpecPro.survey_family_num" name="" type="text" class="dfinput" value=""
                                                     style="width:518px;"/></li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(1)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab2" class="tabson"><%--秋粮合计--%>
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(2)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab3" class="tabson"><%--其中：中稻及一季稻--%>
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_zhongdaoyijidao_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_zhongdaoyijidao_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_zhongdaoyijidao_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_zhongdaoyijidao_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(3)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab4" class="tabson"><%--双季晚稻--%>
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_shuangjiwandao_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_shuangjiwandao_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_shuangjiwandao_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_shuangjiwandao_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(4)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab5" class="tabson"><%--玉米--%>
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_yumi_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_yumi_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_yumi_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_yumi_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(5)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab6" class="tabson"><%--夏粮--%>
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_dadou_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_dadou_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="food_dadou_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="food_dadou_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(6)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab7" class="tabson"><%--油料--%>
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="rapeseed_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="rapeseed_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="rapeseed_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="rapeseed_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(7)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab8" class="tabson"><%--其中：花生--%>
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="rapeseed_huasheng_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="rapeseed_huasheng_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="rapeseed_huasheng_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="rapeseed_huasheng_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(8)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab9" class="tabson"><%--棉花--%>
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="cotton_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="cotton_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="cotton_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="cotton_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" onclick="$('.itab a:eq(9)').click()"
                                          class="btn" value="下一步"/></li>
        </ul>
      </div>
      <div id="tab10" class="tabson"><%--糖料(甘蔗)--%>
        <ul class="forminfo">
          <li>
            <div class="formbody">
              <div class="formtitle"><span>播种面积（亩）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="sugar_item.seededarea_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="sugar_item.seededarea_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li>
            <div class="formbody">
              <div class="formtitle"><span>总产量（吨）</span></div>
              <ul class="forminfo">
                <li><label>上年实际<b>*</b></label><form:input path="sugar_item.total_lastyear" name="" type="text" class="dfinput" value=""/></li>
                <li><label>本年预计<b>*</b></label><form:input path="sugar_item.total_thisyear" name="" type="text" class="dfinput" value=""/></li>
              </ul>
            </div>
          </li>
          <li><label>&nbsp;</label><input name="" type="button" id="submit_button" class="btn" value="提交"/></li>
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
          url: "/mobile/autumnFoodExpecPro/edit",
          data: $('#AutumnFoodExpecProForm').serialize(),
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
            /*console.log(item[j].getAttribute('select'))
             if (item[j].getAttribute('select') != null && This.ipt[i].value !=null) {
             This.t[i].innerHTML = item[j].innerHTML;
             This.ipt[i].value = item[j].getAttribute('value');
             }*/
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
      }
      ,
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
              //This.t[index].innerHTML = This.ipt[index].value = this.innerHTML.replace(/^\s+/, '').replace(/\s+&/, '');
              This.t[index].innerHTML = this.innerHTML.replace(/^\s+/, '').replace(/\s+&/, '');
              This.ipt[index].value = this.getAttribute('value');
              This.l[index].style.display = 'none';
            }
          }
        }
      }
      ,
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
      }
      ,

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
