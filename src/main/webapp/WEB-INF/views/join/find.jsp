<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/find.css">
    <link rel="stylesheet" href="/resources/css/reset.css">
    <!-- jquery연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jquery UI연결 -->
    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js'></script>
    <title>취공사 아이디 찾기/비밀번호찾기</title>
    <style>
        .finding{
    display: flex;
    justify-content: center;
}
.find_tx{
    height: 70px;
}
.find_id{
    display: none;
}
.find_id .find_tx{
    margin-bottom: 30px;
    margin-left: 30px;
}
.find_pw{
    display: none;
}
.find_pw .find_tx{
    text-align: center;
    margin-top: 20px;
    margin-bottom: 10px;
}
    </style>
</head>
<body>
    <div id="container">
        <h1 class="logo"><a href="/">BTS</a></h1>
        <div>
            <ul id="user_info">
                <li>
                    <button class="id_btn">아이디 찾기</button>
                </li>
                <li>
                    <button class="pw_btn">비밀번호 찾기</button>
                </li>
            </ul>
        </div>
        <div class="finding">
            <div class="find_id">
                <div>
                    <form action="">
                    <ul class="find_tx">
                        <li class="find_tx1">
                            <label for=""style="padding-left: 38px;">이름 : </label>
                            <input type="text">
                        </li>
                        <li class="find_tx1">
                            <label for="">핸드폰번호 : </label>
                            <input type="text">
                        </li>
                        <li class="find_tx1">
                            <label for=""style="padding-left: 14px;">인증번호 : </label>
                            <input type="text">
                            <input type="button" value="전송"> 
                        </li>
                        
                    </ul>
                    </form>
                </div>
                <div class="find_bt">
                    <p><button><a href="#">찾기</a></button></p>
                </div>
            </div>
            <div class="find_pw">
                <div>
                    <div class="find_tx">
                        <label for="">아이디</label>
                        <input type="text">
                    </div>
                </div>
                <div class="find_bt">
                    <p><button><a href="#">찾기</a></button></p>
                </div>
            </div>
        </div>
    </div>






    <script>
        let userId = document.querySelector("#user_id");
            let $f_id = $('.id_btn'),
                $f_pw = $('.pw_btn');

            $f_id.click(function(){
                $('.find_pw').css({'display' : 'none'})
                $('.find_id').css({'display' : 'block'})
            })
            $f_pw.click(function(){
                $('.find_id').css({'display' : 'none'})
                $('.find_pw').css({'display' : 'block'})
            })
    </script>
     <%@ include file="../includes/footer.jsp" %>
