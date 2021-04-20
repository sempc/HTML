package kr.or.ddit.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;

import kr.or.ddit.member.service.MemberService;
import kr.or.ddit.member.vo.MemberVO;


@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 브라우저로 부터 받은 값을 사용하기 위해 request에서 parameter를 get.
		String flag = req.getParameter("flag");
		
		try {
			if("CHKID".equals(flag)) { // ID 체크
				// case1) jsp로 forward 하는 방법
//				checkMemberId(req, resp);
				// case2) PrintWriter를 사용하는 방법
				checkMemberId2(req, resp);
				
			} else if("L".equals(flag)) { // 목록조회
				// case1) jsp로 forward 하는 방법
//				retrieveMemberList(req, resp);
				// case2) Gson을 사용하는 방법
				retrieveMemberList1(req, resp);
				
			} else if("C".equals(flag)) { // 등록
				createMember(req);
				
				req.setAttribute("resultCnt", 1);
				RequestDispatcher  disp 
				  = req.getRequestDispatcher("/html/common/checkResult.jsp");
				disp.forward(req, resp);
				
			} else if("R".equals(flag)) { // 단건 조회
				
			} else if("U".equals(flag)) { // 수정
				
			} else if("D".equals(flag)) { // 삭제
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	private void checkMemberId(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String memId = req.getParameter("memId");
			
			MemberService service = new MemberService();
			MemberVO memberVo = service.retrieveMember(memId);
			
			int resultCnt = 0;
			if(memberVo != null) {
				resultCnt = 1;
			}
			
			/** jsp로 forward 적용 부분 **************************/
			req.setAttribute("resultCnt", resultCnt);
			RequestDispatcher  disp = req.getRequestDispatcher("/html/common/checkResult.jsp");
			disp.forward(req, resp);
			/*************************************************/
			
		} catch(Exception e) {
			e.printStackTrace();
		}

	}

	private void checkMemberId2(HttpServletRequest req, HttpServletResponse resp) {
		String strJson = "";
		try {
			String memId = req.getParameter("memId");
			
			MemberService service = new MemberService();
			MemberVO memberVo = service.retrieveMember(memId);
			
			if(memberVo != null) {
				strJson = "{ \"resultCnt\" : 1 }";
			}
			
			
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.print(strJson);
			
		} catch(Exception e) {
			e.printStackTrace();
			
			if(e instanceof SQLException) {
				strJson = "{"
						+ " \"resultCnt\" : 0 "
						+ "}";
			} else {
				strJson = "{"
						+ " \"resultCnt\" : 0 "
						+ ",\"resultMsg\" : \"" + e.getMessage() +"\""
						+ "}";
			}
			
//		} finally {
//			try {
//				/** PrintWriter 적용 부분 ***************************/
//				resp.setContentType("application/json");
//				resp.setCharacterEncoding("UTF-8");
//				
//				PrintWriter out = resp.getWriter();
//				out.print(strJson);
////				out.flush();
//				/*************************************************/
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
		}
		
	}
	
	private void createMember(HttpServletRequest req) throws Exception {
		// 기존 방법
//		String memId = req.getParameter("memId");
//		String memName = req.getParameter("memName");
//		// 그외 정보들...
//		MemberVO memberVo = new MemberVO();
//		memberVo.setMemId(memId);
//		memberVo.setMemName(memName);
//		// 그 외 정보들 VO에 세팅...
		
		MemberVO memberVo = new MemberVO();
		BeanUtils.populate(memberVo, req.getParameterMap());
		
		MemberService service = new MemberService();
		service.createMember(memberVo);
		
	}

	private void retrieveMemberList(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		try {
			String memId = req.getParameter("memId");
			String memName = req.getParameter("memName");
			
			MemberVO memberVo = new MemberVO();
			memberVo.setMemId(memId);
			memberVo.setMemName(memName);
			
			//회원 목록 조회
			MemberService service = new MemberService();
			List<MemberVO> list = service.retrieveMemberList(memberVo);
			
			/** jsp로 forward 적용 부분 **************************/
			req.setAttribute("list", list);
			RequestDispatcher  disp = req.getRequestDispatcher("/html/member/memberListResult.jsp");
			disp.forward(req, resp);
			/*************************************************/
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void retrieveMemberList1(HttpServletRequest req, HttpServletResponse resp) throws SQLException {
		try {
			String memId = req.getParameter("memId");
			String memName = req.getParameter("memName");
			
			MemberVO memberVo = new MemberVO();
			memberVo.setMemId(memId);
			memberVo.setMemName(memName);
			
			//회원 목록 조회
			MemberService service = new MemberService();
			List<MemberVO> list = service.retrieveMemberList(memberVo);
			
			/** Gson 적용 부분 **********************************/
			Gson gson = new Gson();
			String strJson =  gson.toJson(list);
			
			resp.setContentType("application/json");
			resp.setCharacterEncoding("UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.print(strJson);
			out.flush();
			out.close();
			/*************************************************/
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
