package kr.or.ddit.member.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/MemberCheckServlet")
public class MemberCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		try {
			String memId = request.getParameter("memId");
			
			MemberService service = new MemberService();
			MemberVO resultVo = service.retrieveMember(memId);
			
			int resultCnt = 0;
			if(resultVo != null) {
				resultCnt = 1;
			}
			request.setAttribute("resultCnt", resultCnt);
			
			String url = "html/member/result.jsp";
			RequestDispatcher  disp = request.getRequestDispatcher(url);
			disp.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}

