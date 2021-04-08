package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.member.dao.MemberDao;
import kr.or.ddit.member.vo.MemberVO;

public class MemberService_v1 {

	public List<MemberVO> retrieveMemberList(MemberVO memberVo) throws SQLException {
		// TODO Auto-generated method stub
		
		//사전 작업~
		
		MemberDao dao = new MemberDao();
		List<MemberVO> list = dao.retrieveMemberList(memberVo);
		return list;
	}
	
}
