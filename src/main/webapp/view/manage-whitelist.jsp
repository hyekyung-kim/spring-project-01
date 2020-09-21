<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-09-15
  Time: 오후 6:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Whitelist</title>
    <%@ include file="../view/include-top.jsp" %>
</head>
<style type="text/css">

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
    function addJSON() {
        let name = $('#whitelistInput').val();
        let regDate = new Date();

        let jsonData = {
            name : name,
            regDate : regDate
        };

        if(name.trim() == ""){
            alert("화이트리스트에 등록할 ID를 입력하세요");
            return false;
        }

        $.ajax({
            type: 'POST',
            url: '/request-whitelist',
            processData: false,
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(jsonData),
            success: function(responseJson){
                let splitDate = responseJson.regDate.split("T");
                let row = "";
                row += "<tr><td>" + responseJson.name + "</td>";
                row += "<td>" + splitDate[0] + "</td></tr>";

                $("#dataTable > tbody:last").append(row);

                alert(responseJson.name + "이 화이트리스트에 추가되었습니다." +
                    "\n[ " + splitDate[0] +" ]");
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
                    화이트리스트
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <div class="input-group" text-align="center">
                            &nbsp;&nbsp;&nbsp; ID 입력 &nbsp;
                            <input type="text" id="whitelistInput" class="form-control" placeholder="" aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <input type="button" value="등록" class="btn btn-primary btn-block"
                                       onClick="addJSON()"/>
                            </div>
                        </div>
                        <br/>
                        <table id="dataTable" class="table table-bordered" width="100%" cellspacing="0">
                            <thead>
                            <tr>
                                <th>사용자 id</th>
                                <th>등록일</th>
                            </tr>
                            </thead>
                            <tfoot>
                            <tr>
                                <th>사용자 id</th>
                                <th>등록일</th>
                            </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="whitelist" items="${whitelist}" varStatus="status">
                                <tr>
                                    <td>${whitelist.name}</td>
                                    <td><fmt:formatDate value="${whitelist.regDate}" pattern="yyyy-MM-dd" /></td>
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