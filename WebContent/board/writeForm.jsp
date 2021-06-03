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
          <form name="w_form" method="POST" action="<%=request.getContextPath()%>/board?cmd=board_write">
          <input type="hidden" value='<%= request.getParameter("categoryNum") %>' name="categoryNum">
            <h2>등록</h2>            
            <fieldset>
              <legend>Update</legend>
              <div>
                <label >Title</label> <br>
                <input type="text" name="title" value="" style="width:100%" required autofocus>
              </div>              
              <div>
                <label>Content</label>
                <textarea id="textAreaContent" name="content" rows="15" cols="80" style="width: 100%"></textarea>
              </div>
              <div>
                <button type="button" onclick="submitContents(this)" style="color:blue">등록</button>
              </div>
            </fieldset>          
          </form>
        </div>
      </div>
    </div>    
  </div>
  <!-- Naver Smart Editor 2 -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/editor/js/jindo.min.js" charset="utf-8"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
  <script>
	var form = document.w_form;
  var oEditors = [];
  nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "textAreaContent",
      sSkinURI: "<%=request.getContextPath()%>/editor/SmartEditor2Skin.html",
      fCreator: "createSEditor2"
  });
   
  //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
  function submitContents(elClickedObj) {
      // 에디터의 내용이 textarea에 적용된다.
      oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
   
      // 에디터의 내용에 대한 값 검증은 이곳에서
      // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    
      try {
          elClickedObj.form.submit();
      } catch(e) {
       
      }
  }
   
  // textArea에 이미지 첨부
  function pasteHTML(filepath){
      var sHTML = '<img src="<%=request.getContextPath()%>/editor/upload/' + filepath + '">';
        oEditors.getById["textAreaContent"].exec("PASTE_HTML", [ sHTML ]);
      }
    </script>
</body>
</html>
