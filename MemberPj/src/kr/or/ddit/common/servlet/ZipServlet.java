package kr.or.ddit.common.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.common.service.ZipService;
import kr.or.ddit.common.vo.ZipVO;

@WebServlet("/ZipServlet")
public class ZipServlet extends HttpServlet {
	private static final long serialVersionUID = -2240836530796039084L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		retrieveZipcodeList(request, response);
	}

	private void retrieveZipcodeList(HttpServletRequest request, HttpServletResponse response) {
		try {
			ZipVO zipVo = new ZipVO();
			BeanUtils.populate(zipVo, request.getParameterMap());
			
			ZipService zipService = new ZipService();
			List<ZipVO> list = zipService.retrieveZipList(zipVo);
			
			request.setAttribute("list", list);
			
			String rturl = request.getParameter("rturl");
			if(rturl == null) rturl = "/html/com/zipList.jsp";
			
			RequestDispatcher  disp = request.getRequestDispatcher(rturl);
			disp.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
