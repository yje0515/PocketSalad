package com.jieun.controller.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jieun.dao.BoardDAO;
import com.jieun.dto.BoardVO;

public class BoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="/board/boardView.jsp";
		String num = request.getParameter("num");
		BoardDAO bDao = BoardDAO.getInstance();
		bDao.updateReadCount(num);//게시물 조회수(readcount+1)를 증감하는 메소드
		BoardVO bVo = bDao.selectOneBoardByNum(num);  //num 글번호로 해당하는 행의 정보를 객체로 반환하는 메소드
		request.setAttribute("board", bVo);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		
	}

}
