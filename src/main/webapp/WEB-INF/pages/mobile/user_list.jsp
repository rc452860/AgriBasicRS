<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<c:import url="head.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <c:import url="nav.jsp"/>
            <div class="row">
                <div class="col-sm-3">
                    <c:import url="menu.jsp"/>
                </div>
                <div class="col-sm-9">
                    <h4 class="page-title">用户列表
                        <small>All Users</small>
                    </h4>
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="widget">
                                <header>
                                    <div class="widget-controls">
                                    </div>
                                </header>
                                <div class="body">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>用户名</th>
                                            <th>姓名</th>
                                            <th>机构</th>
                                            <th>班级</th>
                                            <th>年级</th>
                                            <th>学校</th>
                                        </tr>
                                        </thead>
                                        <tbody><c:forEach items="${list}" var="item" varStatus="status">
                                            <tr>
                                                <td><c:out value="${start+status.index+1}"/></td>
                                                <td><c:out value="${item.username}"/></td>
                                                <td><c:out value="${item.name}"/></td>
                                                <td><c:out value="${item.institution}"/></td>
                                                <td><c:out value="${item.team}"/></td>
                                                <td><c:out value="${item.grade}"/></td>
                                                <td><c:out value="${item.school}"/></td>
                                            </tr>
                                        </c:forEach></tbody>
                                    </table>
                                    <div class="clearfix">
                                        <div class="pull-right">
                                            <a class="btn btn-transparent" href="<c:out value="${previous}"/>">上一页</a>
                                            <a class="btn btn-transparent" href="<c:out value="${next}"/>">下一页</a>
                                        </div>
                                        <p></p>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="bottom.jsp"/>