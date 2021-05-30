<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<header id="header">
  <div class="headerInner clearfix">
    <div class="siteMenuGroup clearfix">
      <div id="siteMenu" class="siteMenu">
        <ul class="memUtil clearfix">
          <li><a href="index.jsp">성남시청 홈</a></li>
          <li class="langs"><a href="#open" title="언어 선택" class="button">Language</a>
            <ul>
              <li id="kr" style="display: none;"><a href="https://www.seongnam.go.kr/health" title="새창에서 열림" target="_blank" class="kr">한국어</a></li>
            </ul></li>
          <c:choose>
            <c:when test="${empty sessionScope.id}">
              <li><a href="<%=request.getContextPath()%>/member/joinForm.jsp" class="gnbJoin">회원가입</a></li>
              <li><a href="<%=request.getContextPath()%>/member/loginForm.jsp" class="gnbLogin">로그인</a></li>
            </c:when>
            <c:otherwise>
              <li><a class="nav-item nav-link" href="<%=request.getContextPath()%>/member?cmd=member_update">회원정보</a></li>
              <li><a class="nav-item nav-link" href="<%=request.getContextPath()%>/member?cmd=member_logout">로그아웃</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
    <h1 id="logo" class="Health">
      <a href="/health/"><img src="images/logo.png" alt="테스트보건소(수정구/중원구/분당구)"></a>
    </h1>
    <!-- Top SearchBox -->
    <a href="#searchOpen" id="btnSearchTop" title="검색창 열기"><span>검색창열기</span></a>
    <div id="searchBoxArea" class="topSearch">
      <h2 class="blind">통합검색(X)</h2>
      <form name="wisenutForm" id="wisenutForm" action="/search/search.jsp">
        <fieldset>
          <legend class="blind">테스트청 통합검색 영역</legend>
          <div id="searchBox" class="searchBoxWrap">
            <div class="searchBox">
              <select name="collection" id="collection" title="검색방식선택" disabled>
                <option value="ALL" selected="selected">통합검색</option>
              </select>
              <div class="keywordInput">
                <label for="query" class="blind">검색어 입력(X)</label> <input type="text" name="query" id="query" class="schInput1" placeholder="검색어 입력(X)" style="ime-mode: active;" disabled>
              </div>
            </div>
          </div>
        </fieldset>
      </form>
    </div>
    <!-- //Top SearchBox -->
    <a href="#open" id="mobileIndexOpen"><span>메뉴 열기</span></a> <a href="#back" id="blackBG"><span class="blind">이전으로 돌아가기</span></a>
    <nav id="gnbNav">
      <div id="mobileIndexClose">
        <img src="images/logo.png" class="logo" alt="테스트보건소(수정구/중원구/분당구)"> <a href="#close" class="close"><span>메뉴 닫기</span></a>
      </div>
      <ul id="gnb" class="clearfix" style="overflow: hidden;">
        <li id="gnb1" class="health_top_menu"><a href="#">보건소 안내</a>
          <ul style="display: none;">
            <li id="gnb1_1"><a class="disabled">보건소 소개</a></li>
            <li id="gnb1_2"><a class="disabled">이용시간/휴무일</a></li>
            <li id="gnb1_3"><a class="disabled">조직/직원정보</a>
            <li id="gnb1_4"><a class="disabled">오시는길</a>
            <li id="gnb1_5"><a class="disabled">연혁</a></li>
            <li id="gnb1_6"><a class="disabled">보건의료헌장</a></li>
          </ul></li>
        <li id="gnb2" class="health_top_menu"><a href="#">진료 및 민원 안내</a>
          <ul style="display: none;">
            <li id="gnb2_1"><a class="disabled">진료서비스</a></li>
            <li id="gnb2_2"><a class="disabled">민원서비스</a></li>
            <li id="gnb2_3"><a class="disabled">예방접종</a></li>
          </ul></li>
        <li id="gnb3" class="health_top_menu"><a href="#">건강증진사업</a>
          <ul style="display: none;">
            <li id="gnb3_1"><a class="disabled">건강증진사업안내</a></li>
            <li id="gnb3_2"><a class="disabled">건강증진센터</a></li>
            <li id="gnb3_3"><a class="disabled">금연클리닉</a></li>
            <li id="gnb3_4"><a class="disabled">구강보건</a></li>
            <li id="gnb3_5"><a class="disabled">재활보건</a></li>
            <li id="gnb3_6"><a class="disabled">장기기증등록</a></li>
            <li id="gnb3_7"><a class="disabled">아토피/천식예방</a></li>
            <li id="gnb3_8"><a class="disabled">초등학생치과주치의</a></li>
          </ul></li>
        <li id="gnb4" class="health_top_menu"><a href="#">보건서비스</a>
          <ul style="display: none;">
            <li id="gnb4_1"><a class="disabled">의료비지원</a></li>
            <li id="gnb4_2"><a class="disabled">결핵관리</a></li>
            <li id="gnb4_3"><a class="disabled">모자보건</a></li>
            <li id="gnb4_4"><a class="disabled">정신건강사업</a></li>
            <li id="gnb4_5"><a class="disabled">방문건강관리</a></li>
            <li id="gnb4_6"><a class="disabled">에이즈및성매개감염병예방</a></li>
            <li id="gnb4_7"><a class="disabled">방역</a></li>
            <li id="gnb4_8"><a class="disabled">만성질환관리</a></li>
            <li id="gnb4_9"><a class="disabled">감염병관리</a></li>
            <li id="gnb4_10"><a class="disabled">치매관리</a></li>
          </ul></li>
        <li id="gnb5" class="health_top_menu"><a href="#">기관/시설정보</a>
          <ul style="display: none;">
            <li id="gnb5_1"><a class="disabled">기관/시설정보</a></li>
            <li id="gnb5_2"><a class="disabled">산모신생아건강관리기관</a></li>
            <li id="gnb5_3"><a class="disabled">자동심장충격기정보</a></li>
          </ul></li>
        <li id="gnb6" class="health_top_menu fbC"><a href="<%=request.getContextPath()%>/board?cmd=board_list&pageNum=0&categoryNum=0">정보마당</a>
          <ul style="display: none;">
            <li id="gnb6_1"><a href="<%=request.getContextPath()%>/board?cmd=board_list&pageNum=0&categoryNum=0" class="current">새소식</a></li>
            <li id="gnb6_2"><a href="<%=request.getContextPath()%>/board?cmd=board_list&pageNum=0&categoryNum=1">자주묻는질문</a></li>
            <li id="gnb6_3"><a href="/health/1001404/30330/bbsList.do">민원상담실</a></li>
            <li id="gnb6_4"><a href="/health/1001532/30353/bbsList.do">모기신고센터</a></li>
            <li id="gnb6_5"><a href="/health/1001533/30354/bbsList.do">감염병소식</a></li>
            <li id="gnb6_6"><a href="/health/1001405/30331/bbsList.do">인플루엔자위탁병의원</a></li>
            <li id="gnb6_7"><a href="/health/1002127/30468/bbsList.do">코로나19예방접종</a></li>
            <li id="gnb6_8"><a href="/health/1001407/30333/bbsList.do">자료실</a></li>
            <li id="gnb6_9"><a href="/health/1001408/30334/bbsList.do">모집공고</a></li>
            <li id="gnb6_10"><a href="/health/1001409/11008/contents.do">사이트맵</a></li>
          </ul></li>
      </ul>
      <div id="submenuArea" style="display: none;"></div>
    </nav>
  </div>
</header>
