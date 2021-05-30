package com.cos.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.BoardDAO;
import com.cos.dto.BoardVO;
import com.cos.dto.Paging;
import com.cos.util.MyUtil;

public class AdminAction implements Action {
  @Override
  public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String url = "admin.jsp";
    
    BoardDAO dao = new BoardDAO();
    String categoryNum = request.getParameter("categoryNum");
    if (categoryNum == null) {
      categoryNum = "0";
    }
    System.out.println("categoryNum : " + categoryNum);
    
    int totalCount = dao.getTotalCount(Integer.parseInt(categoryNum));
    int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
    System.out.println("page : " + page);
    
    Paging paging = new Paging();
    paging.setPageNo(page); // get방식의 parameter값으로 반은 page변수, 현재 페이지 번호
    paging.setPageSize(10); // 한페이지에 불러낼 게시물의 개수 지정
    paging.setTotalCount(totalCount);
    
    page = (page - 1) * 10; // select해오는 기준을 구한다.
    
    List<BoardVO> list = dao.select_paging(Integer.parseInt(categoryNum), page, paging.getPageSize());
    
    if (list.isEmpty()) {
      request.setAttribute("list", null);
      request.setAttribute("paging", paging);
      request.setAttribute("categoryNum", categoryNum);
      RequestDispatcher dis = request.getRequestDispatcher(url);
      dis.forward(request, response);
    } else {
      for (int i = 0; i < list.size(); i++) {
        String title = MyUtil.getReplace(list.get(i).getTitle());
        list.get(i).setTitle(title);
      }
      
      for (int i = 0; i < list.size(); i++) {
        String content = list.get(i).getContent();
        list.get(i).setContent(MyUtil.preview(content));
      }
      
      request.setAttribute("list", list);
      request.setAttribute("categoryNum", categoryNum);
      request.setAttribute("paging", paging);
      
      RequestDispatcher dis = request.getRequestDispatcher(url);
      dis.forward(request, response);
    }
    
  }
}
