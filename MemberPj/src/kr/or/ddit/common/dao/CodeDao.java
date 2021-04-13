package kr.or.ddit.common.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.base.dao.BaseDao;
import kr.or.ddit.common.vo.CodeVO;

public class CodeDao extends BaseDao {
	
	private SqlMapClient smc;
	
	public CodeDao() {
		//super : BaseDao의 getConnection 이라는 뜻
		smc = super.getSqlMapClient();
	}
	
	public CodeVO retrieveCode(CodeVO codeVo) throws Exception {
		return (CodeVO) smc.queryForObject("code.retrieveCode", codeVo);
		
	}
	@SuppressWarnings("unchecked")
	public List<CodeVO> retrieveCodeList(CodeVO codeVo) throws Exception {
		return smc.queryForList("code.retrieveCodeList", codeVo);
		
	}

	@SuppressWarnings("unchecked")
	public List<CodeVO> retrieveJobList(CodeVO codeVo) throws Exception {
		return smc.queryForList("code.retrieveJobList", codeVo);
		
	}
	/* 그룹코드 그룹코드명 코드 코드명 코드설명 등록일자 등록자 수정일자 수정자 */

}
