package com.ptsd.mvc.user;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<UserDto> AllUser() {
		List<UserDto> list = new ArrayList<UserDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"userlist");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public UserDto myuser(int userseq) {
		
		return null;
	}

	@Override
	public UserDto login(UserDto dto) {
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "login", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertUser(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertUser", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updateUser(UserDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "updateUser", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	

	@Override
	public String idCheck(String userid) {
		String res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE + "idChk", userid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public String emailCheck(String email) {
		String res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE + "emailChk", email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	

	
	
	@Override
	public String phoneCheck(String phone) {
		
		String res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE + "phoneChk", phone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public UserDto idFind(UserDto dto) {
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "idFind", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public UserDto pwFind(UserDto dto) {
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "pwFind", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public int pwUpdate(UserDto pwUpdate) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "pwupdate", pwUpdate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public UserDto snsCheck(UserDto dto) {
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "snsChk", dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}

	
	@Override
	public UserDto mypage(int userseq) {
		
		UserDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "mypage", userseq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public int delete(int userseq) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "userdelete", userseq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
		
	}
	
	@Override
	public List<UserDto> usersearch(String name){
List<UserDto> list = new ArrayList<UserDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"usersearch", name);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return list;
	}
	
}
