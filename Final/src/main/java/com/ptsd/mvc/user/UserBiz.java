package com.ptsd.mvc.user;

import java.util.List;

public interface UserBiz {

	public List<UserDto> AllUser();
	public UserDto myuser(int userseq);
	public UserDto login(UserDto dto);
	public int insertUser(UserDto dto);
	public int updateUser(UserDto dto);
	public String idCheck(String userid);
	public String emailCheck(String email);
	public String phoneCheck(String phone);
	public UserDto idFind(UserDto dto);
	public UserDto pwFind(UserDto dto);
	public int pwUpdate(UserDto pwUpdate);
	public UserDto snsCheck(UserDto dto);
	public UserDto mypage(int userseq);
	public int delete(int userseq);
	public List<UserDto> usersearch(String name);
}
