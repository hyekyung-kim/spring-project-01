<%--
  Created by IntelliJ IDEA.
  User: 김혜경
  Date: 2020-08-26
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
    function requestJson(){

        let reqName = $('#reqName').val();
        let reqDate = new Date();
        let jsonData = {
            reqName : reqName,
            reqDate : reqDate
        };

        if(reqName.trim() == ""){
            alert("요청자 이름을 입력하세요!");
            return false;
        }

        $.ajax({
            type: 'POST',
            url: '/request-analysis',
            processData: false,
            contentType: 'application/json',
            dataType: 'json',
            data: JSON.stringify(jsonData),
            success: function(responseJson){
                $("#requestResult").html(JSON.stringify(responseJson));
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        });
    };

</script>

<body class="bg-dark">

    <div class="container">
        <div class="card card-login mx-auto mt-5">
            <div class="card-header">분석 요청 페이지</div>
            <div class="card-body">
                <div class="text-center mb-4">
                    <h4>분석 요청 페이지</h4>
                    <p>요청 결과</p>
                    <div id="requestResult"></div>
                </div>
                <form>
                    <div class="form-group">
                        <div class="form-label-group">

                            <input type="text" id="reqName" name="reqName" class="form-control" placeholder="요청자 이름" required="required" autofocus="autofocus" />
                            <label for="reqName">요청자 이름</label>

                        </div>
                    </div>
                    <input type="button" id="reqButton" value="분석 요청" onclick="requestJson()" class="btn btn-primary btn-block" />
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
