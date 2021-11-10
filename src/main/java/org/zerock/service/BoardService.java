package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	
	// 게시판 목록 리스트 (페이징 처리 X)
//	public List<BoardVO> getList();
	// 게시판 목록 리스트 (페이징 처리 O)
	public List<BoardVO> getListNo(Criteria cri);
	
	// tbl_board 테이블의 전체 개수
	public int getTotalCountNo(Criteria cri);
	
	// 게시판 글쓰기
	public void registerNo(BoardVO board);
	// 게시판 상세페이지
	public BoardVO getNo(int bno);
	// 게시판 글 수정
	public boolean modifyNo(BoardVO board);
	// 게시판 글 삭제
	public boolean removeNo(int bno);
	
	public List<BoardAttachVO> getAttachList(int bno);
	
	
	
}
