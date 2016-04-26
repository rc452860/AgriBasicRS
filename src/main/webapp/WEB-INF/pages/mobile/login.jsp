<%--
  Created by IntelliJ IDEA.
  User: rc452
  Date: 2016/3/22
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="src/main/webapp/mobile/css/css.css"/>
    <title>襄州区农业基点调查信息系统</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width"/>
    <%--script--%>
    <script type="text/javascript" src="/mobile/js/jquery.js"></script>
    <!--[if IE 6]>
    <script type="text/javascript" src="/mobile/js/DD_belatedPNG_0.0.8a-min.js" ></script>

    <script type="text/javascript">
        DD_belatedPNG.fix('.png');
    </script>

    <![endif]-->

    <%--style--%>
    <link rel="stylesheet" href="/mobile/css/reset.css"/>
    <link rel="stylesheet" href="/mobile/css/css.css"/>
    <link rel="stylesheet" href="/mobile/css/function.css"/>

</head>
<body class="b-0">
<div class="g-hd0 f-fs2 f-cb png">
        <span class="u-logo f-fl">
            欢迎登录后台管理界面平台
        </span>
        <span class="u-about f-fr">
            <a href="#">帮助</a>
            <a href="#">关于</a>
        </span>
</div>
<div class="g-md0 png">
    <span class="u-symbol png"></span>
    <div class="u-loginbox png">
        <ul>
           <form:form commandName="LoginForm">
               <li><form:input path="username" type="text" class="u-loginuser png" onclick="JavaScript:this.value=''" /></li>
               <li><form:input path="password" type="password" class="u-loginpwd png"  onclick="JavaScript:this.value=''" /></li>
               <%--<li class="u-yzm">--%>
                   <%--<span><input name="" type="text" value="验证码" onclick="JavaScript:this.value=''"></span><cite>X3D5S</cite>--%>
               <%--</li>--%>
               <li><input name="" type="button" class="u-loginbtn png" value="登录" id="submit_button"><label class="u-label0"><input name="" type="checkbox" value="" checked="checked">记住密码</label><label class="u-label0"><a href="#">忘记密码？</a></label></li>
           </form:form>
            <script type="text/javascript">
                $(function () {
                    $('#submit_button').click(function () {
                        $.ajax({
                            cache: false,
                            type: "POST",
                            url: "/mobile/login",
                            data: $('#LoginForm').serialize(),
                            async: false,
                            error: function (XMLHttpRequest) {
                                alert("error:" + XMLHttpRequest.status);
                            },
                            success: function (data) {
                                if(data.message != null) alert(data.message);
                                if(data.url != null) window.location.href = data.url;
                            }
                        });
                    });
                });
//                回车登陆
                $(document).keydown(function(evenet){
                    if(evenet.keyCode == 13){
                        $('#submit_button').click();
                    }
                })
            </script>

        </ul>
    </div>
</div>
<%--<div class="g-ft0 png f-fs2">
    版权所有  2014 <a href="#">blog.crysis.xyz</a> 若尘
</div>--%>
</body>
</html>
