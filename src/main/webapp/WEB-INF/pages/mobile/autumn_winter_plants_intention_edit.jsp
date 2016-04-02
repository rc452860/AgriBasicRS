<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-04-02
  Time: 22:01
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
    <li><a href="#">秋冬作物播种面积意向</a></li>
    <li><a href="#">修改调查信息</a></li>
  </ul>
</div>

<div class="formbody">

  <form:form commandName="AutumnWinterPlantsIntentionForm">
    <form:hidden path="autumnWinterPlantsIntention.id"/>
    <div id="usual1" class="usual">

      <div class="itab">
        <ul>
          <li><a href="#tab1" class="selected">基本信息</a></li>
        </ul>
      </div>

      <div id="tab1" class="tabson"><%--联系方式--%>
        <ul class="forminfo">
          <li><label>调查表编号<b>*</b></label><form:input path="autumnWinterPlantsIntention.registration_form_id" name="" type="text" class="dfinput" value=""
                                                      style="width:518px;"/></li>
          <li><label>农户id<b>*</b></label><form:input path="autumnWinterPlantsIntention.farmer_id" name="" type="text" class="dfinput" value=""
                                                     style="width:518px;"/></li>
          <li><label>播种总面积<b>*</b></label><form:input path="autumnWinterPlantsIntention.plant_total" name="" type="text" class="dfinput" value=""
                                                      style="width:518px;"/></li>

          <li><label>粮食合计<b>*</b></label><form:input path="autumnWinterPlantsIntention.food_total" name="" type="text" class="dfinput" value=""
                                                     style="width:518px;"/></li>

          <li><label>谷物<b>*</b></label><form:input path="autumnWinterPlantsIntention.food_grain" name="" type="text" class="dfinput" value=""
                                                   style="width:518px;"/></li>
          <li><label>其中：冬小麦<b>*</b></label><form:input path="autumnWinterPlantsIntention.food_grain_dongxiaomai" name="" type="text" class="dfinput" value=""
                                                       style="width:518px;"/></li>

          <li><label>豆类 合计<b>*</b></label><form:input path="autumnWinterPlantsIntention.food_legume" name="" type="text" class="dfinput" value=""
                                                      style="width:518px;"/></li>

          <li><label>薯类 合计<b>*</b></label><form:input path="autumnWinterPlantsIntention.food_potato" name="" type="text" class="dfinput" value=""
                                                      style="width:518px;"/></li>

          <li><label>油料作物<b>*</b></label><form:input path="autumnWinterPlantsIntention.oilplant_total" name="" type="text" class="dfinput" value=""
                                                     style="width:518px;"/></li>
          <li><label>其中：油菜籽<b>*</b></label><form:input path="autumnWinterPlantsIntention.oilplant_youcaizi" name="" type="text" class="dfinput" value=""
                                                       style="width:518px;"/></li>

          <li><label>蔬菜<b>*</b></label><form:input path="autumnWinterPlantsIntention.vegetables_total" name="" type="text" class="dfinput" value=""
                                                   style="width:518px;"/></li>

          <li><label>其他作物<b>*</b></label><form:input path="autumnWinterPlantsIntention.otherplant_total" name="" type="text" class="dfinput" value=""
                                                     style="width:518px;"/></li>
          <li><label>其中：青饲料<b>*</b></label><form:input path="autumnWinterPlantsIntention.otherplant_qingsiliaol" name="" type="text" class="dfinput" value=""
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
          url: "/mobile/autumnWinterPlantsIntention/edit",
          data: $('#AutumnWinterPlantsIntentionForm').serialize(),
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
