<%@page import="com.cos.dto.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.cos.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty list}">
	<%
		RequestDispatcher dis = request.getRequestDispatcher("board?cmd=board_list");
			dis.forward(request, response);
	%>
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Cos Blog</title>
<!-- Bootstrap core CSS -->
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/css/blog-home.css"
	rel="stylesheet">
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

				<c:forEach var="item" items="${list}">
					<!-- Blog Post -->
					<div class="card mb-4">
						<!--<img class="card-img-top" src="http://placehold.it/750x300" alt="Card image cap"> -->
						<div class="card-body">
							<h2 class="card-title">${item.title}</h2>
							<p class="card-text">${item.content}</p>
							<a
								href="<%=request.getContextPath()%>/board?cmd=board_view&num=${item.num}"
								class="btn btn-primary">Read More &rarr;</a>
						</div>
						<div class="card-footer text-muted">
							Posted on ${item.writedate} <a href="#">${item.id}</a>
						</div>
					</div>
				</c:forEach>
				<!-- Pagination -->
				<%
					int pageNum = 0;
					if (request.getAttribute("pageNum") != null) {
						pageNum = (Integer) request.getAttribute("pageNum");
					}

					BoardDAO dao = new BoardDAO();
					int result = dao.nextPage(pageNum + 3);
					pageContext.setAttribute("result", result);
				%>
				<c:choose>
					<c:when test="${pageNum == 0}">
						<ul class="pagination justify-content-center mb-4">
							<li class="page-item disabled"><a class="page-link" href="#">&larr;
									Prev</a></li>
							<li class="page-item"><a class="page-link"
								href="<%=request.getContextPath()%>/board?cmd=board_list&pageNum=${pageNum+3}">Next
									&rarr;</a></li>
						</ul>
					</c:when>
					<c:when test="${result == 1}">
						<ul class="pagination justify-content-center mb-4">
							<li class="page-item"><a class="page-link"
								href="<%=request.getContextPath()%>/board?cmd=board_list&pageNum=${pageNum-3}">&larr;
									Prev</a></li>
							<li class="page-item"><a class="page-link"
								href="<%=request.getContextPath()%>/board?cmd=board_list&pageNum=${pageNum+3}">Next
									&rarr;</a></li>
						</ul>
					</c:when>
					<c:when test="${result == -1}">
						<ul class="pagination justify-content-center mb-4">
							<li class="page-item"><a class="page-link"
								href="<%=request.getContextPath()%>/board?cmd=board_list&pageNum=${pageNum-3}">&larr;
									Prev</a></li>
							<li class="page-item disabled"><a class="page-link" href="#">Next
									&rarr;</a></li>
						</ul>
					</c:when>
				</c:choose>
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
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>


	<!-- web socket -->
	<script type="text/javascript">
		var list = document.querySelectorAll('.list-group-item');
		var textarea = document.getElementById("messageWindow");
		var webSocket = new WebSocket('ws://54.180.80.8:8080/Blog/broadCasting');
		var inputMessage = document.getElementById('inputMessage');
		webSocket.onerror = function(event) {
			onError(event)
		};
		webSocket.onopen = function(event) {
			onOpen(event)
		};
		webSocket.onmessage = function(event) {
			onMessage(event)
		};
		function onMessage(event) {
			var data = JSON.parse(event.data);
			list[0].textContent = '조회'+data[0].readcount+' '+data[0].title;
			list[1].textContent = '조회'+data[1].readcount+' '+data[1].title;
			list[2].textContent = '조회'+data[2].readcount+' '+data[2].title;
		}
		function onOpen(event) {
			textarea.value += "연결 성공\n";
		}
		function onError(event) {
			alert(event.data);
		}
		function send() {
			textarea.value += "나 : " + inputMessage.value + "\n";
			webSocket.send(inputMessage.value);
			inputMessage.value = "";
		}
	</script>
</body>
</html>
