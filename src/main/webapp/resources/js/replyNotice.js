/**
 * rest 방식으로 댓글 처리하기(ajax사용)
 */

console.log("@@@@@@@@@@ Reply Module @@@@@@@@@@");
	

// 함수 호출부
// 선택자		이벤트
$(document).ready(function() {
	
	
	var bnoValue = $("#bno").val();	// 게시판 번호
							// .val() : 선택된 id(bno)의 value값을 가져옴.
	// $("#bno").val(1); 위와 동일
	var replyUL=$(".chat");
	
	console.log(bnoValue);
	

	
	showList(1);	// showList 함수 호출
	
	
	// p440
	var pageNum = 1;
	var replyPageFooter = $(".panel-footer");
	
	function showReplyPage(replyCnt) {
		
		var endNum = Math.ceil(pageNum/10.0) * 10;
		var startNum = endNum - 9;
		
		var prev = startNum != 1;
		var next = false;
		
		if (endNum * 10 >= replyCnt) {
			endNum = Math.ceil(replyCnt/10.0);
		}
		
		if (endNum * 10 < replyCnt) {
			next = true;
		}
		
		var str = "<ul class='pagination pull-right'>";
		
		if (prev) {
			str += "<li class='page-item'><a class='page-link' href ='" + (startNum - 1) + "'>Previous</a></li>";
		}
		
		for(var i = startNum; i <= endNum; i++) {
			var active = pageNum == i? "active" : "";
			
			str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
		}
		
		if (next) {
			str += "<li class='page-item'><a class='page-link' href='" + (endNum + 1) + " '>Next</a></li>";
		}
		
		str += "</ul></div>";
		
		// console.log(str)
		replyPageFooter.html(str);
	}
	
	// showList 함수 선언 시작
	function showList(page) {
		// getList 함수 호출 시작
		
		//	alert("aaa");
		
		replyService.getList({bno:bnoValue, page:page||1}, function(replyCnt, list) {
							//'{ ~ }'은 JSON type			'function(list)'는 callback 함수
				if(page == -1) {
					pageNum = Math.ceil(replyCnt/10.0);
					showList(pageNum);
					return;
				}
							
							
				var str = "";
				
				// select 된 결과가 없으면
				if(list == null || list.length==0) {
					replyUL.html("");	
					// javascript의 innerHTML = jquery의 html : 반드시 열고 닫는 태그가 있어야만 가능 ex) input 태그는 불가
					return;
				}
				
				console.log(list);
				
				for(var i = 0, len=list.length || 0; i < len; i++) {
					str+="<li class='left clearfix' data-rno='"+list[i].rno+"'>"
					str+="<div>"
					str+="<div class='header'>"	
					str+="<strong class='primary-font'>작성자 : "+list[i].replyer+"</strong>"
					str+="<small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small>"
					str+="</div>"
					str+="<p>"+list[i].reply+"</p>"
					str+="</div></li>";
					
				}
				replyUL.html(str);
				showReplyPage(replyCnt);
				
				
			}) // getList 함수 호출 끝
	}	// showList 함수 선언 끝
	
	
	// 댓글쓰기 버튼 클릭 시 modal 실행
	var modal = $(".modal");
	// <input class="form-control" name="reply" value="New Reply!!!"> 선택
	var modalInputReply = modal.find("input[name='reply']");				// 속성선택자
	// <input class="form-control" name="replyer" value="replyer"> 선택
	var modalInputReplyer = modal.find("input[name='replyer']");
	// <input class="form-control" name="replyDate" value=""> 선택
	var modalInputReplyDate = modal.find("input[name='replyDate']");
	
	
	// <button id="modalModBtn" type="button" class="btn btn-warning">Modify</button> 선택
	var modalModBtn = $("#modalModBtn");
	// <button id="modalRemoveBtn" type="button" class="btn btn-danger" data-dismiss="modal">Remove</button> 선택
	var modalRemoveBtn = $("#modalRemoveBtn");
	// <button id="modalCloseBtn" type="button" class="btn btn-default" data-dismiss="modal">Close</button> 선택
	var modalRegisterBtn = $("#modalRegisterBtn");
	var modalCloseBtn=$("#modalCloseBtn")// 모달 닫기 버튼
	
	$("#addReplyBtn").on("click", function(e) {
		
		//modal.find("input").val("");							// 입력창(input)의 value 값을 공백으로 만들어라
		modalInputReplyer.attr("readonly", "readonly");
		modalInputReplyDate.closest("div").hide();				// 날짜 입력 숨기기
		modal.find("button[id != 'modalCloseBtn']").hide();		// close 버튼 빼고 button은 다 숨겨라
		
		modalRegisterBtn.show();
		modalCloseBtn.click(function(){modal.modal("hide")})
		$(".modal").modal("show");
	})
	
	modalRegisterBtn.on("click", function(e) {
		
		var reply = {
				reply : modalInputReply.val(),
				replyer: modalInputReplyer.val(),
				bno : bnoValue
			};
		replyService.add(reply, function(result) {
			
			alert(result);
			showList(1);
			}
			
			)
			modal.find("input").val("");
			modal.modal("hide");
			
			
		})
		
		// 특정 댓글 내용을 클릭 이벤트로 처리
		$(".chat").on("click", "li", function(e) {
			// data-rno -> data("rno")
			var rno = $(this).data("rno");
			
			// console.log(rno);
			
			replyService.get(rno, function(reply) {
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer).attr("readonly", "readonly");
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
				modal.data("rno", reply.rno);
				
				modal.find("button[id != 'modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				modalCloseBtn.click(function(){modal.modal("hide")})
				$(".modal").modal("show");
			})
		})
		
		// 댓글 수정 처리
		modalModBtn.on("click", function(e) {
			
			var reply = {rno:modal.data("rno"), reply : modalInputReply.val()};
			
			replyService.update(reply, function(result) {
				
				alert("수정 완료");
				modal.modal("hide");
				showList(pageNum);
			});
		});
		
		// 댓글 삭제 처리
	modalRemoveBtn.on("click",function(e){
		var rno=modal.data("rno");
		
		replyService.remove(// remove함수 호출 시작
				rno,					// rno
				function(count){	// callback 함수 시작
				console.log(count);
				
					if(count === "success"){
						alert("removed");
						modal.modal("hide");
						showList(pageNum);
					}
				},					// callback 함수 끝
				function(error){	// 에러처리 함수 시작
					alert("error.....");
				}					// 에러처리 함수 끝
			)// remove함수 호출 끝
	})
	// 댓글의 페이징 버튼을 클릭하면
	replyPageFooter.on("click","li a",function(e){
		e.preventDefault();
		console.log("page click");
		var targetPageNum=$(this).attr("href");
		
		console.log("targetPageNum : "+targetPageNum);
		pageNum = targetPageNum;
		showList(pageNum);
		modal.find("input").val("");
	})
	})












