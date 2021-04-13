package kr.or.ddit.common.dao;

import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.base.dao.BaseDao;
import kr.or.ddit.common.vo.ZipVO;

public class ZipDao extends BaseDao {
	
	private SqlMapClient smc;
	
	public ZipDao() {
		//super : BaseDao의 getConnection 이라는 뜻
		smc = super.getSqlMapClient();
	}
	
	@SuppressWarnings("unchecked")
	public List<ZipVO> retrieveZipList(ZipVO zipVo) throws Exception {
		return smc.queryForList("zip.retrieveZipList", zipVo);
	}

	@SuppressWarnings("unchecked")
	public List<ZipVO> retrieveSidoList() throws Exception {
		return smc.queryForList("zip.retrieveSidoList");
	}
	
	@SuppressWarnings("unchecked")
	public List<ZipVO> retrieveGugunList(ZipVO zipVo) throws Exception {
		return smc.queryForList("zip.retrieveGugunList", zipVo);
	}
	
	@SuppressWarnings("unchecked")
	public List<ZipVO> retrieveDongList(ZipVO zipVo) throws Exception {
		return smc.queryForList("zip.retrieveDongList", zipVo);
	}

}
