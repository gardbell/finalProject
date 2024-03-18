package com.ace.member.model;

import java.sql.*;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int memberJoin(MemberDTO dto) {
		
		int cout = sqlMap.insert("memberInsert", dto);
		return cout;
	}

	public boolean idCheck(String userid) {
		String result = sqlMap.selectOne("idCheck", userid);
		boolean res = result==null?false:true;
		return res;
	}

	public int loginCheck(String userid, String userpwd) {
		try {
			String result = sqlMap.selectOne("memberLogin", userid);
			//System.out.println(result+"/"+userid+"/"+userpwd);
			if (result!=null) {
				if(result.equals(userpwd)) {
					return LOGIN_OK;
				}else {
					return NOT_PWD;
				}		
			}else {
				return NOT_ID;
			}
		}
		catch (Exception e) {
			return ERROR;
		}
	}

	public MemberDTO getUserInfo(String userid) {
		MemberDTO dto = sqlMap.selectOne("getUserInfo",userid);
		return dto;
	}

}
