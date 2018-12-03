package com.cos.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cos.action.Action;
import com.cos.dao.MemberDAO;
import com.cos.dto.MemberVO;
import com.cos.util.Script;

public class MemberUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "member/updateForm.jsp";
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		MemberDAO dao = new MemberDAO();
		MemberVO member = dao.select(id);
		
		request.setAttribute("member", member);
		
		if(member == null) {
			Script.moving(response, "DB 에러");
		}else {
			RequestDispatcher dis = request.getRequestDispatcher(url);
			dis.forward(request, response);
		}
	}
}
