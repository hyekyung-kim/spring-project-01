<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-08-23
  Time: 오후 9:53
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Dashboard</title>
    <%@ include file="../view/include-top.jsp" %>
</head>
<style>
</style>
<body id="page-top">

<%@ include file="../view/navbar.jsp" %>

<div id="wrapper">
        <!-- Sidebar -->
        <ul class="sidebar navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="/index">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/manage-request">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>분석 요청 관리</span></a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="/manage-whitelist">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>화이트리스트</span></a>
            </li>
        </ul>



    <div id="content-wrapper">
        <div class="container-fluid">

            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="/index">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Overview</li>
            </ol>

        </div>
    </div>
</div>

<%@ include file="../view/include-bottom.jsp" %>
</body>
</html>
