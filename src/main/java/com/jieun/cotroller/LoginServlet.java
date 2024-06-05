package com.jieun.cotroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jieun.dao.MemberDAO;
import com.jieun.dto.MemberVO;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="member/login.jsp";
		HttpSession session = request.getSession();
		//이미 로그인 된 사용자라면 메인페이지로 이동
		if (session.getAttribute("loginUser") != null) {
			url = "index.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("member/login.jsp");//url로 바꿔야 바로 main으로 넘어감
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
		String url = "member/login.jsp";
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		//아이디 저장하기 rememberid
		String rememberid = request.getParameter("rememberid");
		Cookie cookie = new Cookie("userid",userid);
		if(rememberid !=null) {//아이디 저장 체크되었을때
			response.addCookie(cookie);
		}else { //아이디 저장 체크되지 않았을 때
			cookie.setMaxAge(0); //유효시간을 0으로 해서 저장 바로 만료되게
			response.addCookie(cookie);
		}
		
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.userCheck(userid, pwd);
		if(result==1) {
			
			MemberVO mVo = mDao.getMember(userid);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser",mVo);//회원정보 변수에 저장
			request.setAttribute("message", "회원가입에 성공했습니다.");
			url="index.jsp";  //메인페이지로 이동
			
		}else if(result==0) {
			request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
		}else if(result==-1) {
			request.setAttribute("message", "회원정보가 존재하지 않습니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request,response);
	}

}
