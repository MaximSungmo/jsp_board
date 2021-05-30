
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="contleft" class="contleft">
  <h2 class="gnb6">정보마당</h2>
  <div class="lnbWrap">
    <ul id="lnb" class="lnb">
      <li><a href="<%=request.getContextPath()%>/board?cmd=board_list&pageNum=${pageNum+3}" class="current">새소식</a></li>
      <li><a href="/health/1001403/30329/bbsList.do">자주묻는질문</a></li>
      <li><a href="/health/1001404/30330/bbsList.do">민원상담실</a></li>
      <li><a href="/health/1001532/30353/bbsList.do">모기신고센터</a></li>
      <li><a href="/health/1001533/30354/bbsList.do">감염병소식</a></li>
      <li><a href="/health/1001405/30331/bbsList.do">인플루엔자위탁병의원</a></li>
      <li><a href="/health/1002127/30468/bbsList.do">코로나19예방접종</a></li>
      <li><a href="/health/1001407/30333/bbsList.do">자료실</a></li>
      <li><a href="/health/1001408/30334/bbsList.do">모집공고</a></li>
      <li><a href="/health/1001409/11008/contents.do">사이트맵</a></li>
    </ul>
  </div>
</div>
