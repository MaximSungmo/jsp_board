package com.cos.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.BoardDAO;
import com.cos.dto.BoardVO;
import com.cos.socket.BroadSocket;
import com.cos.util.MyUtil;
import com.cos.util.Script;
import com.google.gson.Gson;

public class BoardUpdateProcAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVO board = new BoardVO();
		BoardDAO dao = new BoardDAO();
		board.setNum(Integer.parseInt(request.getParameter("num")));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		
		String url = "board?cmd=board_view&num="+board.getNum();
		
		boolean change = false; // true일때 실행
		List<BoardVO> hotpost1 = dao.hotpost();
		
		int result = dao.update(board);
		
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
		
		if(result == 1) {
			Script.moving(response, "글 수정 성공", url);
		}else if(result == -1) {
			Script.moving(response, "DB 에러");
		}
	}
}
