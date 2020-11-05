<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-10-20
  Time: 오후 2:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
    <%@ include file="../view/include-top.jsp" %>

    <title>Request Page</title>

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
<%--    JSON    --%>
function fileJSON(){

    let id = $('#reqId').val();
    let reqUrl = "/request-file/" + id;

    if(id.trim() == ""){
        alert("파일 요청 id를 입력하세요!");
        return false;
    }

    $.ajax({
        type: 'GET',
        url: reqUrl,
        processData: false,
        contentType: 'application/json',
        data: {id: id},
        success: function(filePath){
            if(filePath){
                location.href="/download/" + id;
            }else{
                alert("파일 없음");
            }
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
}

</script>

<body class="bg-dark">

    <div class="container">
        <div class="card card-login mx-auto mt-5">
            <div class="card-header">파일 요청 페이지</div>
            <div class="card-body">
                <div class="text-center mb-4">
                    <h4>파일 요청 페이지</h4>
                    <p>요청 결과</p>
                    <div id="requestResult"></div>
                </div>
                <form>
                    <div class="form-group">
                        <div class="form-label-group">

                            <input type="text" id="reqId" name="reqId" class="form-control" placeholder="요청 id" required="required" autofocus="autofocus" />
                            <label for="reqId">요청 id</label>

                        </div>
                    </div>
                    <input type="button" id="reqButton" value="파일 요청" onclick="fileJSON()" class="btn btn-primary btn-block" />

                </form>
                <div class="text-center">
                    <a href="/login" class="d-block small">Login Page</a>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../view/include-bottom.jsp" %>

</body>
</html>
