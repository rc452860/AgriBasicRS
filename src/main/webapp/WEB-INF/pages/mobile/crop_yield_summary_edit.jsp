<%--
  Created by IntelliJ IDEA.
  User: Edifi_000
  Date: 2016-04-04
  Time: 22:55
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
  <c:import url="references.jsp"></c:import>


</head>

<body>


<div class="place">
  <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">农作物产量调查汇总表</a></li>
    <li><a href="#">修改调查信息</a></li>
  </ul>
</div>

<div class="formbody">

  <form:form commandName="CropYieldSummaryForm">
    <form:hidden path="cropYieldSummary.id"/>
	<form:hidden path="cropYieldSummary.total_of_fifteen_itemid"/>
    <form:hidden path="cropYieldSummary.simple_average_itemid"/>
	<form:hidden path="cropYieldSummary.list_itemid"/>
    <form:hidden path="total_of_fifteen_item.id"/>
    <form:hidden path="simple_average_item.id"/>
	<form:hidden path="list_item[0].id"/>
	<form:hidden path="list_item[1].id"/>
	<form:hidden path="list_item[2].id"/>
	<form:hidden path="list_item[3].id"/>
	<form:hidden path="list_item[4].id"/>
	<form:hidden path="list_item[5].id"/>
	<form:hidden path="list_item[6].id"/>
	<form:hidden path="list_item[7].id"/>
	<form:hidden path="list_item[8].id"/>
	<form:hidden path="list_item[9].id"/>
	<form:hidden path="list_item[10].id"/>
	<form:hidden path="list_item[11].id"/>
	<form:hidden path="list_item[12].id"/>
	<form:hidden path="list_item[13].id"/>
	<form:hidden path="list_item[14].id"/>
    <table class="form-add" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="3">调查表编号</td><td colspan="5"><form:input class="easyui-combobox" required="true" data-options="url:'/mobile/registrationForm/selectJsonB',
					method:'get',
					valueField:'id',
					textField:'text',
					panelHeight:'auto'" path="cropYieldSummary.registration_form_id"/></td>
      </tr>
      <tr>
        <td colspan="3">作物名称</td><td colspan="5"><form:input  path="cropYieldSummary.corp_name"/></td>
      </tr>

      <!--15基点户合计-->
      <tr>
        <td colspan="2">
        <td colspan="3">本年预计</td>
        <td colspan="3">上年实际</td>
      </tr>
      <tr>
        <td colspan="2">
        <td>播种面积（亩）</td>
        <td>单产（公斤/亩）</td>
        <td>总产量（吨）</td>
        <td>播种面积（亩）</td>
        <td>单产（公斤/亩）</td>
        <td>总产量（吨）</td>
      </tr>
      <!--15基点户合计-->
      <tr>
        <td colspan="2">15基点户合计</td>
        <td><form:input  path="total_of_fifteen_item.seededarea_thisyear"/></td>
        <td><form:input  path="total_of_fifteen_item.perunit_thisyear"/></td>
        <td><form:input  path="total_of_fifteen_item.total_thisyear"/></td>
        <td><form:input  path="total_of_fifteen_item.seededarea_lastyear"/></td>
        <td><form:input  path="total_of_fifteen_item.perunit_lastyear"/></td>
        <td><form:input  path="total_of_fifteen_item.total_lastyear"/></td>
      </tr>

      <!--15基点户-->
      <tr>
        <td colspan="2">15基点户</td>
        <td><form:input  path="list_item[0].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[0].perunit_thisyear"/></td>
        <td><form:input  path="list_item[0].total_thisyear"/></td>
        <td><form:input  path="list_item[0].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[0].perunit_lastyear"/></td>
        <td><form:input  path="list_item[0].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[1].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[1].perunit_thisyear"/></td>
        <td><form:input  path="list_item[1].total_thisyear"/></td>
        <td><form:input  path="list_item[1].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[1].perunit_lastyear"/></td>
        <td><form:input  path="list_item[1].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[2].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[2].perunit_thisyear"/></td>
        <td><form:input  path="list_item[2].total_thisyear"/></td>
        <td><form:input  path="list_item[2].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[2].perunit_lastyear"/></td>
        <td><form:input  path="list_item[2].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[3].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[3].perunit_thisyear"/></td>
        <td><form:input  path="list_item[3].total_thisyear"/></td>
        <td><form:input  path="list_item[3].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[3].perunit_lastyear"/></td>
        <td><form:input  path="list_item[3].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[4].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[4].perunit_thisyear"/></td>
        <td><form:input  path="list_item[4].total_thisyear"/></td>
        <td><form:input  path="list_item[4].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[4].perunit_lastyear"/></td>
        <td><form:input  path="list_item[4].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[5].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[5].perunit_thisyear"/></td>
        <td><form:input  path="list_item[5].total_thisyear"/></td>
        <td><form:input  path="list_item[5].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[5].perunit_lastyear"/></td>
        <td><form:input  path="list_item[5].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[6].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[6].perunit_thisyear"/></td>
        <td><form:input  path="list_item[6].total_thisyear"/></td>
        <td><form:input  path="list_item[6].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[6].perunit_lastyear"/></td>
        <td><form:input  path="list_item[6].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[7].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[7].perunit_thisyear"/></td>
        <td><form:input  path="list_item[7].total_thisyear"/></td>
        <td><form:input  path="list_item[7].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[7].perunit_lastyear"/></td>
        <td><form:input  path="list_item[7].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[8].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[8].perunit_thisyear"/></td>
        <td><form:input  path="list_item[8].total_thisyear"/></td>
        <td><form:input  path="list_item[8].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[8].perunit_lastyear"/></td>
        <td><form:input  path="list_item[8].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[9].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[9].perunit_thisyear"/></td>
        <td><form:input  path="list_item[9].total_thisyear"/></td>
        <td><form:input  path="list_item[9].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[9].perunit_lastyear"/></td>
        <td><form:input  path="list_item[9].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[10].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[10].perunit_thisyear"/></td>
        <td><form:input  path="list_item[10].total_thisyear"/></td>
        <td><form:input  path="list_item[10].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[10].perunit_lastyear"/></td>
        <td><form:input  path="list_item[10].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[11].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[11].perunit_thisyear"/></td>
        <td><form:input  path="list_item[11].total_thisyear"/></td>
        <td><form:input  path="list_item[11].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[11].perunit_lastyear"/></td>
        <td><form:input  path="list_item[11].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[12].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[12].perunit_thisyear"/></td>
        <td><form:input  path="list_item[12].total_thisyear"/></td>
        <td><form:input  path="list_item[12].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[12].perunit_lastyear"/></td>
        <td><form:input  path="list_item[12].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[13].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[13].perunit_thisyear"/></td>
        <td><form:input  path="list_item[13].total_thisyear"/></td>
        <td><form:input  path="list_item[13].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[13].perunit_lastyear"/></td>
        <td><form:input  path="list_item[13].total_lastyear"/></td>
      </tr>
      <tr>
        <td colspan="2"></td>
        <td><form:input  path="list_item[14].seededarea_thisyear"/></td>
        <td><form:input  path="list_item[14].perunit_thisyear"/></td>
        <td><form:input  path="list_item[14].total_thisyear"/></td>
        <td><form:input  path="list_item[14].seededarea_lastyear"/></td>
        <td><form:input  path="list_item[14].perunit_lastyear"/></td>
        <td><form:input  path="list_item[14].total_lastyear"/></td>
      </tr>

      <!--简单平均单产-->
      <tr>
        <td colspan="3">简单平均单产</td>
        <td><form:input  path="simple_average_item.perunit_thisyear"/></td>
        <td colspan="2"></td>
        <td><form:input  path="simple_average_item.perunit_lastyear"/></td>
        <td colspan="1"></td>
      </tr>

      <tr>
        <td align="center" colspan="6"><input name="" type="button" id="submit_button" value="提交"/>&nbsp;&nbsp;<input name="" type="reset" value="重置"/></td>
      </tr>
    </table>
  </form:form>

  <%--此乃登陆代码--%>
  <script type="text/javascript">
    $(function () {
      $('#submit_button').click(function () {
        $.ajax({
          cache: false,
          type: "POST",
          url: "/mobile/cropYieldSummary/edit",
          data: $('#CropYieldSummaryForm').serialize(),
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
