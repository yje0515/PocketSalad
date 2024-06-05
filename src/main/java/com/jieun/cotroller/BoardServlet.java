package com.jieun.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jieun.controller.action.Action;


@WebServlet("/BoardServlet")
public class BoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public BoardServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		System.out.println("BoardServlet에서 요청을 받음을 확인 :"+command);
		
		ActionFactory af = ActionFactory.getInstance();// ActionFactory에 있는 Action을 반환하는 메서드 getAction을 실행하기 위해 인스턴스화, 싱글톤
		
		Action action = af.getAction(command); //가장 상위객체interface Action 하위객체 자손클래스들을 얻어올거임 메서드는 ActionFactory 
		
		if(action !=null) {
			action.execute(request, response); //각각 클래스에 맞게 Override된 메소드 실행 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
