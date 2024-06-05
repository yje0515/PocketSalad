package com.jieun.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jieun.dao.BoardDAO;
import com.jieun.dto.BoardVO;

public class BoardCheckPassAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = null;
		String num = request.getParameter("num");
		String pass = request.getParameter("pass");  //비밀번호 확인창에서 입력한 pass
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardVO bVo = bDao.selectOneBoardByNum(num); //DB에서 글번호(num)로 행의 정보를 불러와서 객체에 담음
		if(bVo.getPass().equals(pass)) { //DB의 pass와 input에 입력한 pass의 값이 같다면
			url="/board/checkSuccess.jsp";
		}else {
			url="/board/boardCheckPass.jsp";//다시 비밀번호 확인창으로
			request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response); 
		
	}

}
