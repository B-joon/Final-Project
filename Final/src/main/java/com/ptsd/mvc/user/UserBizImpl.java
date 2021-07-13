package com.ptsd.mvc.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserBizImpl implements UserBiz {
	
	@Autowired
	private UserDao dao;
	
	@Override
	public List<UserDto> AllUser() {
		// TODO Auto-generated method stub
		return dao.AllUser();
	}

	@Override
	public UserDto myuser(int userseq) {
		// TODO Auto-generated method stub
		return dao.myuser(userseq);
	}

	@Override
	public UserDto login(UserDto dto) {
		// TODO Auto-generated method stub
		return dao.login(dto);
	}

	@Override
	public int insertUser(UserDto dto) {
		// TODO Auto-generated method stub
		return dao.insertUser(dto);
	}

	@Override
	public int updateUser(UserDto dto) {
		// TODO Auto-generated method stub
		return dao.updateUser(dto);
	}

	

	@Override
	public String idCheck(String userid) {
		return dao.idCheck(userid);
	}

	@Override
	public String emailCheck(String email) {
		// TODO Auto-generated method stub
		return dao.emailCheck(email);
	}

	

	
	@Override
	public String phoneCheck(String phone) {
		
		return dao.phoneCheck(phone);
	}
	
	@Override
	public UserDto idFind(UserDto dto) {
		
		return dao.idFind(dto);
	}
	
	@Override
	public UserDto pwFind(UserDto dto) {
		
		return dao.pwFind(dto);
	}
	
	@Override
	public int pwUpdate(UserDto pwUpdate) {
		
		return dao.pwUpdate(pwUpdate);
	}
	
	@Override
	public UserDto snsCheck(UserDto dto) {
		
		return dao.snsCheck(dto);
	}
	
	@Override
	public UserDto mypage(int userseq) {
		
		return dao.mypage(userseq);
	}
	
	@Override
	public int delete(int userseq) {
		
		return dao.delete(userseq);
	}
	
	@Override
	public List<UserDto> usersearch(String name){
		
		return dao.usersearch(name);
	}
	
}
