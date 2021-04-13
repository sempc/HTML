package kr.or.ddit.common.service;

import java.util.List;

import kr.or.ddit.common.dao.CodeDao;
import kr.or.ddit.common.vo.CodeVO;

public class CodeService {
	private CodeDao dao;
	
	public CodeService() {
		if(dao == null)
			dao = new CodeDao();
	}
	
	public CodeVO retrieveCode(CodeVO codeVo) throws Exception {
		return dao.retrieveCode(codeVo);
	}
	
	public List<CodeVO> retrieveCodeList(CodeVO codeVo) throws Exception {
		if("JOB".equals(codeVo.getGroupCode())) {
			return dao.retrieveJobList(codeVo);
			
		} else {
			CodeVO pCodeVo = new CodeVO();
			pCodeVo.setGroupCode(codeVo.getGroupCode());
			pCodeVo.setUseYn(CodeVO.Y);
			return dao.retrieveCodeList(codeVo);
		}
	}
	
}
