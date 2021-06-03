<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cos.dto.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.cos.dao.BoardDAO"%>
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
        <div id="contentcore" class="excludeSearch">샘플페이지</div>
      </div>
    </div>
    <%@ include file="/layout/footer.jsp"%>
  </div>
</body>
</html>