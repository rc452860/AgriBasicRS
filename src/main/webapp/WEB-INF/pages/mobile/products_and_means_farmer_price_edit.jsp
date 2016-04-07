<%--
  Created by IntelliJ IDEA.
  User: EdifierWill
  Date: 2016/4/3
  Time: 21:31
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
  <link rel="stylesheet" href="/mobile/css/table.css">
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
    <li><a href="#">主要农产品和农业生产资料价格监测旬报表(农民售价)</a></li>
    <li><a href="#">修改调查信息</a></li>
  </ul>
</div>

<div class="formbody">

  <form:form commandName="ProductsAndMeansFarmerPriceForm">
    <form:hidden path="productsAndMeansFarmerPrice.id"/>
    <table class="form-add" cellpadding="0" cellspacing="0">
      <tr>
        <td>调查表编号</td><td colspan="5"><form:input  path="productsAndMeansFarmerPrice.registration_form_id"/></td>
      </tr>
      <tr>
        <td>乡镇名称</td><td colspan="5"><form:input  path="productsAndMeansFarmerPrice.townships"/></td>
      </tr>
      <!--原粮-->
      <tr>
        <td colspan="6">原粮</td>
      </tr>
      <tr>
        <td>早籼稻</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_zaoxiandao"/></td>
        <td>中籼稻</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_zhongxiandao"/></td>
        <td>晚籼稻</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_wanxiandao"/></td>
      </tr>
      <tr>
        <td>粳稻</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_jingdao"/></td>
        <td>小麦</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_xiaomai"/></td>
        <td>玉米</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_yumi"/></td>
      </tr>
      <tr>
        <td>大豆</td><td><form:input  path="productsAndMeansFarmerPrice.raw_grain_dadou"/></td>
        <td colspan="4"></td>
      </tr>

      <!--经养产品-->
      <tr>
        <td colspan="6">经养产品</td>
      </tr>
      <tr>
        <td>带壳花生</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_daikehuasheng"/></td>
        <td>花生米</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_huashengmi"/></td>
        <td>油菜籽</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_youcaizi"/></td>
      </tr>
      <tr>
        <td>生猪</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_shengzhu"/></td>
        <td>仔猪</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_zaizhu"/></td>
        <td>活鸡</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_huoji"/></td>
      </tr>
      <tr>
        <td>鸡蛋</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_jidan"/></td>
        <td>籽棉</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_zimian"/></td>
        <td>甘蔗</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_ganze"/></td>
      </tr>
      <tr>
        <td>鲤鱼</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_liyu"/></td>
        <td>鲢鱼</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_lianyu"/></td>
        <td>草鱼</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_caoyu"/></td>
      </tr>
      <tr>
        <td>白菜</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_baicai"/></td>
        <td>西红柿</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_xihongshi"/></td>
        <td>黄瓜</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_huanggua"/></td>
      </tr>
      <tr>
        <td>菜椒</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_caijiao"/></td>
        <td>土豆</td><td><form:input  path="productsAndMeansFarmerPrice.raised_product_tudou"/></td>
        <td colspan="2"></td>
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
          url: "/mobile/productsAndMeansFarmerPrice/edit",
          data: $('#ProductsAndMeansFarmerPriceForm').serialize(),
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
