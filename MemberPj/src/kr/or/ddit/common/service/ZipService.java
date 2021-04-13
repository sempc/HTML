package kr.or.ddit.common.service;

import java.util.List;

import kr.or.ddit.common.dao.ZipDao;
import kr.or.ddit.common.vo.ZipVO;

public class ZipService {
	private ZipDao dao;
	
	public ZipService() {
		if(dao == null)
			dao = new ZipDao();
	}
	
	public List<ZipVO> retrieveZipList(ZipVO zipVo) throws Exception {
		String zipType = zipVo.getZipType();
		
		if(ZipVO.ZIP_TYPE_SIDO.equals(zipType)) {
			return dao.retrieveSidoList();
			
		} else if(ZipVO.ZIP_TYPE_GUGUN.equals(zipType)) {
			return dao.retrieveGugunList(zipVo);
		} else if(ZipVO.ZIP_TYPE_DONG.equals(zipType)) {
			return dao.retrieveDongList(zipVo);
		} else {
			return dao.retrieveZipList(zipVo);
		}
	}
	
}
