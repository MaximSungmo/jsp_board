<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Cos Blog</title>
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/blog-home.css" rel="stylesheet">
<!-- Bootstrap core JavaScript -->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
</head>
<body>
  <!-- Nav Include -->
  <jsp:include page="/include/header.jsp" />
  <!-- Page Content -->
  <div class="container">
    <div class="row">
      <!-- Blog Entries Column -->
      <div class="col-md-8">
        <div class="content-section">
          <form name="form" id="form" method="POST" action="<%=request.getContextPath()%>/member?cmd=member_updateProc">
            <fieldset class="form-group">
              <legend class="border-bottom mb-4">Update</legend>
              <div class="form-group">
                <label class="form-control-label">ID</label> <input class="form-control form-control-lg" type="text" name="id" maxlength="20" required autofocus readonly value="${member.id}">
              </div>
              <div class="form-group">
                <label class="form-control-label">Password</label> <input class="form-control form-control-lg" type="password" name="password" maxlength="20" required>
              </div>
              <div class="form-group">
                <label class="form-control-label">Confirm_Password</label> <input class="form-control form-control-lg" type="password" name="confirm" maxlength="20" required>
              </div>
              <div class="form-group">
                <label class="form-control-label">Username</label> <input class="form-control form-control-lg" type="text" name="username" maxlength="20" required readonly value="${member.username}">
              </div>              
              <div class="form-group">
                <label class="form-control-label">Email</label> <input class="form-control form-control-lg" type="email" name="email" maxlength="20" required value="${member.email}">
              </div>
              <div class="form-group">
                <button class="btn btn-outline-info" type="submit">Modified</button>
                <c:if test="${member.emailcheck == false}">
                  <a href="<%=request.getContextPath()%>/gmail/emailSendAction.jsp" class="btn btn-outline-danger"> Authenticate </a>
                </c:if>
              </div>
            </fieldset>
          </form>
        </div>
      </div>
      <!-- SideBar Include -->
      <jsp:include page="/include/aside.jsp" />
    </div>
    <!-- /.row -->
  </div>
  <!-- /.container -->
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
    </div>
    <!-- /.container -->
  </footer>
</body>
</html>
