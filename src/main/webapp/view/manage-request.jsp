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
    <title>Manage Request</title>
    <%@ include file="../view/include-top.jsp" %>
</head>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
    <%--    JSON: 승인 버튼 클릭 시    --%>
    function statusJSON(id){
        let reqUrl = "/request-status/" + id;
        $.ajax({
            type: 'GET',
            url: reqUrl,
            processData: false,
            contentType: 'application/json',
            dataType: 'json',
            success: function(){
                let btn = document.getElementById(id);
                btn.value="실행 중";
                btn.disabled = true;
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }
    <%--    JSON: 결과 승인 버튼 클릭 시    --%>
    function grantJSON(id){
        let reqUrl = "/request-grant/" + id;
        $.ajax({
            type: 'GET',
            url: reqUrl,
            processData: false,
            contentType: 'application/json',
            dataType: 'json',
            success: function(){
                let btn = document.getElementById(id);
                btn.style.display="none";

                let text = document.getElementById('grantChanged' + id);
                text.innerHTML="결과 승인 완료";
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    }
</script>
<body id="page-top">

<%@ include file="../view/navbar.jsp" %>

<div id="wrapper">
    <%@ include file="../view/sidebar.jsp" %>

    <div id="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="#">Dashboard</a>
                </li>
                <li class="breadcrumb-item active">Tables</li>
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
                                    <td>
                                        <c:choose>
                                            <c:when test="${analysis.status eq 'run'}">
                                                <input type="button" id="${analysis.id}" value="실행 중" disabled="disabled"/>
                                            </c:when>
                                            <c:when test="${analysis.status eq 'complete'}">
                                                분석 완료 &nbsp;&nbsp;
                                                <c:if test="${analysis.grantCheck eq 0}">
                                                    <div id="grantChanged${analysis.id}" style="display:inline"></div>
                                                    <input type="button" id="${analysis.id}" value="결과 승인" onclick="grantJSON('${analysis.id}')"/>
                                                </c:if>
                                                <c:if test="${analysis.grantCheck eq 1}">
                                                    결과 승인 완료
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="button" id="${analysis.id}" value="승인" onclick="statusJSON('${analysis.id}')"/>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
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