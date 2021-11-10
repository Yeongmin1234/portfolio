package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria { // 데이터로 정보를 보냄
	// 1. 페이지 번호(pageNum)
	private int pageNum;
	// 2. 한 페이지당 몇 개의 데이터를 보여줄 것인지? (amount)
	private int amount;
	
	// 3. 검색종류
	private String type;
	// 4. keyword
	private String keyword;
	
	
	public Criteria() {		// 생성자를 이용한 초기화
		this(1, 10);		// 초기화가 되었기 때문에 초기화면은 1페이지의 게시글 10가 자동으로 설정 됨
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	public String getListlink() {
		UriComponentsBuilder builder=UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		return builder.toString();
			
		}

	
}
