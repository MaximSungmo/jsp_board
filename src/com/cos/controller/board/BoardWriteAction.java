package com.cos.controller.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.action.Action;
import com.cos.dao.BoardDAO;
import com.cos.dao.MemberDAO;
import com.cos.dto.BoardVO;
import com.cos.util.Script;

public class BoardWriteAction implements Action {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String url = "index.jsp";
    
    BoardVO board = new BoardVO();
    BoardDAO dao = new BoardDAO();
    MemberDAO mdao = new MemberDAO();
    
    String id = null;
    HttpSession session = request.getSession();
    if (session.getAttribute("id") != null) {
      id = (String) session.getAttribute("id");
      int result = mdao.select_emailcheck(id);
      if (result != 1) {
        Script.moving(response, "먼저 인증을 진행해주세요.", "member?cmd=member_update");
      } else {
        board.setId(id);
        board.setTitle(request.getParameter("title"));
        board.setCategoryNum(Integer.parseInt(request.getParameter("categoryNum")));
        board.setContent(request.getParameter("content"));       
        board.setSubCategory(request.getParameter("subCategory"));
        System.out.println("와우: 2" + request.getParameter("subCategory"));        
        
        int result2 = dao.insert(board);
        if (result2 == 1) {
          Script.moving(response, "글쓰기 성공", url);
        } else if (result2 == -1) {
          Script.moving(response, "DB 에러");
        }
      }
    } else {
      Script.moving(response, "먼저 로그인을 진행해주세요.", "member/loginForm.jsp");
    }
    
  }
  
}