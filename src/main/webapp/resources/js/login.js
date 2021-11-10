/**
 * 
 */

	
$(document).ready(function(){
	//var id=document.querySelector("#user_id");
	//var	pw=document.querySelector("#user_pw1");	
	
	$("button[type='submit']").on("click",function(e){
	if($("#user_id").val().length==0){
		alert("아이디를 확인하세요");
		return false;
	} else if($("#user_pw1").val().length==0){
		alert("비밀번호를 확인하세요");
		return false;
	}
})
	
})	
	

