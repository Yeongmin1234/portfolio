package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
import org.zerock.domain.UserVO;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.ReplyMapper;
import org.zerock.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService{
	
	private UserMapper mapper;
	
	public void register(UserVO user) {
		mapper.insert(user);
	}

	public UserVO get(String user_id) {
		return mapper.read(user_id);
	}
	
	public void remove(String user_id) {
		System.out.println("service remove="+user_id);
		//log.info("service remove="+user_id);
		mapper.delete(user_id);
	}

	public void modify(UserVO user) {
		mapper.update(user);
	}
	public void pwModify(UserVO user) {
		log.info("service="+user);
		mapper.pwUpdate(user);
	}
	
	
	//로그인!@@@@@@@@@@2
	
	public UserVO login(UserVO user) {
		return mapper.login(user);
	}
}
