<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>취공사</title>
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <!-- reset,main css -->
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/info.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <!-- jquery연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jquery UI연결 -->
    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js'></script>
	<script type="text/javascript" src="/resources/js/comment.js"></script>
	<script type="text/javascript" src="/resources/js/list.js"></script>
	<script type="text/javascript" src="/resources/js/register.js"></script>
	<script type="text/javascript" src="/resources/js/info.js"></script>
</head>
<style>
#wrap{
background-color: #eee;
opacity: 0.8;
margin-top: 0;}
.footer{
	margin-top:50px;
	height:150px;
	text-align: center;
}

</style>
<body>
   
        <div id="wrap">
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
   <div id="container">
            <div class="container_in">
                <div class="man_menu">
                <ul>
                    <li class=""><a href="#c_member_man">회원정보</a></li>
                    <li><a href="#c_borad_man">비밀번호 변경</a></li>
                    <li><a href="#c_mem_statis">회원 탈퇴</a></li>
                </ul>
                </div><!--man_menu-->
                
                
                <div class="man_contents">
                    <div class="man_content" id="c_member_man">
                        <table>
                            <tr><td>아이디 : </td><td><input type="hidden" id="" name="user_id" value="${info.user_id}">${info.user_id}</td></tr>
                            <tr><td>이름 : </td><td>${info.user_name}</td></tr>
                            <tr><td>휴대폰 : </td><td>${info.user_phone}</td></tr>
                            <tr><td>이메일 : </td><td>${info.user_email}</td></tr>
                        </table><!-- #write-main -->
                       	<button><a href="/join/edit?user_id=${info.user_id}">수정하기</a></button>
                    </div>
                    
                    
                    <div class="man_content" id="c_borad_man">
	                   	<div class="move">
	                    	<form action="pwEdit" method="post">
	                    		<div>
	                    			<input type="hidden" name="user_id" value="${info.user_id}">
	                    		</div>
								<div>
							 		<label for="password">새 비밀번호</label>
							 		<input type="password" name="user_pw">
							 	</div>
							 	<div>
							 		<label for="password">새 비밀번호 확인</label>
							 		<input type="password" id="pw22">
							 	</div>
							 	 <button id="pwBtn" type="submit">변경</button>
							 </form>
						</div>
					</div>
					
					
                    <div class="man_content" id="c_mem_statis">
					
						 	<div class="move">
						 		<button class="fire"><a href="/join/mbOut?user_id=${info.user_id}">회원탈퇴</a></button>
						 	</div>
                    </div>
                    
                    
                </div><!--man_contents-->
            </div><!--.container_in-->
        </div><!--#container-->
        
        <footer>
            <div class="footer">
                ⓒ2021 ym8482 All Rights Reserved
            </div>
        </footer><!--#footer-->
    </div>
</body>
</html>