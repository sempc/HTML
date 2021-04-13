package kr.or.ddit.common;

import java.util.List;
import java.util.ArrayList;

public class DditUtils {
	
	public static List<String> getListByArr(String[] arrStr) {
		List<String> list = new ArrayList<String>();
		for(int i=0 ; i<arrStr.length ; i++) {
			list.add(arrStr[i]);
		}
		return list;
	}
	
}
