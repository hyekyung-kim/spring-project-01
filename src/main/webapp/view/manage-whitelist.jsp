<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-09-15
  Time: 오후 6:39
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Dashboard</title>
    <%@ include file="../view/include-top.jsp" %>
</head>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
</script>
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
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Tables</li>

                <li>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="button">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </li>
            </ol>
            <!-- DataTables Example -->
            <div class="card mb-3">
                <div class="card-header">
                    <i class="fas fa-table"></i>
                    분석 요청 목록
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>분석 요청 id</th>
                                <th>요청자</th>
                                <th>분석 요청일</th>
                                <th>승인</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>분석 요청 id</th>
                                <th>요청자</th>
                                <th>분석 요청일</th>
                                <th>승인</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="analysis" items="${analysisList}" varStatus="status">
                                <tr>
                                    <td>${analysis.id}</td>
                                    <td>${analysis.reqName}</td>
                                    <td><fmt:formatDate value="${analysis.reqDate}" pattern="yyyy-MM-dd" /></td>
                                    <td><input type="button" value="승인" onClick=""></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /.content-wrapper -->
</div>
<!-- /#wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>



<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="../view/include-bottom.jsp" %>
<!-- Page level plugin JavaScript-->
<script src="../resources/vendor/datatables/jquery.dataTables.js"></script>
<script src="../resources/vendor/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="../resources/js/sb-admin.min.js"></script>

<!-- Demo scripts for this page-->
<script src="../resources/js/demo/datatables-demo.js"></script>


</body>
</html>