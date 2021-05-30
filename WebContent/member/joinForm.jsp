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
        <form name="form" id="form" method="POST" action="<%=request.getContextPath()%>/member?cmd=member_join" onsubmit="return hangulCheck(this)">
          <div style="display: flex; flex-direction=column;">
            <div class="form-group">
              <label class="form-control-label">ID</label> <input class="form-control form-control-lg" type="text" name="id" maxlength="20" required autofocus>
            </div>
            <div class="form-group">
              <label class="form-control-label">Password</label> <input class="form-control form-control-lg" type="password" name="password" maxlength="20" required>
            </div>
            <div class="form-group">
              <label class="form-control-label">Confirm_Password</label> <input class="form-control form-control-lg" type="password" name="confirm" maxlength="20" required>
            </div>
            <div class="form-group">
              <label class="form-control-label">Username</label> <input class="form-control form-control-lg" type="text" name="username" maxlength="20" required>
            </div>
            <!-- 
              <div class="form-group">
                <label class="form-control-label">Address</label>
                <button class="btn btn-outline-info float-right" type="button" onclick="goPopup()">Search Korean Address</button>
                <div id="list"></div>
                <div id="callBackDiv">
                  <input class="form-control form-control-lg" type="text" name="roadFullAddr" id="roadFullAddr" maxlength="20" required readonly>
                </div>
              </div>
               -->
            <div class="form-group">
              <label class="form-control-label">Email</label> <input class="form-control form-control-lg" type="email" name="email" maxlength="50" required>
            </div>
            <div class="border-top pt-3">
              <small class="text-muted"> Already Have An Account? <a class="ml-2" href="<%=request.getContextPath()%>/member/loginForm.jsp">Login</a>
              </small>
            </div>
            <div class="form-group">
              <button class="btn btn-outline-info" type="submit">Sign in</button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <%@ include file="/layout/footer.jsp"%>
  </div>
</body>
</html>
