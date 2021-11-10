<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	<!--  jstl -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	<!-- date -->

<%@ include file="../includes/header.jsp" %>
	
	
	<link rel="stylesheet" href="/resources/css/register.css" type="text/css">
    <title>register</title>

			<div class="register">
                
                <form role="form" action="register" method="post">
                    <p class="title"><labal>제목 : </labal><input type="text" placeholder="제목을 입력하여 주세요" name="title"></p>
                    <p class="writer"><input type="hidden" name="writer" value="${abcd.user_name}"></p>
                    <p><input type="hidden" value="no" name="cm_board"></p>
                    <p class="content"><textarea rows="70" cols="120" name="content"></textarea></p>
                    <div class="registerBtn">
                        <input type="submit" value="글쓰기">
                    </div>
                </form>
                
                
		        	 <div class="rowi"><!-- row -->
							<h2>
								File Attach
							</h2>
							<div>
								<div class='uploadDiv'>
									<input type='file' name='uploadFile'>
									<button class='ucBtn'>X</button>
								</div>
								<div class='uploadResult'>
									<ul>
									</ul>
								</div>  
							</div>
					</div><!-- row -->
            </div> <!-- .post-->


	<%@ include file="/WEB-INF/views/includes/footer.jsp" %>