package com.cos.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.BoardDAO;
import com.cos.dao.ReBoardDAO;
import com.cos.dto.BoardVO;
import com.cos.dto.ReBoardVO;
import com.cos.socket.BroadSocket;
import com.cos.util.MyUtil;
import com.cos.util.Script;
import com.google.gson.Gson;

public class BoardViewAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "board/viewPage.jsp";

		BoardDAO dao = new BoardDAO();
		ReBoardDAO rdao = new ReBoardDAO();

		int num = Integer.parseInt(request.getParameter("num"));		

		// 조회가 일어날때 웹소켓 통신 실행!!
		// 조회가 일어나기전에 hotpost를 먼저 검색해서 컬렉션이 담아둬야 비교가능
		// 조회가 실행뒤 hotpost를 들고와서 이전 컬렉션이라아 for문을 돌면서 비교!
		// 변경이 있으면 웹소켓 통신 실행 모든 클라이언트에게 전송
		boolean change = false; // true일때 실행
		List<BoardVO> hotpost1 = dao.hotpost();
		
		// 조회수 증가
		int result = dao.readcount(num);
		
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

		BoardVO board = dao.select(num);
		List<ReBoardVO> reboards = rdao.select_list(num);

		if (result == -1 && board == null) {
			Script.moving(response, "DB 에러");
		} else {
			board.setTitle(MyUtil.getReplace(board.getTitle()));
			board.setContent(MyUtil.makeYoutube(board.getContent()));
			request.setAttribute("board", board);
			request.setAttribute("reboards", reboards);

			RequestDispatcher dis = request.getRequestDispatcher(url);
			dis.forward(request, response);
		}
	}
}
