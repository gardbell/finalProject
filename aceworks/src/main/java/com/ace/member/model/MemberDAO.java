package com.ace.member.model;

import java.util.List;

public interface MemberDAO {
	int NOT_ID = 1;
	int NOT_PWD = 2;
	int LOGIN_OK = 3;
	int ERROR = -1;
	public int memberJoin(MemberDTO dto);
	public boolean idCheck(String userid);
	public int loginCheck(String userid, String userpwd);
	public MemberDTO getUserInfo(String userid);
}
