<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-08-25
  Time: 오후 10:13
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

    header {
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
        text-align: center;
    }
    section {
        margin: 5px;
        padding: 10px;

    }
    table, tr, td {
        border: 1px solid black;
        text-align: center;
    }

    table {
        border-collapse: collapse;
    }

</style>
<body>
<div id="wrapper">
    <header><h2>SCAP</h2></header>

    <nav>
        <a href="/index">대시보드</a><br/>
        <a href="/manage-request">분석 요청 관리</a>

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
            <c:forEach var="analysis" items="${analysisList}" varStatus="status">
            <tr>
                <td>${analysis.id}</td>
                <td>${analysis.reqName}</td>
                <td><fmt:formatDate value="${analysis.reqDate}" pattern="yyyy-MM-dd" /></td>
                <td><input type="button" value="승인" onClick=""></td>
            </tr>
            </c:forEach>
        </table>
    </section>
</div>
</body>
</html>