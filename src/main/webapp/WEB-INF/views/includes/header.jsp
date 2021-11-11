
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
    <!-- jquery연결 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- jquery UI연결 -->
    <script src='//cdnjs.cloudflare.com/ajax/libs/jquery-throttle-debounce/1.1/jquery.ba-throttle-debounce.min.js'></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <!-- 슬릭 가로 -->
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
    <!-- 페이저 -->
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
    <!-- 슬라이드  -->
    <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script> 
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script defer src="/resources/js/main.js"></script>
    <script type="text/javascript" src="/resources/js/replyNotice.js"></script>
    <script type="text/javascript" src="/resources/js/register.js"></script>
    <script type="text/javascript" src="/resources/js/read.js"></script>
    
    <title>Document</title>
  
    <!-- Reply modal start -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<div class="modal-header">
    				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    				<h4 class="modal-title" id="myModalLabel">Reply Modal</h4>
    			</div>
    			<div class="modal-body">
    				<div class="form-group">
    					<label>Reply</label>
    					<input class="form-control" name="reply" value="">
    				</div>
    				<div class="form-group">
    					<label>Replyer</label>
    					<input class="form-control" name="replyer" value="${abcd.user_name}">
    				</div>
    				<div class="form-group">
    					<label>Reply Date</label>
    					<input class="form-control" name="replyDate" value="">
    				</div>
    			</div> 
    			<div class="modal-footer">
	    			<button id="modalModBtn" type="button" class="btn btn-warning">Modify</button>
	    			<button id="modalRemoveBtn" type="button" class="btn btn-danger" data-dismiss="modal">Remove</button>
	    			<button id="modalRegisterBtn" type="button" class="btn btn-default" data-dismiss="modal">Register</button>
	    			<button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    			</div>
    		</div>
    	</div>
    </div>
      <style>
        .slick-prev{ /* 화살표 위치,크기, 이미지 넣어줌 */
                    position: absolute;
                    bottom: 50%;
                    color: #fff;
                    z-index: 100;
                    cursor: pointer;
                    border-radius: 50%;
                    width: 50px;
                    height: 50px;
                    font-size: none;
            }
        .slick-next { /* 화살표 위치,크기, 이미지 넣어줌 */
                    position: absolute;
                    bottom: 50%;
                    color: #fff;

                    z-index: 100;
                    cursor: pointer;
                    border-radius: 50%;
                    width: 50px;
                    height: 50px;
                    font-size: none;
            }

            .slick-prev:before{
                display: block;
                content: ".";
                color: transparent;
                background-image: url(/resources/img/left-arrow.png);
                background-size: 50px auto;
                background-repeat: no-repeat;
                background-position: center;
            } 
            .slick-next:before {
                display: block;
                content: ".";
                color: transparent;
                background-image: url(/resources/img/next.png);
                background-size: 50px auto;
                background-repeat: no-repeat;
                background-position: center;
            } 

        .slick-prev {   /* 화살표 자리 잡아줌*/
                    left: 40px;

            }
        .slick-next {   /* 화살표 자리 잡아줌*/
                    right: 40px;
            }
        .slick-prev:hover,
        .slick-next:hover{    
               border: 1px solid #eee;
               background-color: #eee;
               opacity:0.6;
            }
 
</style>
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
                <nav class="gnb">
                    <ul>
                        <li><a href="/board/list">게시판</a></li>
                        <li><a href="#">정보</a></li>
                        <li><a href="#">사진</a></li>
                        <li><a href="#">앨범</a></li>
                    </ul>                    
                </nav><!--.gnb-->
		                
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