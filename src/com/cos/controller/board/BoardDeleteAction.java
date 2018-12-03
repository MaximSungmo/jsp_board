package com.cos.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.action.Action;
import com.cos.dao.BoardDAO;
import com.cos.dto.BoardVO;
import com.cos.socket.BroadSocket;
import com.cos.util.MyUtil;
import com.cos.util.Script;
import com.google.gson.Gson;

public class BoardDeleteAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "index.jsp";
		BoardDAO dao = new BoardDAO();
		
		//(1) num 값 받기
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("id");
		
		int result2 = dao.checkId(num, sessionId);		
		
		//(2) num값으로 DAO에 delete함수 호출해서 db레코드 삭제
		if(result2 == 1) {
			boolean change = false; // true일때 실행
			List<BoardVO> hotpost1 = dao.hotpost();
			
			int result = dao.delete(num);
			
			List<BoardVO> hotpost2 = dao.hotpost();
			
			change = MyUtil.getBoardChange(hotpost1, hotpost2);
			
			if(change) {
				Gson gson = new Gson();
				String json = gson.toJson(hotpost2);
				try {
					BroadSocket.serverMessage(json);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			//(3) index.jsp로 이동!! forward필요 없음. 왜? request들고갈 정보 업음.
			if(result == 1) {
				Script.moving(response, "삭제되었습니다.", url);
			}else if(result == -1) {
				Script.moving(response, "DB 오류");
			}
		}else {
			Script.moving(response, "잘못된 접근입니다.");
		}
	}
	
	
	
	
	
	
	
}
