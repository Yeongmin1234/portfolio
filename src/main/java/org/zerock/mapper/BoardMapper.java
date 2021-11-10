package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardMapper {	// 인터페이스
	// 추상메서드(게시판 목록 리스트 : 페이징 처리 X)
	public List<BoardVO> getList();	
	
	// 추상메서드(게시판 목록 리스트 : 페이징 처리 O)
	public List<BoardVO> getListWithPaging(Criteria cri);
	// tbl_board 테이블의 전체 개수
	public int getTotalCount(Criteria cri);
	
	// 추상메서드(게시판 글쓰기) -> insert만 처리되고 생성된 pk값을 알 필요가 없는 경우 (단순 게시글)
	public void insert(BoardVO board);
		// 데이터를 가져오기만 하기 때문에 return값이 없음 -> void
	
	// 추상메서드(게시판 글쓰기) -> insert가 처리되고 생성된 pk값을 알아야 하는 경우 (단순 게시글 + 첨부파일)
	public void insertSelectKey(BoardVO board);
	
	// 추상메서드(게스판 목록 리스트에서 제목을 클릭한 후 나오는 상세페이지 조회)
	public BoardVO read(int bno);
	
	// 추상메서드(게시판 글 삭제)
	public int delete(int bno);
			// 리턴타입을 int로 가져간 것은 작업된 건수를 알림창 등에 표시하기 위함
	
	// 추상메서드(게시판 글 수정)
	public int update(BoardVO board);
	
	// 댓글 추가 시 tbl_board 테이블 replycnt 컬럼에 +1
	public void updateReplyCnt(@Param("bno") int bno, @Param("amount") int amount);
								// 매개변수가 2개일 때는 @Param 필
	
	public void updateHit(int bno);
	
}
