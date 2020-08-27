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
    div {
        margin: 5px;
        padding: 10px;

    }
    table, tr, td {
        border: 1px solid black;
        text-align: center;
    }

    table {
        border-collapse: collapse;
        margin-left: auto;
        margin-right: auto;
    }

    td {
       width: 120px;
    }

    .pagination a {
        display:inline-block;
        cursor:pointer;
    }
    p {
        text-align: right;
    }

    ul {
        text-align: center;
        margin-left: auto;
        margin-right: auto;
    }

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script>
    function pagination(){
        let req_num_row=10;      // 한 화면당 데이터 수
        let $tr=jQuery('tbody tr');
        let total_num_row=$tr.length;
        let num_pages=0;
        if(total_num_row % req_num_row ==0){
            num_pages=total_num_row / req_num_row;
        }
        if(total_num_row % req_num_row >=1){
            num_pages=total_num_row / req_num_row;
            num_pages++;
            num_pages=Math.floor(num_pages++);
        }

        // 페이징 바
        for(let i=1; i<=num_pages; i++){
            jQuery('.pagination').append("<a>"+i+"</a>&nbsp;&nbsp;");
            jQuery('.pagination:nth-child(2)').addClass("active");
            jQuery('.pagination a').addClass("pagination-link");
        }

        // 해당 페이지만 보여주기
        $tr.each(function(i){
            jQuery(this).hide();
            if(i+1 <= req_num_row){
                $tr.eq(i).show();
            }
        });

        jQuery('.pagination a').click('.pagination-link', function(e){
            e.preventDefault();
            $tr.hide();
            let page=jQuery(this).text();
            let temp=page-1;
            let start=temp*req_num_row;
            let current_link = temp;

            jQuery('.pagination a').removeClass("active");
            jQuery(this).parent().addClass("active");

            for(let i=0; i< req_num_row; i++){
                $tr.eq(start+i).show();
            }

            if(temp >= 1){
                jQuery('.pagination a:first-child').removeClass("disabled");
            }
            else {
                jQuery('.pagination a:first-child').addClass("disabled");
            }
        });
    }

    jQuery('document').ready(function(){
        pagination();
        jQuery('.pagination a:first-child').addClass("disabled");
    });

</script>
<body>
<div id="wrapper">
    <header>
        <h2>SCAP</h2>
        <p>
            [ ${loginMember} ]님 &nbsp;
            <input type="button" value="sign-out"
                onclick=" location.href='/signout/process' "/>
        </p>
    </header>

    <nav>
        <a href="/index">대시보드</a><br/>
        <a href="/manage-request">분석 요청 관리</a>
    </nav>

    <h3>분석 요청 목록</h3>

    <table>
        <thead>
            <tr>
                <td>분석 요청 id</td>
                <td>요청자</td>
                <td>분석 요청일</td>
                <td>승인</td>
            </tr>
        </thead>
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

    <ul class="pagination"></ul>

</div>
</body>
</html>