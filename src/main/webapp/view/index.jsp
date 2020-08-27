<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-08-23
  Time: 오후 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>
    <title>Dashboard</title>
</head>
<style type="text/css">

    header{
        border: 1px solid #999;
        padding: 10px;
        height: 50px;
    }
    p {
        text-align: right;
    }

    nav {
        border: 1px solid #999;
        padding: 5px;
        float: left;
        width: 150px;
        height: 80%;
        text-align: center;
    }
    section{
        margin: 5px;
        padding: 10px;

    }
</style>
<body>
    <div id="wrapper">
        <header>
            <h2>SCAP</h2>
            <p>
                [ ${loginMember} ]님 &nbsp;
                <input type="button" value="sign-out"
                       onclick=" location.href='/signout/process' "/>
            </p>
        </header>

        <nav>
              <a href="/index">대시보드</a> <br/>
              <a href="/manage-request">분석 요청 관리</a>
        </nav>

        <section>
            <h3>Dashboard</h3>
        </section>
    </div>
</body>
</html>
