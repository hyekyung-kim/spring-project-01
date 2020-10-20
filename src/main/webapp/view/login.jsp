
<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-08-21
  Time: 오후 6:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SB Admin - Login</title>
    <%@ include file="../view/include-top.jsp" %>
</head>

<style>
    .error, p {
        color: #ff0000;
        /* font-weight: bold; */
    }
</style>
<script>
    function analysisSubmit(){
        location.href="/request/page";
    }
    function fileSubmit(){
        location.href="/request/file";
    }
</script>
<body class="bg-dark">

<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header">Login</div>
        <div class="card-body">
        
            <%--@elvariable id="loginForm" type="java"--%>
            <form:form modelAttribute="loginForm" method="POST" action="/signin">

                <div class="form-group">
                    <div class="form-label-group">
                        <form:input path="name" type="text"
                                    class="form-control" placeholder="Email address" required="required" autofocus="autofocus" />
                        <form:errors path="name" cssClass="error" />
                        <label for="name">ID</label> &nbsp;
                    </div>
                </div>

                <div class="form-group">
                    <div class="form-label-group">
                        <form:input path="password" type="password"
                                    class="form-control" placeholder="Password" required="required"/>
                        <form:errors path="password" cssClass="error" />
                        <label for="password">PW</label> &nbsp;
                    </div>
                </div>

                <br />
                <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
                    <p>로그인 실패: <br/>
                            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
                    <c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
                </c:if>


                <div class="form-group">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" value="remember-me">
                            Remember Password
                        </label>
                    </div>
                </div>


                <div class="form-group" align="center">
                    <input type="submit" value="로그인" class="btn btn-primary btn-block">
                </div>

                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            </form:form>
            <div class="form-group" align="center" style="float: none">
                <input type="button" value="분석 요청" onClick="analysisSubmit()" class="btn btn-primary btn-block">
                <input type="button" value="파일 요청" onClick="fileSubmit()" class="btn btn-primary btn-block">
            </div>

        </div>

        <div class="text-center">
            <a class="d-block small mt-3" href="register.html">Register an Account</a>
            <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
        </div>
    </div>
</div>

<%@ include file="../view/include-bottom.jsp" %>

</body>
</html>
