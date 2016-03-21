<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>

<div class="side-menu hidden-xs">
    <h4 class="page-title">个人中心
        <small>Personal Center</small>
    </h4>
    <section class="widget"
             data-widgster-load="server/php/widgets/shares.php">
        <div class="list-group list-group-lg">
            <a href="/mobile/user/info" class="list-group-item"><i class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">个人信息</h5>
            </a>
            <a href="/mobile/examine/public_list/0" class="list-group-item"><i
                    class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">考试列表</h5>
            </a>
            <a href="/mobile/examine/my_list/0" class="list-group-item"><i class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">我的考试</h5>
            </a>
        </div>
    </section>
    <h4 class="page-title">用户管理
        <small>Personal Center</small>
    </h4>
    <section class="widget"
             data-widgster-load="server/php/widgets/shares.php">
        <div class="list-group list-group-lg">
            <a href="/mobile/user/add" class="list-group-item"><i class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">新增用户</h5>
            </a>
            <a href="/mobile/user/list/0" class="list-group-item"><i class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">用户列表</h5>
            </a>
        </div>
    </section>
    <h4 class="page-title">考试管理
        <small>Personal Center</small>
    </h4>
    <section class="widget"
             data-widgster-load="server/php/widgets/shares.php">
        <div class="list-group list-group-lg">
            <a href="/mobile/question/add" class="list-group-item"><i class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">新增试题</h5>
            </a>
            <a href="/mobile/question/list/0" class="list-group-item"><i class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">试题列表</h5>
            </a>
            <a href="/mobile/examine/add" class="list-group-item"><i class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">新增考试</h5>
            </a>
            <a href="/mobile/examine/list/0" class="list-group-item"><i class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">考试列表</h5>
            </a>
            <a href="/mobile/knowledge/add" class="list-group-item"><i class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">新增知识点</h5>
            </a>
            <a href="/mobile/knowledge/list/0" class="list-group-item"><i class="fa fa-chevron-right pull-right"></i>

                <h5 class="no-margin">知识点列表</h5>
            </a>
        </div>
    </section>
</div>