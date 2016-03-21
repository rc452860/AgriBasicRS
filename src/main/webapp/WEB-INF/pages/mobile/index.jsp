<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<c:import url="head.jsp"/>
<div class="landing">
  <div class="container">
    <header class="page-header">
      <div class="navbar">
        <div class="logo pull-left">
          <h4><a href="/mobile/login">TST <strong>360</strong></a> <small>多维在线评测平台</small></h4>
        </div>
        <ul class="nav navbar-nav pull-right navbar-menu hidden-xs">
          <li class="active">
            <a href="#">
            </a>
          </li>
          <li>
            <a href="#about">
            </a>
          </li>
        </ul>
        <ul class="navbar-buttons pull-right">
          <li>
            <a href="/mobile/login" class="btn btn-sm btn-transparent">
              进入系统&nbsp;
              <i class="fa fa-arrow-right"></i>
            </a>
          </li>
          <li>
            <a href="/mobile/login"
               class="btn btn-sm btn-transparent">
              新用户注册&nbsp;
              <i class="fa fa-user"></i>
            </a>
          </li>
        </ul>
      </div>
    </header>
    <div class="content">
      <div id="carousel-landing" class="carousel slide carousel-landing carousel-fade">
        <ol class="carousel-indicators">
          <li data-target="#carousel-landing" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-landing" data-slide-to="1" class=""></li>
          <li data-target="#carousel-landing" data-slide-to="2" class=""></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <div class="row">
              <div class="col-xs-6">
                <div class="animated fadeInLeftBig">
                  <h1 class="slide-one-header"><strong>奥赛</strong> <br>权威训练题库</h1>
                  <p class="lead hidden-xs">
                    <strong>360</strong> 全方位测评
                  </p>
                  <p>
                    <a href="/mobile/login" class="btn btn-lg btn-white">
                      登录 &nbsp; <i class="fa fa-angle-right"></i>
                    </a>
                    <a href="/mobile/login"
                       class="btn btn-lg btn-transparent">
                      注册 &nbsp; <i class="fa fa-user"></i>
                    </a>
                  </p>
                </div>
              </div>
              <div class="col-xs-6">
                <div class="text-align-center animated fadeInRightBig">
                  <img src="img/jpeg/light-blue-preview-1.png" alt="Second slide">
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <h1 class="slide-two-header text-align-center animated fadeInDown">
              最权威 <strong>奥赛 </strong>训练题库
            </h1>
            <div class="row">
              <div class="col-xs-6">
                <div class="animated fadeInLeftBig">
                  <p>
                    <a href="/mobile/login">
                      <img src="img/jpeg/light-blue-laptop-transparent.png" alt=""/>
                    </a>
                  </p>
                  <p class="text-align-center">
                    <a href="/mobile/login" class="btn btn-transparent btn-lg btn-version-preview">
                      自我评测 &nbsp; <i class="fa fa-pencil"></i>
                    </a>
                  </p>
                </div>
              </div>
              <div class="col-xs-6">
                <div class="animated fadeInRightBig">
                  <p>
                    <a href="/mobile/login">
                      <img src="img/jpeg/light-blue-laptop-white.png" alt=""/>
                    </a>
                  </p>
                  <p class="text-align-center">
                    <a href="/mobile/login" class="btn btn-transparent btn-lg btn-version-preview">
                    <a href="/mobile/login" class="btn btn-transparent btn-lg btn-version-preview">
                      参加竞赛 &nbsp; <i class="fa fa-globe"></i>
                    </a>
                  </p>
                </div>
              </div>
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-xs-6">
                <div class="animated fadeInLeft">
                  <h1 class="slide-three-header">
                    <strong>考试</strong>
                    进行中
                  </h1>
                  <p>
                    <a href="" class="btn btn-white btn-lg" target="_blank">
                      立刻参与
                    </a>
                  </p>
                </div>
              </div>
              <div class="col-xs-6">
                <p class="animated fadeInUp" style="margin-top: 20px">
                  <img src="img/jpeg/light-blue-phone.png" alt=""/>
                </p>
              </div>
            </div>
          </div>
        </div>
        <a class="left carousel-control carousel-control-landing" href="#carousel-landing" data-slide="prev">
          <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control carousel-control-landing" href="#carousel-landing" data-slide="next">
          <span class="icon-next"></span>
        </a>
      </div>
    </div>
  </div>
</div>
<h5 class="thanks text-align-center">©1995-2015 TST 360, Inc. All rights reserved. </h5>
<c:import url="bottom.jsp"/>