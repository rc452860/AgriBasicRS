<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" isErrorPage="true"%>
<c:import url="head.jsp"/>
<%
response.setStatus(HttpServletResponse.SC_OK);
%>
<div class="ersror-page container">
    <main id="content" class="error-container" role="main">
        <div class="row">
            <div class="col-lg-4 col-sm-6 col-xs-10 col-lg-offset-4 col-sm-offset-3 col-xs-offset-1">
                <div class="error-container">
                    <h1 class="error-code"><c:out value="${error}"/></h1>

                    <p class="error-info">
                    </p>

                    <p class="error-help mb">
                        ERROR
                    </p>
                </div>
            </div>
        </div>
    </main>
</div>
<div style="visibility:hidden">
${pageContext.errorData.statusCode}
${pageContext.errorData.requestURI}
<c:forEach var="trace" items="${pageContext.exception.stackTrace}">
${trace}
</c:forEach>
</div>
<c:import url="bottom.jsp"/>