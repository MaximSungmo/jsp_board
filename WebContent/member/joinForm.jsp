<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="/layout/header.jsp"%>
<body>
  <div id="wrap">
    <div id="topheader">
      <div id="indexColumn">
        <%@ include file="/layout/gnb.jsp"%>
      </div>
    </div>
    <div id="middle">
      <div id="contbody" class="clearfix">
        <div id="contentcore" class="contentcore">
          <h2 class="gnb6">회원가입</h2>
          <form name="form" id="form" method="POST" action="<%=request.getContextPath()%>/member?cmd=member_join" onsubmit="return hangulCheck(this)">
            <div style="display: flex; flex-direction: column; justify-content: center; align-content: center">
              <label class="form-control-label">ID</label> <input class="form-control form-control-lg" type="text" name="id" maxlength="20" required autofocus>
              <label class="form-control-label">Password</label> <input class="form-control form-control-lg" type="password" name="password" maxlength="20" required>
              <label class="form-control-label">Confirm_Password</label> <input class="form-control form-control-lg" type="password" name="confirm" maxlength="20" required>
              <label class="form-control-label">Username</label> <input class="form-control form-control-lg" type="text" name="username" maxlength="20" required>
              <label class="form-control-label">Email</label> <input class="form-control form-control-lg" type="email" name="email" maxlength="50" required>
              <small class="text-muted"> 아이디가 있으십니까? <a class="ml-2" href="<%=request.getContextPath()%>/member/loginForm.jsp">로그인</a></small>
              <br>
              <button type="submit" style="background-color: slategray; color: white">회원가입</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <%@ include file="/layout/footer.jsp"%>
  </div>
</body>
</html>
