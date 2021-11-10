package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;

public interface ReplyMapper {

	// 댓글쓰기(insert)		Create
	public int insert(ReplyVO vo);	// 인터페이스의 매개변수는 사용자로부터 받아야 하는 자료
	
	// 댓글상세페이지(select)	Read
	public ReplyVO read(int rno);	// (select 된 결과가 한 건이니까 ReplyVO 타입)
	
	// 댓글삭제(delete)		Delete
	public int delete(int rno);
	
	// 댓글수정(update)		Update
//	public int update(int rno, String reply);
	public int update(ReplyVO vo);
	
	// 댓글목록리스트(select)
			// (select 된 결과가 여러 건이니까 ArrayList 타입)
	public List<ReplyVO> getListWithPaging(@Param("cri") Criteria cri,	// 넘겨야 할 매개변수가 2개 이상일 때 -> Param
										   @Param("bno") int bno);
	public int getCountByBno(int bno);
	
	
	
}
