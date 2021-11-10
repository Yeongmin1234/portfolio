package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/join/*")   
public class UserController {
	
	private UserService service;
	
	//회원정보
	@GetMapping("info")
	public void read(String user_id, Model model) {
		log.info("info" + user_id);
		service.get(user_id);
		model.addAttribute("info",service.get(user_id));
	}
	
	//회원가입
	@GetMapping("membership")
	public void membership(UserVO user) {
		log.info("membership");
//		service.register(user);
	}
	@PostMapping("membership")
	public String membershipPost(UserVO user, RedirectAttributes rttr) {
		service.register(user);
//		rttr.addAttribute("user_id",user.getUser_id());
		return "redirect:/";
	}
	//회원 정보 수정
	@GetMapping("edit")
	public void modify(String user_id, Model model) {
		log.info("edit");
		model.addAttribute("edit",service.get(user_id));
	}

	@PostMapping("edit")
	public String modifyPost(UserVO user, RedirectAttributes rttr,Model model) {
		service.modify(user);
		rttr.addAttribute("user_id",user.getUser_id());
		
		return "redirect:/join/info";
	}
	//회원 pw 수정
	@PostMapping("pwEdit")
	public String pwModifyPost(UserVO user, RedirectAttributes rttr,Model model) {
		log.info("pwEdit="+user);
		service.pwModify(user);
		rttr.addAttribute("user_id",user.getUser_id());
		
		return "redirect:/join/info";
	}
	
	@GetMapping("mbOut")
	public String remove(String user_id,HttpSession session) {
		log.info("mbOut="+user_id);
		service.remove(user_id);
		session.removeAttribute("abcd");
		return "redirect:/";
		//탈퇴 알림창을 띄운후 홈화면으로
	}
	
	
	
	//회원가입 끝@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	//세션로그인테스트
	@GetMapping("login")
	public void login() {
	}
	
	
	@GetMapping("find")
	public void find() {
		log.info("find");
	}
	
	

	//세션로그인실행테스트
	@PostMapping("login")
	public String sessionLoginPost(UserVO user, HttpSession session,HttpServletRequest request) {	
		log.info("login Post="+user);

		//변수 선언
		user=service.login(user);
		//service.login에 member라는 매개변수(infoVO의 내용)를 저장하는 info라는 변수
		session.setAttribute("abcd", user); //세션의 adbd라는 변수에 info를 저장
		
		log.info("login session="+user);
		if(session.getAttribute("abcd")!=null) { // adbd가 null이 아니면
			return "redirect:/"; // main화면으로 이동
		}else {
			return "redirect:/join/login"; //null이면 다시 로그인화면으로 이동
		}
		
	}// session로그인 끝
	
	//로그아웃
	@GetMapping("logout")
	public String logoutPost(HttpSession session) {
		log.info("로그아웃 서비스 처리");
		session.removeAttribute("abcd");
		return "redirect:/";
		// 또는, session.invalidate(); -> 모든 속성 제거
	}
	
}
