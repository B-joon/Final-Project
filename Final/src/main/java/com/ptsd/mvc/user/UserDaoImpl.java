package com.ptsd.mvc.user;

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
		// TODO Auto-generated method stub
		return null;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(int userseq) {
		// TODO Auto-generated method stub
		return 0;
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
	public UserDto nicnameCheck(String nickname) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserDto> userSearch(String userid) {
		// TODO Auto-generated method stub
		return null;
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

}
