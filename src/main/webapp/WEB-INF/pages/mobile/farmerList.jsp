<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="/mobile/css/style.css" rel="stylesheet"/>
    <script type="text/javascript" src="/mobile/js/jquery.js"></script>
    <style>
        .seachform1 .diy_select, .seachform2 .diy_select, .diy_select_txt {
            width: 150px;
            margin: 0;
            height: 34px;;
        }

    </style>
    <script type="text/javascript">
        function Delete(id) {/*删除脚本*/
            $.ajax({
                cache: false,
                type: "POST",
                url: "/mobile/manage/farmerDelete", /*此处需修改*/
                data: {'id': id},
                async: false,
                error: function (XMLHttpRequest) {
                    alert("error:" + XMLHttpRequest.status);
                },
                success: function (data) {
                    if (data.message != null) alert(data.message);
                    /*if(data.url != null) window.location.href = data.url;*/
                    if (data.message == "删除成功")
                        window.location.reload();
                }
            });
        }
        function DeleteMulit() {
            var arr = new Array();
            $(".ctr:checked").each(function () {
                arr.push($(this).val())
            });
            console.log(arr)
            $.ajax({
                cache: false,
                type: "POST",
                url: "/mobile/manage/farmerDeleteMulit", /*此处需修改*/
                data: {ids: arr},
                async: false,
                error: function (XMLHttpRequest) {
                    alert("error:" + XMLHttpRequest.status);
                },
                success: function (data) {
                    if (data.message != null) alert(data.message);
                    /*if(data.url != null) window.location.href = data.url;*/
                    if (data.message == "删除成功")
                        window.location.reload();
                }
            });
        }
        $(function () {
            $("#ctrall").click(function () {
                $(".ctr").attr("checked", $(this).attr("checked") != null);
            })
        })
        function search(){

            var url = window.location.pathname;
            url = $("input[name=name]").val() == ''?url:addParam(url,'name',$('input[name=name]').val());
            url = $("input[name=telphone]").val() == ''?url:addParam(url,'telphone',$('input[name=telphone]').val());
            url = $("input[name=village]").val() == ''?url:addParam(url,'village',$('input[name=village]').val());
            window.location.href = url;
        }
        function addParam(url,key,value){
            if(url.search(/\?/) == -1)
                    url+='?';
            var patternTemp = "var re = /("+key+"=)(.*?)(&)/";
            eval(patternTemp);
            if(re.test(url))
                    url.replace(re,"$1"+patternTemp+"&");
            else
                   url += (url[url.length-1] == '&' || url[url.length-1] == "?")?key+"="+value+"&":"&"+key+"="+value+"&";

            return url;
        }
    </script>
    <%--分页插件--%>
    <link rel="stylesheet" href="/mobile/css/pagination.css">
    <script type="text/javascript" src="/mobile/js/jquery.pagination.min.js"></script>
</head>


<body>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">农户基本信息</a></li>
        <li><a href="#">农户基本信息列表</a></li>
    </ul>
</div>

<div class="rightinfo">

    <div class="tools">

        <ul class="toolbar">
            <li onclick="window.location.href='/mobile/manage/farmerAdd'" class="click"> <span><img src="/mobile/img/t01.png"/></span>添加</li>
            <li onclick="DeleteMulit()"><span><img src="/mobile/img/t03.png"/></span>删除</li>
        </ul>


    </div>
    <ul class="seachform1 clearfix">
        <li><label>姓名:</label><input name="name" type="text" class="scinput1"/></li>
        <li><label>电话:</label><input name="telphone" type="text" class="scinput1"/></li>
        <li><label>村子:</label><input name="village" type="text" class="scinput1"/></li>
    </ul>

    <%--<ul class="seachform2 clearfix">

        <li><label>项目编号</label><input name="" type="text" class="scinput1" /></li>
        <li><label>项目类型</label>
            <div class="vocation">
                <div class='diy_select'>
                    <input type='hidden' name='flag' class='diy_select_input'/>
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

        <li><label>项目领域</label>
            <div class="vocation">
                <div class='diy_select'>
                    <input type='hidden' name='flag' class='diy_select_input'/>
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

        <li><label>立项部门</label><input name="" type="text" class="scinput1" /></li>
        <li><label>经费范围</label><input name="" type="text" class="scinput1" /></li>
        <li><label>一</label><input name="" type="text" class="scinput1" /></li>
        <li><label>负责人</label><input name="" type="text" class="scinput1" /></li>
        <li><label>立项时间</label><input name="" type="text" class="scinput1" /></li>
        <li><label>一</label><input name="" type="text" class="scinput1" /></li>


    </ul>--%>

    <ul class="seachform1 clearfix">
        <li class="sarchbtn">
            <label>&nbsp;</label>
            <input name="" type="button" onclick="search()" id="search-button" class="scbtn" value="查询"/>
            <%--<input name=""  type="button" class="scbtn1" value="更多条件"/>--%>
            <input name="" type="button" class="scbtn2" value="导出"/></li>
    </ul>
<%--
    <script type="text/javascript">
        $(document).ready(function () {
            $(".scbtn1").click(function () {
                $(".seachform2").toggle(200);
            });
        });--%>
    </script>
    <div class="formtitle clearfix"><span>农户基本信息列表</span></div>
    <table class="tablelist">
        <thead>
        <tr>
            <th><input name="" type="checkbox" id="ctrall" value=""/></th>
            <%--<th>编号<i class="sort"><img src="/mobile/img/px.gif"/></i></th>--%>
            <th>所在镇村组编号</th>
            <th>所在镇村组</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>家庭人口</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${list}">

            <tr>
                <td><input class="ctr" name="" type="checkbox" value="${item.id}"/></td>
                <td>${item.region_no}</td>
                <td>${item.region}</td>
                <td>${item.name}</td>
                <td>${item.sex}</td>
                <td>${item.age}</td>
                <td>${item.familypopulation}</td>
                <td><a href="/mobile/manage/farmerEdit?id=${item.id}" class="tablelink">修改/查看</a> <a
                        href="javascript:Delete('${item.id}')" class="tablelink"> 删除</a></td>

            </tr>
        </c:forEach>
        </tbody>
    </table>


    <div class="pagin">
        <div class="message">共<i class="blue">${count}</i>条记录，当前显示第&nbsp;<i class="blue">${index}</i>页</div>
        <div id="pageGro" class="cb">

        </div>
        <script type="text/javascript">/*分页插件*/
        $('#pageGro').pagination({
            coping: true,
            homePage: '首页',
            endPage: '末页',
            prevContent: '上页',
            nextContent: '下页',
            current:${index},
            pageCount:${countpage},
            callback: function (index) {
                window.location.href = "/mobile/manage/farmerList?page=" + index;
            }
        });
        </script>
    </div>

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


<script type="text/javascript">
    $('.tablelist tbody tr:odd').addClass('odd');


</script>

</body>

</html>