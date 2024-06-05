package com.jieun.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jieun.dao.BoardDAO;
import com.jieun.dto.BoardVO;

public class BoardListAction implements Action{

	@Override //DB에서 게시글 전체 정보를 가져온다  board_list
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/board/boardList.jsp";
		BoardDAO bDao = BoardDAO.getInstance();
		
		//현재페이지 정보 기본값은 1 (따로 요청사항이 없을시 parameter가 없음. null 예외처리)
		int page = Integer.parseInt(request.getParameter("page") == null ? "1" : request.getParameter("page"));
		int pageStart = (int) Math.floor((page-0.1) / 10)   * 10 + 1; //1~10까지는 1이 나오게
		int pageEnd = (int) Math.floor((page-0.1) / 10)   * 10 + 10;  //시작페이지번호와 끝페이지번호를 계산 10페이지 단위로 표시
		
		int pageMax = bDao.getMaxPage();
		
		if (pageMax <= pageEnd) {
			pageEnd = pageMax;
		}
		System.out.println(page + ", " + pageStart + ", " + pageEnd + ", " + pageMax);
		
		request.setAttribute("page", page);
		request.setAttribute("pagestart", pageStart);
		request.setAttribute("pageend", pageEnd);
		request.setAttribute("pagemax", pageMax);
		List<BoardVO> boardList = bDao.selectAllBoards(page);//현재 선택한 int page를 기준으로 해당되는 게시글 목록을 불러오는 쿼리문을 가진 메소드
		
		request.setAttribute("boardList", boardList);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
