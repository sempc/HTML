package kr.or.ddit.common.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.service.CodeService;
import kr.or.ddit.common.vo.CodeVO;

/**
 * Servlet implementation class CodeServlet
 */
@WebServlet("/CodeServlet")
public class CodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String groupCode = request.getParameter("groupCode");
		
		CodeVO codeVo = new CodeVO();
		codeVo.setGroupCode(groupCode);
		
		//코드 목록 조회
		CodeService service = new CodeService();
		List<CodeVO> list;
		try {
			list = service.retrieveCodeList(codeVo);
			request.setAttribute("list", list);
			RequestDispatcher  disp = request.getRequestDispatcher("/html/common/codeListResult.jsp");
			disp.forward(request, response);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
