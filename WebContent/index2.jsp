<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <div id="contentcore" class="excludeSearch">
          <div class="naviandtitle">
            <h3>새소식</h3>
          </div>
          <div class="contents" id="contents">
            <div class="ttabWrap">
              <ul id="ttab3" class="tabType5 clearfix">
                <li></li>
              </ul>
            </div>
            <!--Real Contents Start-->
            <form name="listForm" id="listForm" method="get" action="/health/1001402/30328/bbsList.do">
              <input type="hidden" name="currentPage" value="1"> <input type="hidden" name="searchSelect" value=""> <input type="hidden" name="searchWord" value=""> <input type="hidden" name="searchOrganDeptCd" value=""> <input type="hidden" name="searchCategory" value=""> <input type="hidden" name="idx" value="resultView.idx">
              <!-- 
              <ul id="ttab4" class="mt20">
                <li class="on"><a href="#link" onclick="javascript:searchCategory('');">전체</a></li>
                <li><a href="#link" onclick="javascript:searchCategory('수정구');">수정구</a></li>
                <li><a href="#link" onclick="javascript:searchCategory('중원구');">중원구</a></li>
                <li><a href="#link" onclick="javascript:searchCategory('분당구');">분당구</a></li>
              </ul>
               -->
              <!--Forced tab Show Que-->
              <div class="boardWrap">
                <table class="board-list">
                  <caption>게시물 리스트</caption>
                  <colgroup>
                    <col class="mobileHide" style="width: 60px">
                    <col>
                    <col style="width: 100px">
                    <col class="mobileHide" style="width: 70px">
                    <col class="mobileHide" style="width: 100px">
                    <col class="mobileHide" style="width: 100px">
                    <col class="mobileHide" style="width: 50px">
                  </colgroup>
                  <thead>
                    <tr>
                      <th scope="col" class="mobileHide">번호</th>
                      <th scope="col">제목</th>
                      <th scope="col">등록일</th>
                      <th scope="col" class="mobileHide">조회수</th>
                      <th scope="col" class="mobileHide">분류</th>
                      <th scope="col" class="mobileHide">작성부서</th>
                      <th scope="col" class="mobileHide">파일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="mobileHide">1403</td>
                      <td class="title"><a href="#225263" onclick="dataView('225263');">비대면 생생대사교실(기초대사량운동) 참여자 모집 </a> <!----></td>
                      <td>2021-05-26</td>
                      <td class="mobileHide">81</td>
                      <td class="mobileHide">수정구</td>
                      <td class="mobileHide">건강증진과</td>
                      <td class="mobileHide"></td>
                    </tr>
                    <tr>
                      <td class="mobileHide">1402</td>
                      <td class="title"><a href="#224877" onclick="dataView('224877');"> 중원구보건소 비대면 운동프로그램(슬기로운 집콕운동) 참여자 모집 안내</a> <!----></td>
                      <td>2021-05-17</td>
                      <td class="mobileHide">280</td>
                      <td class="mobileHide">중원구</td>
                      <td class="mobileHide">건강증진과</td>
                      <td class="mobileHide"></td>
                    </tr>
                    <tr>
                      <td class="mobileHide">1401</td>
                      <td class="title"><a href="#224703" onclick="dataView('224703');">비대면 갱년기 바로알기 참여자 모집 안내(날짜 변경)</a> <!----></td>
                      <td>2021-05-13</td>
                      <td class="mobileHide">86</td>
                      <td class="mobileHide">분당구</td>
                      <td class="mobileHide">판교보건지소</td>
                      <td class="mobileHide"></td>
                    </tr>
                    <tr>
                      <td class="mobileHide">1400</td>
                      <td class="title"><a href="#224342" onclick="dataView('224342');">비대면 갱년기 바로알기 참여자 모집 안내</a> <!----></td>
                      <td>2021-05-10</td>
                      <td class="mobileHide">106</td>
                      <td class="mobileHide">분당구</td>
                      <td class="mobileHide">판교보건지소</td>
                      <td class="mobileHide"></td>
                    </tr>
                    <tr>
                      <td class="mobileHide">1399</td>
                      <td class="title"><a href="#224126" onclick="dataView('224126');">코로나-19 자가검사 안내서 배포 </a> <!----></td>
                      <td>2021-05-06</td>
                      <td class="mobileHide">518</td>
                      <td class="mobileHide">분당구</td>
                      <td class="mobileHide">보건행정과</td>
                    </tr>
                    <tr>
                      <td class="mobileHide">1398</td>
                      <td class="title"><a href="#223519" onclick="dataView('223519');">비대면 고혈압, 당뇨건강교실 참여자 모집 안내(6~11월 운영)</a> <!----></td>
                      <td>2021-04-29</td>
                      <td class="mobileHide">217</td>
                      <td class="mobileHide">분당구</td>
                      <td class="mobileHide">건강증진과</td>
                      <td class="mobileHide"></td>
                    </tr>
                    <tr>
                      <td class="mobileHide">1397</td>
                      <td class="title"><a href="#223074" onclick="dataView('223074');">(의료기관, 약국 관계자 필독) 코로나19 검사카드 배부 등 협조 요청</a> <!----></td>
                      <td>2021-04-27</td>
                      <td class="mobileHide">320</td>
                      <td class="mobileHide">분당구</td>
                      <td class="mobileHide">감염병관리센터</td>
                    </tr>
                    <tr>
                      <td class="mobileHide">1396</td>
                      <td class="title"><a href="#222912" onclick="dataView('222912');">테스트정신건강복지센터 분당구 정신건강실 및 스트레스관리실 이전 알림</a> <!----></td>
                      <td>2021-04-26</td>
                      <td class="mobileHide">211</td>
                      <td class="mobileHide">분당구</td>
                      <td class="mobileHide">건강증진과</td>
                      <td class="mobileHide"></td>
                    </tr>
                    <tr>
                      <td class="mobileHide">1395</td>
                      <td class="title"><a href="#222293" onclick="dataView('222293');">코로나19 증상자 진단검사 행정명령[경기도 공고 제2021-851호 ] </a> <!----></td>
                      <td>2021-04-19</td>
                      <td class="mobileHide">2,079</td>
                      <td class="mobileHide">분당구</td>
                      <td class="mobileHide">보건행정과</td>
                    </tr>
                    <tr>
                      <td class="mobileHide">1394</td>
                      <td class="title"><a href="#222238" onclick="dataView('222238');">코로나19 예방접종대상자 추가 등록 안내</a> <!----></td>
                      <td>2021-04-19</td>
                      <td class="mobileHide">4,823</td>
                      <td class="mobileHide">분당구</td>
                      <td class="mobileHide">건강증진과</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </form>
            <!-- 페이징 -->
            <div class="pagingWrap">
              <p class="paging">
                <span class="current">1</span><a href="#page" class="" onclick="setPageLink(2);">2</a><a href="#page" class="" onclick="setPageLink(3);">3</a><a href="#page" class="" onclick="setPageLink(4);">4</a><a href="#page" class="" onclick="setPageLink(5);">5</a><a href="#page" class="" onclick="setPageLink(6);">6</a><a href="#page" class="" onclick="setPageLink(7);">7</a><a href="#page" class="" onclick="setPageLink(8);">8</a><a href="#page" class="" onclick="setPageLink(9);">9</a><a href="#page" class="" onclick="setPageLink(10);">10</a><a href="#page" class="btn-paging next" onclick="setPageLink(11);">다음 10개 목록으로 이동</a><a href="#page" class="btn-paging last" onclick="setPageLink(141);">마지막 목록으로 이동</a>
              </p>
            </div>
            <!-- //페이징 -->
            <!-- 게시물 검색 -->
            <form name="searchForm" id="searchForm" method="post" action="/health/1001402/30328/bbsList.do">
              <input type="hidden" name="currentPage" id="searchCurPage" value="1"> <input type="hidden" name="idx" id="idx" value=""> <input type="hidden" name="searchCategory" value="">
              <div id="pageSearch">
                <div class="pageSearch">
                  <div class="schForm">
                    <select name="searchSelect" id="searchSelect" title="검색방식 선택" class="schSel">
                      <option value="title">제목</option>
                      <option value="contents">내용</option>
                      <option value="organ_dept_nm">작성부서</option>
                    </select> <input type="text" name="searchWord" id="searchWord" title="검색어 입력" value="" class="schKwd"> <span class="btn input themeBtn"><a href="#search" id="searchBtn">검색</a></span>
                  </div>
                </div>
              </div>
            </form>
            <!-- //게시물 검색 -->
            <!-- End Of the Real Contents-->
          </div>
          <a href="#body" id="btnTopScroll" title="상단으로 이동">TOP</a>
        </div>
      </div>
    </div>
    <%@ include file="/layout/footer.jsp"%>
  </div>
  <script type="text/javascript">
      initMenu(6, 1, 0, 0, 0);
    </script>
</body>
</html>