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
    
    int result = dao.readcount(num);
    
    BoardVO board = dao.select(num);
    List<ReBoardVO> reboards = rdao.select_list(num);        
    
    
    if (result == -1 && board == null) {
      Script.moving(response, "DB 에러");
    } else {
      board.setTitle(MyUtil.getReplace(board.getTitle()));
      board.setContent(MyUtil.makeYoutube(board.getContent()));
      board.setUsername(board.getUsername());
      request.setAttribute("board", board);
      request.setAttribute("reboards", reboards);
      System.out.println(board.getUsername());
      
      RequestDispatcher dis = request.getRequestDispatcher(url);
      dis.forward(request, response);
    }
  }
}
