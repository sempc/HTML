package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.base.dao.BaseDao;
import kr.or.ddit.member.vo.MemberVO;

public class MemberDao extends BaseDao {
	private SqlMapClient smc;
	
	public MemberDao() {
		smc = super.getSqlMapClient();
	}
	
	public void createMember() throws SQLException {
		smc.insert("member.createMember");
	}
	public void updateMember() throws SQLException {
		smc.update("member.updateMember");
	}
	public void deleteMember() throws SQLException {
		smc.delete("member.deleteMember");
	}
	public List<MemberVO> retrieveMemberList(MemberVO memberVo) throws SQLException {
		return smc.queryForList("member.retrieveMemberList", memberVo);
	}
	
}
