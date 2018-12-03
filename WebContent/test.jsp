<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	function addDiv(){
		var newDiv = document.createElement("div");
		newDiv.id="myData";
		newDiv.className = "abc";
		newDiv.innerHTML = "<p>hello</p>"
		document.getElementById('test').prepend(newDiv);//append, appendchild, prepend 
	}
</script>
<div id="test">여기 밑으로</div>
<table border="1">
	<tr>
		<td>test1</td>
		<td>test2</td>
	</tr>
</table>
<input type="button" value="추가" onclick="addDiv()">

</body>
</html>