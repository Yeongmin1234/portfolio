package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardVO {	// sql의 데이터와 동일
	
	private int bno;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int hit;
	private int replyCnt;
	
	
	private List<BoardAttachVO> attachList;
}