// replyService 함수 선언부
var replyService = (function() {
	
	
	// add 함수
	function add(reply, callback, error) {				// add 함수 선언 시작
				// 매개변수는 사용자에게 필요한 것들
		console.log("reply......")
		
		
		$.ajax({											// ajax 시작
			type: 'post',
			url : '/replies/new',	// from 태그의 action과 같은 서버 주소
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})													// ajax 끝
	}													// add 함수 선언 끝
	
	
	// getList 함수
	function getList(param, callback, error) {			// getList 함수 선언 시작
			var bno = param.bno;
			var page = param.page || 1;
			
			$.getJSON("/replies/pages/" + bno + "/" + page + ".json", 
				function(data) {
					if (callback) {
						callback(data.replyCnt, data.list);
					}
			})	// getJSON 끝
			.fail(function(xhr, status, err) {
				if (error) {
					error();
				}
			});	// fail 끝
	}													// getList 함수 선언 끝
	
	
	
	// remove 함수 
	function remove(rno, callback, error) {				// romove 함수 선언 시작
		$.ajax({	// ajax 시작								// ajax 시작
			type: "delete",
			url: "/replies/" + rno,
			success : function(result, status, xhr) {			// 삭제 성공했을 때 시작
				if (callback) {
					callback(result);
				}
			},													// 삭제 성공했을 때 끝 
			error : function(xhr, status, er) {					// 삭제 실패했을 때 시작
				if (error) {
					error(er);
				}
			}													// 삭제 실패했을 때 끝
			
		})													// ajax 끝
	}													// remove 함수 선언 끝
	
	
	
	// update 함수
	function update(reply, callback, error) {			// update 함수 선언 시작 
		console.log("RNO = " + reply.rno);
		$.ajax({											// ajax 시작
			type: "put",
			url: "/replies/" + reply.rno,
			data: JSON.stringify(reply),
			contentType : "application/json; charset=UTF-8",
			success : function(result, status, xhr) {			// 수정 성공했을 때 시작 
				if (callback) {
					callback(result);
				}
			},													// 수정 성공했을 때 끝
			error : function(xhr, status, er) {					// 수정 실패했을 때 시
				if (error) {
					error(er);
				}
			}													// 수정 실패했을 때 끝
			
		})													// ajax 
	}													// update 함수 선언 끝
	
	
	
	// get 함수(댓글 상세페이지) 시작
	function get(rno, callback, error) {				// get 함수 선언 시작
		$.get("/replies/" + rno + ".json", 	// get은 타입 (타입이 get인 것은 ajax를 줄여 쓸 수 있음 vs update의 ajax)
			function(result) {
				if (callback) {
					callback(result);
				}
		})
		.fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}													// get 함수 선언 끝
	// get 함수(댓글 상세페이지) 끝
	
	
	
	
	// 시간에 대한 함수	
	function displayTime(timeValue) {
		var today = new Date();	// 현재 날짜
		var gap = today.getTime() - timeValue;
					// 현재시간 - 화면에서 넘어온 시간
		var dateObj = new Date(timeValue);
		var str = "";
		
		if (gap < (1000*60*60*24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ].join('');
		} else{
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();
			
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	
	
	
	
	
	
	
	
	return {
		add:add, 
		getList:getList,
		remove:remove,
		update:update,
		get:get,
		displayTime:displayTime
		};
})();

