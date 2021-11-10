package org.zerock.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller		// 이 자바 클래스는 컨트롤러 역할을 하는 클래스라는 것을 알려줌.
@Log4j			// lombok 이용하여 콘솔에 logger를 남기겠다. 
@RequestMapping("/board/")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	UploadController upload;
	
	@GetMapping("list")
	public void listNo(Model model, Criteria cri) {
		log.info("list good="+cri);
		model.addAttribute("list", service.getListNo(cri));
		int total=service.getTotalCountNo(cri);	
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	
	@GetMapping("read")
	public void readNo(int bno, Model model) {
		
		log.info("@@@@@@@@@@ read : " + bno + " @@@@@@@@@@");
		model.addAttribute("read", service.getNo(bno));
	}
	
	
	
	@GetMapping("register")
	public void registerGetNo() {
		
		log.info("@@@@@@@@@@ register good @@@@@@@@@@");
	}
	@PostMapping("register")
	public String registerPostNo(BoardVO board, RedirectAttributes rttr) {
		
		if(board.getAttachList()!=null) {
			board.getAttachList().forEach(attach->log.info(attach));
		}
		
		service.registerNo(board);
		rttr.addAttribute("bno", board.getBno());
		return "redirect:/board/read";
	}
	
	
	
	@GetMapping("modify")
	public void modifyGetNo(int bno, Model model) {
		log.info("@@@@@@@@@@ modify good bno : " + bno +" @@@@@@@@@@");
		model.addAttribute("modify", service.getNo(bno));
	}
	@PostMapping("modify")
	public String modifyPostNo(BoardVO board, RedirectAttributes rttr, Model model) {
		model.addAttribute("result", service.modifyNo(board));
		rttr.addAttribute("bno", board.getBno());
		return "redirect:/board/read";
	}
	
	
	
	@GetMapping("remove")
	public String removeNo(int bno) {
		log.info("@@@@@@@@@@ remove good bno : " + bno + " @@@@@@@@@@");
		
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		Criteria cri= new Criteria();
		if(service.removeNo(bno)) {
			
			deleteFile(attachList);
			
		}
		
		
		return "redirect:/board/list";
	}
	@GetMapping(value="getAttachList",produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList (int bno){
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
	

	@PostMapping("/deleteFile")
	@ResponseBody
	public void deleteFile(List<BoardAttachVO> attachList) {
		
		if(attachList == null || attachList.size()==0) {
			return;
		}

		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\"+attach.getUploadpath()+"\\"+
			attach.getUuid()+"\\"+"_"+attach.getFilename());
				Files.deleteIfExists(file);
				
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadpath()+"\\"+
			attach.getUuid()+"\\"+"_"+attach.getFilename());
					
					Files.delete(thumbNail);}
			} catch(Exception e) {
				log.error("delete"+e.getMessage());
			}

	});
}
	}