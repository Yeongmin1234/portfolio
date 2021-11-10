<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	<!--  jstl -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	<!-- date -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/list.css">
    <link rel="stylesheet" href="/resources/css/read.css">
	<link rel="stylesheet" href="/resources/css/modify.css" type="text/css">
    <!-- jquery연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jquery UI연결 -->
    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js'></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script defer src="/resources/js/main.js"></script>
	
    <title>modify</title>
</head>
<body>
    <div id=wrap>
        <div id="header">
            <div class="headerIn">
                <h1 class="logo">
                    <a href="/">
                        BTS
                    </a>
                </h1><!--.logo-->
                <div class="gnb">
                    <ul>
                        <li><a href="/board/list">게시판</a></li>
                        <li><a href="#">정보</a></li>
                        <li><a href="#">사진</a></li>
                        <li><a href="#">앨범</a></li>
                    </ul>                    
                </div><!--.gnb-->
		                
				<div class="member">
                    <ul>
                    	<c:choose>
                    		<c:when test="${abcd==null}">
                        		<li><a href="/join/login">로그인</a></li>
                        		<li><a href="/join/login">마이페이지</a></li>
                        		<li><a href="/join/membership">회원가입</a></li>
                        	</c:when>
                        	<c:otherwise>
                        		<li><a href="/join/logout">로그아웃</a></li>
                        		<li><a href="/join/info?user_id=${abcd.user_id}">마이페이지</a></li>
                        	</c:otherwise>	
                        </c:choose>
                    </ul>
                </div>
            </div><!--.headerIn-->
        </div><!--.header-->

			<div class="modify">
                <form action="modify" method="post">
                    <p class="title">
                    <span>제목 : </span>
                    	<input type="text" name="title" value="${modify.title}">
                    	<input type="hidden" name="bno" value="${modify.bno}">
                    </p>
                    <p class="writer"><span>작성자 : </span>${abcd.user_name}</p>
                    <p class="content"><textarea rows="70" cols="126" name="content">${modify.content}</textarea></p>
                    <div class="modifyBtn">
                        <input type="submit" value="수정하기">
                    </div>
             
                </form>
            </div> <!-- .post-->


        

        
 <%@ include file="../includes/footer.jsp" %>