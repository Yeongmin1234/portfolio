package org.zerock.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.domain.UserVO;
import org.zerock.domain.ReplyPageDTO;

public interface UserService {
	// (회원가입) - Create
	public void register(UserVO user);
	
	// (회원 정보 조회)  - Read
	public UserVO get (String user_id);
	
	// (회원탈퇴)  - delete
	public void remove(String user_id);
	
	// (회원정보수정) - update
	public void modify(UserVO user);

	public void pwModify(UserVO user);
	
	public UserVO login(UserVO user);
}
