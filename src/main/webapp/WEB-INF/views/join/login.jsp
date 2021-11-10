<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/Login_main.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
     <!-- jquery연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jquery UI연결 -->
    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js'></script>
    <script type="text/javascript" src="/resources/js/login.js"></script>
    <title>로그인</title>
</head>
<style>
#container{
	padding-top: 100px;
}
.footerIn{
	text-align: center;
}
	.logo a{
		text-decoration:none;
		margin: 50px 0;
	}
</style>
<body>

    <div id="container">
        <h1 class="logo"><a href="/">BTS</a></h1>
        <form action="login" method="post">
            <ul id="user_info">
                <li>
                    <p>아이디</p>
                    <input type="text" id="user_id" name="user_id" placeholder="4~15자리의 영문과 숫자로 입력하세요">
                </li>
                <li>
                    <p>비밀번호</p>
                    <input type="password" id="user_pw1" name="user_pw" placeholder="8자리 이상 입력하세요">
                </li>
			</ul>
            <ul id="buttons">
                <li class="end_btn"><button id="login" type="submit">로그인</button></li>
                <li class="end_btn"><button><a href="/join/find">ID / 비밀번호 찾기</a></button></li>
            </ul>
                <p class="p_btn"><button><a href="/join/membership">회원가입</a></button></p>
        </form>
    </div>
        <footer id="footer">
            <div class="footerIn">
                ⓒ2021 ym8482 All Rights Reserved
            </div>
        </footer><!--#footer-->
    </div>
</body>
</html>
