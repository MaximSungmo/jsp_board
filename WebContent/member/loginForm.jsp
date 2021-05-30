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
          <h2 class="gnb6">로그인</h2>
          <form name="form" id="form" method="POST" action="<%=request.getContextPath()%>/member?cmd=member_login" onsubmit="return hangulCheck(this)">
            <div style="display: flex; flex-direction: column; justify-content: center; align-content: center">              
                <label class="form-control-label">ID</label> <input type="text" name="id" maxlength="20" required autofocus>
                <label class="form-control-label">Password</label> <input type="password" name="password" maxlength="20" required>
                <small class="text-muted"> Remember Me? <input type="checkbox" name="idsave" value="on"></small>
                <br>
                <button type="submit" style="background-color: slategray; color: white">로그인</button>              
            </div>
          </form>
        </div>
      </div>
    </div>
    <%@ include file="/layout/footer.jsp"%>
  </div>
</body>
</html>