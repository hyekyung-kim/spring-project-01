<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-08-25
  Time: 오후 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    nav {
        border: 1px solid #999;
        padding: 5px;
        float: left;
        width: 150px;
        height: 80%;
    }
    section{
        margin: 5px;
        padding: 10px;

    }
</style>
<body>
<div id="wrapper">
    <header><h2>SCAP</h2></header>

    <nav>
        <ul>
            <li><a href="">대시보드</a></li>
            <li><a href="">분석 요청 관리</a></li>
        </ul>
    </nav>

    <section>
        <h3>분석 요청 목록</h3>

        <table>
            <tr>
                <td>분석 요청 id</td>
                <td>요청자</td>
                <td>분석 요청일</td>
                <td>승인</td>
            </tr>
        </table>
    </section>
</div>
</body>
</html>