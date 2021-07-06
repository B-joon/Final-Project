package com.ptsd.mvc.user;

import java.util.List;

public interface UserBiz {

	public List<UserDto> AllUser();
	public UserDto myuser(int userseq);
	public UserDto login(UserDto dto);
	public int insertUser(UserDto dto);
	public int updateUser(UserDto dto);
	public int deleteUser(int userseq);
	public String idCheck(String userid);
	public String emailCheck(String email);
	public UserDto nicnameCheck(String nickname);
	public List<UserDto> userSearch(String userid);
	public String phoneCheck(String phone);
	public String idFind(String name, String email);
	public String pwFind(String userid, String email);
}
