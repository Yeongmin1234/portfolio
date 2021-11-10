package org.zerock.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	
	// 시작 페이지
	private int startPage;
	// 마지막 페이지
	private int endPage;
	// 이전버튼, 다음버튼 표시 유무
	private boolean prev, next;
	// tbl_board 테이블의 전체 개수
	private int total;
	// Criteria
	private Criteria cri;
	
	public PageDTO (Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage=(int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
		
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil(   (total * 1.0) / cri.getAmount()   ));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		// 이전 버튼 유무
		this.prev = this.startPage > 1;
		// 다음 버튼 유무
		this.next = this.endPage < realEnd;
	}
}
