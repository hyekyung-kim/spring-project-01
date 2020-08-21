
<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-08-21
  Time: 오후 6:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
    <title>Login Page</title>
</head>

<style>
    .error {
        color: #ff0000;
        /* font-weight: bold; */
    }
</style>

<body>
    <div class="container" style="padding: 100px">
        <h2 class="text-center">Login</h2>
        <br/>

        <form:form method="POST" action="login.do">
            <form:errors cssClass="error" /> <br />
            <div class="form-group">
<%--                <label for="id">Email</label>--%>
<%--                <form:input path="id" type="text" />--%>
                <form:errors path="id" cssClass="error" />
            </div>

            <div class="form-group">
<%--                <label for="password">Password</label>--%>
<%--                <form:input path="password" type="password" />--%>
                <form:errors path="password" cssClass="error" />
            </div>
            <br />

            <div class="form-group" align="center">
                <input type="submit" value="로그인">
            </div>

        </form:form>
    </div>
</body>
</html>
