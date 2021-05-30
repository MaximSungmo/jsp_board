package com.cos.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.action.Action;
import com.cos.dao.BoardDAO;
import com.cos.util.Script;

public class BoardDeleteAction implements Action {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String url = "index.jsp";
    BoardDAO dao = new BoardDAO();
    
    int num = Integer.parseInt(request.getParameter("num"));
    HttpSession session = request.getSession();
    String sessionId = (String) session.getAttribute("id");
    
    int result2 = dao.checkId(num, sessionId);
    if(sessionId.equals("admin")) {
      result2 = 1;
    }
    
    if (result2 == 1) {      
      int result = dao.delete(num);
      
      if (result == 1) {
        Script.moving(response, "삭제되었습니다.", url);
      } else if (result == -1) {
        Script.moving(response, "DB 에러");
      }
    } else {
      Script.moving(response, "잘못된 접근입니다.");
    }
  }
  
}
