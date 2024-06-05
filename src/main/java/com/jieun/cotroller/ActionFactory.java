package com.jieun.cotroller;

import com.jieun.controller.action.Action;
import com.jieun.controller.action.BoardCheckPassAction;
import com.jieun.controller.action.BoardCheckPassFormAction;
import com.jieun.controller.action.BoardDeleteAction;
import com.jieun.controller.action.BoardListAction;
import com.jieun.controller.action.BoardUpdateAction;
import com.jieun.controller.action.BoardUpdateFormAction;
import com.jieun.controller.action.BoardViewAction;
import com.jieun.controller.action.BoardWriteAction;
import com.jieun.controller.action.BoardWriteFormAction;

public class ActionFactory {
	
	private static ActionFactory instance = new ActionFactory(); //싱글톤
	private ActionFactory() {
		super();
	}
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) { //인터페이스를 구현한 자손클래스들 전부 사용가능하게 가장 상위클래스를 반환하는군아
		Action action = null;
		System.out.println("ActionFactory : "+command);
		
		
		if(command.equals("board_list")) {
			action = new BoardListAction();
			
			
		}else if(command.equals("board_write_form")) {
			action = new BoardWriteFormAction();
		}else if(command.equals("board_write")) {
			action = new BoardWriteAction();   
			
			
		}else if(command.equals("board_view")) {
			action= new BoardViewAction();
			
			
		}else if(command.equals("board_check_pass_form")) {
			action = new BoardCheckPassFormAction();
		}else if(command.equals("board_check_pass")) {
			action = new BoardCheckPassAction();
			
			
		}else if(command.equals("board_update_form")) {
			action = new BoardUpdateFormAction();
		}else if(command.equals("board_update")) {
			action = new BoardUpdateAction();
			
		}else if(command.equals("board_delete")) {
			action = new BoardDeleteAction();
		}
		
		return action;
	}
}
