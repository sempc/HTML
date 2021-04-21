package kr.or.ddit.base.vo;

//ConstVO
public class ConstVO {

	public final static String Y = "Y";
	public final static String N = "N";
	
	public final static String VIEW_ROOT = "/WEB-INF/view";
	
	//sql에서 사용하고자 할 때 get메서드 생성
	public static String getN() {
		return N;
	}
	
}
