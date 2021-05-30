<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0, minimum-scale=1.0, maximum-scale=2.0">
<meta name="description" content="건강도시 성남! 테스트민의 건강한 삶을 함께 만들어가겠습니다">
<meta name="generator" content="jnet co. ltd.">
<meta id="metaTitle" property="og:title" content="테스트보건소">
<meta id="metaDescription" property="og:description" content="정보마당 > 새소식">
<meta id="metaType" property="og:type" content="website">
<meta id="metaImage" property="og:image" content="http://www.seongnam.go.kr/include/cmm_new/image/common/sns_noimg.gif">
<meta id="metaUrl" property="og:url" content="https://www.seongnam.go.kr/health/1001402/30328/bbsList.do?searchSelect=&amp;searchCategory=&amp;currentPage=1&amp;searchOrganDeptCd=&amp;searchWord=&amp;idx=resultView.idx&amp;">
<title>새소식 : 테스트보건소</title>
<!-- css 파일  -->
<link href="<%=request.getContextPath()%>/css/sub.css" rel="stylesheet" type="text/css">
<!-- js 파일 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.alphanum.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/gnb.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/validation.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<script type="text/javascript">
  $(function() {
    $("#searchWord").keypress(function(e) {
      var code = e.keyCode || e.which;
      if (code == 13) {
        searchList();
        return false;
      }
    });

    $("#searchBtn").click(function() {
      searchList();
    });

    $("#categoryBtn").click(function() {
      $("input[name='currentPage']").val(1);
      $("#listForm").attr("action", "/health/1001402/30328/bbsList.do").submit();
    });
  });

  function searchList() {
    $("input[name='currentPage']").val(1);
    $("#searchForm").attr("action", "/health/1001402/30328/bbsList.do").submit();
  }

  function dataView(idx) {
    $("input[name='idx']").val(idx);
    $("#listForm").attr("action", "/health/1001402/30328/bbsView.do").submit();
  }

  function searchCategory(category) {
    $("input[name='currentPage']").val(1);
    $("input[name='searchCategory']").val(category);
    $("#listForm").attr("action", "/health/1001402/30328/bbsList.do").submit();
  }

  function setPageLink(pageNo) {
    $("input[name='currentPage']").val(pageNo);
    $("#searchForm").attr("action", "/health/1001402/30328/bbsList.do").submit();
  }
</script>
</head>