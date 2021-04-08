package kr.or.ddit.common.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PageServlet")
public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tarUrl = "/WEB-INF" + req.getParameter("targetUrl");
		
//		RequestDispatcher disp = req.getRequestDispatcher(req.getContextPath() + tarUrl);
		RequestDispatcher disp = req.getRequestDispatcher(tarUrl);
		disp.forward(req, resp);
			
	}
	
}
