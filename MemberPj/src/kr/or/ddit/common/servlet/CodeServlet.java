package kr.or.ddit.common.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.service.CodeService;
import kr.or.ddit.common.vo.CodeVO;

@WebServlet("/CodeServlet")
public class CodeServlet extends HttpServlet {
	private static final long serialVersionUID = -2240836530796039084L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		retrieveCode(request, response);
	}

	private void retrieveCode(HttpServletRequest request, HttpServletResponse response) {
		try {
			String groupCode = request.getParameter("groupCode");
			CodeVO codeVo = new CodeVO();
			codeVo.setGroupCode(groupCode);
			
			CodeService codeService = new CodeService();
			List<CodeVO> list = codeService.retrieveCodeList(codeVo);
			request.setAttribute("list", list);
			
			String rturl = request.getParameter("rturl");
			if(rturl == null) rturl = "/html/com/codeList.jsp";
			
			RequestDispatcher  disp = request.getRequestDispatcher(rturl);
			disp.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
