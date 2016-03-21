<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<header class="page-header">
  <div class="navbar">
    <ul class="nav navbar-nav navbar-right pull-right">
      <li class="visible-phone-landscape">
        <a href="#" id="search-toggle">
          <i class="fa fa-search"></i>
        </a>
      </li>
      <li class="dropdown">
        <a href="#" title="Messages" id="messages"
           class="dropdown-toggle"
           data-toggle="dropdown">
          <i class="fa fa-comments"></i>
        </a>
        <ul id="messages-menu" class="dropdown-menu messages" role="menu">
          <li role="presentation">
            <a href="#" class="message">
              <img src="/mobile/img/1.jpg" alt="">
              <div class="details">
                <div class="sender">好友</div>
                <div class="text">
                  在吗？
                </div>
              </div>
            </a>
          </li>
          <li role="presentation">
            <a href="#" class="message">
              <img src="/mobile/img/2.jpg" alt="">
              <div class="details">
                <div class="sender">好友</div>
                <div class="text">
                  考试信息
                </div>
              </div>
            </a>
          </li>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" title="8 support tickets"
           class="dropdown-toggle"
           data-toggle="dropdown">
          <i class="fa fa-group"></i>
          <span class="count">8</span>
        </a>
        <ul id="support-menu" class="dropdown-menu support" role="menu">
          <li role="presentation">
            <a href="#" class="support-ticket">
              <div class="picture">
                <span class="label label-important"><i class="fa fa-bell-o"></i></span>
              </div>
              <div class="details">
                新考试
              </div>
            </a>
          </li>
          <li role="presentation">
            <a href="#" class="support-ticket">
              <div class="picture">
                <span class="label label-warning"><i class="fa fa-question-circle"></i></span>
              </div>
              <div class="details">
                考试结果
              </div>
            </a>
          </li>
        </ul>
      </li>
      <li class="divider"></li>
      <li class="hidden-xs dropdown">
        <a href="#" title="Account" id="account"
           class="dropdown-toggle"
           data-toggle="dropdown">
          <i class="fa fa-user"></i>
        </a>
        <ul id="account-menu" class="dropdown-menu account" role="menu">
          <li role="presentation" class="account-picture">
            <img src="/mobile/img/2.jpg" alt="">
            用户
          </li>
          <li role="presentation">
            <a href="form_account.html" class="link">
              <i class="fa fa-user"></i>
              资料
            </a>
          </li>
          <li role="presentation">
            <a href="component_calendar.html" class="link">
              <i class="fa fa-calendar"></i>
              通知
            </a>
          </li>
          <li role="presentation">
            <a href="#" class="link">
              <i class="fa fa-inbox"></i>
              消费明细
            </a>
          </li>
        </ul>
      </li>
      <li><a href="/mobile/logout"><i class="fa fa-sign-out"></i></a></li>
    </ul>
    <form id="search-form" class="navbar-form pull-right" role="search">
      <input type="search" class="form-control search-query" placeholder="搜索...">
    </form>
  </div>
</header>
