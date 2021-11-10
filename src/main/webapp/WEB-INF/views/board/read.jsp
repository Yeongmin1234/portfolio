<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	<!--  jstl -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	<!-- date -->

<%@ include file="../includes/header.jsp" %>
	
	<link rel="stylesheet" href="/resources/css/read.css" type="text/css">
	
	<style>
		.uploadResult{
			height: 50px;
		}
	</style>
    <title>read</title>


			<div class="read">
              	<div class="readIn">
              		<input type="hidden" value="${read.bno}" id="bno">
                    <h3><span>제목 : </span>${read.title}</h3>
                    <p class="writer"><span>작성자 : </span>${read.writer}</p>
                    <div class="content">
                     	<div class="uploadResult">
			               <ul></ul>
			            </div>
            	        <div>${read.content}</div>
					</div>	            
                  
                    
                    <div class="readBtn">
                    <c:choose>
                    		<c:when test="${abcd.user_name==read.writer}">
                    			<button class="readModifyBtn"><a href="/board/modify?bno=${read.bno}">수정하기</a></button>
                    			<button class="readDeleteBtn"><a href="/board/remove?bno=${read.bno}">삭제하기</a></button>                      	
                    		</c:when>
                        	<c:otherwise>
			                   <div></div>
                        	</c:otherwise>	
                        </c:choose>
                    </div>
                </div> <!-- .readIn -->
            </div> <!-- .read-->
            
          
	
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<i class="fa fa-comments fa-fw"></i> Reply
					<c:choose>
						<c:when test="${abcd.user_name==read.writer}">
								<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글쓰기</button>
                    		</c:when>
                        	<c:otherwise>
			                   <div></div>
                        	</c:otherwise>    	
                        </c:choose>	
					<!-- button에 어떠한 동작을 주고싶으면 무조건 js에서 event 써야 함 (input과 다름) -->
				</div> <!-- .panel-heading -->
				
				<div class="panel-body">
					<ul class="chat">

					</ul> <!-- .chat -->
				</div> <!-- .panel-body -->
				<div class="panel-footer">
				
				</div>
				
				
			</div> <!-- .panel .panel-default -->
		</div>	<!-- .col-lg-12 -->
	</div> <!-- .row -->
	
	

<%@ include file="/WEB-INF/views/includes/footer.jsp" %>