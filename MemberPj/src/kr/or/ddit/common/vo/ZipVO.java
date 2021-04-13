package kr.or.ddit.common.vo;

import kr.or.ddit.base.vo.BaseVO;

public class ZipVO  extends BaseVO{
	private String zipType;//주소검색 화면에서 사용 하는 flag
	private String zipcode;
	private String sido   ;
	private String gugun  ;
	private String dong   ;
	private String ri     ;
	private String bldb   ;
	private String bunji  ;
	private int    seq    ;

	public String getZipType() {
		return zipType;
	}
	public void setZipType(String zipType) {
		this.zipType = zipType;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getRi() {
		return ri;
	}
	public void setRi(String ri) {
		this.ri = ri;
	}
	public String getBldb() {
		return bldb;
	}
	public void setBldb(String bldb) {
		this.bldb = bldb;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
}
