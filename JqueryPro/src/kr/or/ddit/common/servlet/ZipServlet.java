package kr.or.ddit.common.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CodeServlet
 */
@WebServlet("/CodeServlet")
public class ZipServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ZipServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String groupCode = request.getParameter("groupCode");
		
//		CodeVO codeVo = new CodeVO();
//		codeVo.setMemId(memId);
		
		//회원 목록 조회
//		MemberService service = new MemberService();
//		List<MemberVO> list = service.retrieveMemberList(memberVo);
//		return list;
		
		
	}

}
