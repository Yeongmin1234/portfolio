/**
 * 
 */
$(document).ready(function(){
	$('.container_in').each(function(){
		let $ls = $('.man_menu ul'),
		$lsPoint = $ls.find('li'),
		$lb=  $(this).find('.man_content')
		$ls.on('click','li',function(event){
			event.preventDefault();
			
			if($(this).hasClass('active')){
				return false;
			}
			
			$lsPoint.removeClass('active');
			$(this).addClass('active');
			$lb.hide()
			$($(this).find('a').attr('href')).show()
		})
		$lsPoint.eq(0).trigger('click')
	})
	$('#pwBtn').click(function(){
		if($("input[name='user_pw']").val()==""){
			alert("비밀번호를 입력해 주세요");
			return false;
		} else if($("#pw22").val()!=$("input[name='user_pw']").val()){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		} else{
			alert("비밀번호가 변경되었습니다")
		}
	})
	$(".fire").click(function(){
		var con_test = confirm("정말 탈퇴를 하시겠습니까??");
		if(con_test == true){
			alert("회원탈퇴 되었습니다.");
			return true;
		}
		else if(con_test == false){
			alert("회원탈퇴가 취소되었습니다.");
			return false;
		}
	})
})