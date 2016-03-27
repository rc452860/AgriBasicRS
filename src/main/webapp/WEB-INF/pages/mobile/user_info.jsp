<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<c:import url="head.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <c:import url="nav.jsp"/>
            <div class="row">
                <div class="col-sm-3">
                    <c:import url="left.jsp"/>
                </div>
                <div class="col-sm-9">
                    <h4 class="page-title">用户信息 <small>User Info</small></h4>
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="widget">
                                <header>
                                    <div class="widget-controls">
                                    </div>
                                </header>
                                <div class="body">
                    <form class="form-horizontal">
                        <fieldset>
                            <legend class="section">基本信息</legend>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><c:out value="${user.name}"/></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><c:out value="${user.email}"/></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><c:out value="${user.phone}"/></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">电话</label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><c:out value="${user.phone}"/></p>
                            </div>
                        </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">机构</label>
                                <div class="col-sm-8">
                                    <p class="form-control-static"><c:out value="${user.institution}"/></p>
                                </div>
                            </div>
                            <legend class="section">学业信息</legend>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">学校</label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><c:out value="${user.school}"/></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">年级</label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><c:out value="${user.grade}"/></p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">班级</label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><c:out value="${user.team}"/></p>
                            </div>
                        </div>
                            <legend class="section">财务信息</legend>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">钱包</label>
                            <div class="col-sm-8">
                                <p class="form-control-static"><c:out value="${money}"/></p>
                            </div>
                        </div>
                            </fieldset>
                    </form>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="bottom.jsp" />