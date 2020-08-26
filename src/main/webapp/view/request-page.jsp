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
    <title>Request Page</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
<%--    JSON    --%>
    function postJson(){

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
<body>
    <h2>분석 요청 페이지</h2>

    <div class="form-group">
        <label>요청자 이름</label>
        <input type="text" id="reqName" name="reqName" />
        <input type="button" id="reqButton" value="요청" onclick="postJson()">
    </div>

    <br/><br/>

    <a>요청 결과</a>
    <div id="requestResult"></div>
</body>
</html>
