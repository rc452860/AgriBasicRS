<%@ taglib prefix="my" uri="exam" %>
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
                    <h4 class="page-title">我的考试
                        <small>My Examines</small>
                    </h4>
                    <div class="row">
                        <div class="col-lg-12">
                            <section class="widget">
                                <header><c:out value="${examine.name}"/></header>
                                <div class="body">
                                    <blockquote class="blockquote-sm">
                                        <c:out value="${examine.instruction}"/>
                                    </blockquote>
                                    <blockquote class="blockquote-sm">
                                        <code><c:out value="${examine.startDate.toLocaleString()}"/></code>
                                        -
                                        <code><c:out value="${examine.endDate.toLocaleString()}"/></code>
                                    </blockquote>
                                </div>
                            </section>
                            <c:forEach items="${list}" var="item" varStatus="status">
                                <section class="widget">
                                    <header>
                                        <c:out value="${start+status.index+1}"/>. <c:out value="${item.name}"/>
                                        <div class="widget-controls">
                                        </div>
                                    </header>
                                    <div class="body">
                                        <blockquote class="blockquote-sm"><p><c:out
                                                value="${item.instruction}"/></p>
                                        </blockquote>
                                        <blockquote class="blockquote-sm">
                                            <form id="<c:out value="${item.id}"/>">
                                                <input name="type" type="hidden" value="${item.type.toString()}">
                                                <c:if test="${item.type.toString().equals(\"Essay\")}">
                                            <textarea onchange="post_answer('<c:out value="${examine.id}"/>','<c:out
                                                    value="${item.id}"/>');" name="answer"
                                                      class="form-control input-transparent" rows="8"
                                                      placeholder="答案"><my:question question="${item}"
                                                                                    examineResult="${result}"
                                                                                    choose="0"/></textarea>
                                                </c:if>
                                                <c:if test="${item.type.toString().equals(\"BlankFilling\")}">
                                                    <my:blanks question="${item}"/>
                                                    <c:forEach items="${blanks}" var="blank" varStatus="blank_status">
                                                        <div class="form-group">
                                                            <input onchange="post_answer('<c:out
                                                                    value="${examine.id}"/>','<c:out
                                                                    value="${item.id}"/>');" name="answer"
                                                                   type="text"
                                                                   class="form-control input-transparent" size="10"
                                                                   value="<my:question question="${item}"
                                                                             examineResult="${result}" choose="${blank_status.index}"/>"
                                                                   placeholder="填空<c:out value="${blank}"/>"/>
                                                        </div>
                                                    </c:forEach>
                                                </c:if>
                                                <c:forEach items="${item.choices}" var="choice"
                                                           varStatus="choice_status">
                                                    <c:choose>
                                                        <c:when test="${item.type.toString().equals(\"OneChoice\")}">
                                                            <div class="radio radio-info">
                                                                <input name="answer"
                                                                       value="<my:num2char num="${choice_status.index}"/>"
                                                                       onclick="post_answer('<c:out
                                                                               value="${examine.id}"/>','<c:out
                                                                               value="${item.id}"/>');"
                                                                        <my:question question="${item}"
                                                                                     examineResult="${result}"
                                                                                     choose="${choice_status.index}"/>
                                                                       type="radio"
                                                                       name="<c:out value="${item.id}"/>"
                                                                       id="<c:out value="${item.id}"/>-<c:out value="${choice_status.index}"/>"/>
                                                                <label for="<c:out value="${item.id}"/>-<c:out value="${choice_status.index}"/>">
                                                                    <my:num2char num="${choice_status.index}"/>.
                                                                    <c:out value="${choice}"/>
                                                                </label>
                                                            </div>
                                                        </c:when>
                                                        <c:when test="${item.type.toString().equals(\"MultiChoice\")}">
                                                            <div class="checkbox checkbox-info">
                                                                <input name="answer"
                                                                       value="<my:num2char num="${choice_status.index}"/>"
                                                                       onclick="post_answer('<c:out
                                                                               value="${examine.id}"/>','<c:out
                                                                               value="${item.id}"/>');"
                                                                       name="answer"
                                                                        <my:question question="${item}"
                                                                                     examineResult="${result}"
                                                                                     choose="${choice_status.index}"/>
                                                                       type="checkbox"
                                                                       name="<c:out value="${item.id}"/>"
                                                                       id="<c:out value="${item.id}"/>-<c:out value="${choice_status.index}"/>"/>
                                                                <label for="<c:out value="${item.id}"/>-<c:out value="${choice_status.index}"/>">
                                                                    <my:num2char num="${choice_status.index}"/>.
                                                                    <c:out value="${choice}"/>
                                                                </label>
                                                            </div>
                                                        </c:when>
                                                    </c:choose>
                                                </c:forEach>
                                            </form>
                                        </blockquote>
                                    </div>
                                </section>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="bottom.jsp"/>
<script>
    function post_answer(examineId, questionId) {
        $.ajax({
            cache: false,
            type: "POST",
            url: "/mobile/user/answer/" + examineId + "/" + questionId,
            data: $('#' + questionId).serialize(),
            async: true,
            error: function (XMLHttpRequest) {
                Messenger().post("error:" + XMLHttpRequest.status);
            },
            success: function (data) {
                //Messenger().post(data.message);
            }
        });
    }
</script>
<script type="text/javascript" src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=AM_HTMLorMML">
</script>