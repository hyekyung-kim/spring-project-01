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
    <%@ include file="../view/sidebar.jsp" %>

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
