
<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-08-21
  Time: 오후 6:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
    <title>Login Page</title>
</head>

<style>
    .error, p {
        color: #ff0000;
        /* font-weight: bold; */
    }
</style>
<script>
    function requestSubmit(){
        location.href="/request/page";
    }
</script>
<body>
    <div class="container" style="padding: 100px">
        <h2>Login</h2>
        <br/>
        
        <%--@elvariable id="loginForm" type="java"--%>
        <form:form modelAttribute="loginForm" method="POST" action="/signin">
            <form:errors cssClass="error" /> <br />
            <div class="form-group">
                <label for="name">ID</label> &nbsp;
                <form:input path="name" type="text" />
                <form:errors path="name" cssClass="error" />
            </div>

            <div class="form-group">
                <label for="password">PW</label> &nbsp;
                <form:input path="password" type="password" />
                <form:errors path="password" cssClass="error" />
            </div>
            <br />
            <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
                <p>로그인 실패: <br/>
                        ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
                <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
            </c:if>

            <div class="form-group" align="center">
                <input type="submit" value="로그인">
            </div>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form:form>

        <input type="button" value="분석 요청" onClick="requestSubmit()">

    </div>
</body>
</html>
