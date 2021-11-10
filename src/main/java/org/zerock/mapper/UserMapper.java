package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.UserVO;

public interface UserMapper {
		// (회원가입)
		public void insert(UserVO user);
		
		// (회원 정보 조회)
		public UserVO read(String user_id);
		
		// (회원탈퇴)
		public void delete(String user_id);
		
		// (회원정보수정)
		public void update(UserVO user);
		
		public void pwUpdate(UserVO user);
		
		public UserVO login(UserVO user);
}
