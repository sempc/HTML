package kr.or.ddit.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.base.vo.BaseVO;
import kr.or.ddit.common.DditUtils;

//import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 7428836381231581524L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		retrieveMemberList(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		switch(action) {
		case MemberVO.ACTION_C:
			createMember(request, response);
			return;
		case MemberVO.ACTION_R:
			retrieveMember(request, response);
			return;
		case MemberVO.ACTION_U:
			updateMember(request, response);
			return;
		case MemberVO.ACTION_D:
			deleteMember(request, response);
			return;
		default:
			retrieveMemberList(request, response);
		}
		
	}
	
	private void retrieveMemberList(HttpServletRequest request, HttpServletResponse response) {
		try {
			MemberVO memberVo = new MemberVO();
			memberVo.setMemId(request.getParameter("memId"));
			memberVo.setMemName(request.getParameter("memName"));
			
			MemberService service = new MemberService();
			Map<Object, Object> resultMap = service.retrieveMemberList(memberVo);
			
			@SuppressWarnings("unchecked")
			List<MemberVO> list = (List<MemberVO>) resultMap.get("list");
			request.setAttribute("list", list);
			
			int count = (int) resultMap.get("count");
			request.setAttribute("count", count);
			
			RequestDispatcher  disp = request.getRequestDispatcher("html/member/resultList.jsp");
			disp.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void retrieveMember(HttpServletRequest request, HttpServletResponse response) {
		try {
			String memId = request.getParameter("memId");
			String viewType = request.getParameter("viewType");
			
			MemberService service = new MemberService();
			MemberVO resultVo = service.retrieveMemberInfo(memId);
			
			request.setAttribute("memberVo", resultVo);
			
			String url = "";
			if(viewType == null || viewType.length() == 0) {
				url = "html/member/memberView.jsp";
			} else if(BaseVO.VIEW_TYPE_EDIT.equals(viewType)) {
				url = "html/member/memberEdit.jsp";
			}
			
			RequestDispatcher  disp = request.getRequestDispatcher(url);
			disp.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void createMember(HttpServletRequest request, HttpServletResponse response) {
		String jsonString = "";
		try {
			
			MemberVO memberVO = new MemberVO();
			BeanUtils.populate(memberVO, request.getParameterMap());
			
			String[] hobby = request.getParameterValues("memLike1");
			memberVO.setHobbyList(DditUtils.getListByArr(hobby));
			
			MemberService service = new MemberService();
			int cnt = service.createMember(memberVO);
			
			//처리방법 1) JSP 만들어서 forward 하는 방법
//			request.setAttribute("resultCnt", cnt);
//			RequestDispatcher disp = request.getRequestDispatcher("html/member/result.jsp");
//			disp.forward(request, response);

			//처리방법 2) spring 사용하면 JsonView를 이용할 수 있음

			//처리방법 3) response.getWriter() 사용하는 방법
			jsonString = "{\"resultCnt\" : "+cnt+"}";
			
			//처리방법 4) google lib 등 JSON을 만들어주는 lib를 이용해서 서블릿에서 JSON을 만들고 req.setAttr 에 담고 forward 한다.
			//String strJson = {~~~}; //by google lib 
			//req.setAttr("strJson", strJson);
			//disp = forward("common.jsp");
			
		} catch (Exception e) {
			if(!(e instanceof SQLException)
					&& !(e instanceof IllegalAccessException)
					&& !(e instanceof InvocationTargetException)
					) {
				jsonString = "{	\"resultCnt\" : 0"
						+ ",\"resultMsg\" : "+e.getMessage()+"}";
			} else {
				jsonString = "{	\"resultCnt\" : 0}";
			}
			
			e.printStackTrace();
			
		} finally {
			try {
				PrintWriter out = response.getWriter();
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				out.print(jsonString);
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	private void updateMember(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			MemberVO memberVO = new MemberVO();
			BeanUtils.populate(memberVO, request.getParameterMap());
			
			MemberService service = new MemberService();
			int resCnt = service.updateMember(memberVO);
			
			request.setAttribute("resultCount", resCnt);
			RequestDispatcher  disp = request.getRequestDispatcher("html/member/memberEdit.jsp");
			disp.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void deleteMember(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			String memId = request.getParameter("memId");
			
			MemberService service = new MemberService();
			int resCnt = service.deleteMember(memId);
			
			request.setAttribute("resultCount", resCnt);
			
			RequestDispatcher  disp = request.getRequestDispatcher("html/member/memberView.jsp");
			disp.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void deleteMember_org(HttpServletRequest request, HttpServletResponse response) {
		int resCnt = 0;
		String msg = "";
		try {
			
			String memId = request.getParameter("memId");
			
			MemberService service = new MemberService();
			resCnt = service.deleteMember(memId);
		} catch (Exception e) {
			e.printStackTrace();
			msg = e.getMessage();
		}
		
		try {
			request.setAttribute("resultCount", resCnt);
			request.setAttribute("resultMessage", msg);
			RequestDispatcher  disp = request.getRequestDispatcher("html/member/memberView.jsp");
			disp.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}

