<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="ko">
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
        <%@ include file="/layout/lnb.jsp"%>
        <div id="contentcore" class="excludeSearch">
          <div>          
          <c:choose>
            <c:when test="${sessionScope.id eq 'admin'}">             
              <a style="color: blue;" href="<%=request.getContextPath()%>/board?cmd=board_update&num=${board.num}">수정</a>
              <a style="color: blue;" href="<%=request.getContextPath()%>/board?cmd=board_delete&num=${board.num}">삭제</a>
            </c:when>
            <c:when test="${board.id eq sessionScope.id} ">
              <a style="color: blue;" href="<%=request.getContextPath()%>/board?cmd=board_update&num=${board.num}">수정</a>
              <a style="color: blue;" href="<%=request.getContextPath()%>/board?cmd=board_delete&num=${board.num}">삭제</a>
            </c:when>            
          </c:choose>       
             
          </div>
          <div class="boardWrap">
            <table class="board-view">
              <caption>게시물 내용 상세보기</caption>
              <colgroup>
                <col style="width: 120px;">
                <col>
              </colgroup>
              <tbody>                
                <tr>
                  <th scope="row">제목</th>
                  <td>${board.title}</td>
                </tr>
                <tr>
                  <th scope="row">작성자</th>
                  <td>${board.username}(${board.id})</td>
                </tr>
                <tr>
                  <th scope="row">등록일</th>
                  <td>${board.writedate}</td>
                </tr>
                <tr>
                  <th scope="row">조회수</th>
                  <td>${board.readcount}</td>
                </tr>
                <tr>
                  <td colspan="2">${board.content }</td>
                </tr>
              </tbody>
            </table>
          </div>
          <script>
    function addDiv(renum, num, id, recontent){
      var newDiv = document.createElement('div');
      newDiv.className = 'media mb-4';
      newDiv.innerHTML = "<a href='<%=request.getContextPath()%>/reboard?cmd=reboard_delete&renum="+renum+"&num="+num+"'><img class='d-flex mr-3 rounded-circle' src='<%=request.getContextPath()%>/img/clear.png'></a><div class='media-body'><h5 class='mt-0'>" + id + "</h5>" + recontent + "</div>"; 
      document.getElementById('reply').prepend(newDiv);
                      }

                      function sendReply() {
                        var replyData = document.getElementById("replyData");
                        var recontent = replyData.value;
                        if (recontent == '') {
                          alert('글을 입력하세요.');
                          return false;
                        }

                        var jsonData = {
                        "recontent" : recontent,
                        "id" : "${sessionScope.id}",
                        "num" : "${board.num}"
                        };

                        var result = JSON.stringify(jsonData);//json처럼 생긴 string으로 변환. text
                        replyData.value = '';

                        $.ajax({
                        type : "POST",
                        url : "board?cmd=reboard_reply",
                        dataType : "text",
                        contentType : "application/text;charset=utf-8",
                        data : result,
                        success : function(data) {
                          var result = JSON.parse(data);//객체로 만드는것. 각 요소들을 찾을때 유리하다. 딕셔너리타입
                          addDiv(result.renum, result.num, result.id, result.recontent)
                        },
                        error : function(jqXHR, textStatus, errorThrown) {
                          console.log("에러 발생~~\n" + textStatus + ":" + errorThrown);
                        }

                        });
                      }
                    </script>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
