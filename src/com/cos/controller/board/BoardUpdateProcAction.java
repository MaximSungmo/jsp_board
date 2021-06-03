package com.cos.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.BoardDAO;
import com.cos.dto.BoardVO;
import com.cos.util.MyUtil;
import com.cos.util.Script;
import com.google.gson.Gson;

public class BoardUpdateProcAction implements Action {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    BoardVO board = new BoardVO();
    BoardDAO dao = new BoardDAO();
    board.setNum(Integer.parseInt(request.getParameter("num")));
    board.setTitle(request.getParameter("title"));
    board.setContent(request.getParameter("content"));
    board.setSubCategory(request.getParameter("subCategory"));
    System.out.println("와우:2 " + request.getParameter("subCategory"));    
    
    String url = "board?cmd=board_view&num=" + board.getNum();
    
    int result = dao.update(board);
    
    if (result == 1) {
      Script.moving(response, "수정되었습니다.", url);
    } else if (result == -1) {
      Script.moving(response, "DB 에러");
    }
  }
}
