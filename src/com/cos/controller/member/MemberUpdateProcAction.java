package com.cos.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cos.action.Action;
import com.cos.dao.MemberDAO;
import com.cos.dto.MemberVO;
import com.cos.util.SHA256;
import com.cos.util.Script;

public class MemberUpdateProcAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url ="member?cmd=member_update";
		
		MemberDAO dao = new MemberDAO();
		MemberVO member = new MemberVO();
		
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		String salt = dao.select_salt(id);
		String password = SHA256.getEncrypt(request.getParameter("password"), salt);		
		String email = request.getParameter("email");
		
		member.setId(id);
		member.setPassword(password);
		member.setUsername(username);
		member.setEmail(email);		
		
		int result = dao.update(member);
		if(result == 1) {
			Script.moving(response, "회원 정보 변경하였습니다.", url);
		}else if(result == -1) {
			Script.moving(response, "DB 에러");
		}
	}	
	
}
