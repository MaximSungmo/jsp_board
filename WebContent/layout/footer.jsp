<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- footer -->
<div id="footer">
  <div class="footerInner">
    <h1 class="logo">
      <img src="/include/health/image/common/logo_foot.png" alt="">
    </h1>
    <ul class="fnb clearfix">
      <li><a target="_blank" title="새창에서 열림">개인정보처리방침</a></li>
      <li><a>직원 및 업무 안내</a></li>
      <li><a>오시는길</a></li>
    </ul>
    <div class="addr">
      <address>
        [수정구보건소] (13346) 경기도 테스트 수정구 수정로 218(신흥동) | TEL 031-729-3870 | FAX 031-729-3839<br>[중원구보건소] (13200) 경기도 테스트 중원구 금상로 137(상대원동) | TEL 031-729-3930 | FAX 031-729-3899<br>[분당구보건소] (13496) 경기도 테스트 분당구 양현로 306(야탑동) | TEL 031-729-3990 | FAX 031-729-3959
      </address>
      <cite>Copyright ⓒ Seongnam City. All Rights Reserved.</cite>
    </div>
  </div>
  <script type="text/javascript">
      $(function() {
        $("#btnTopScroll").click(function() {
          $("body,html").animate({
            scrollTop : 0
          }, 300);
          return false;
        });
      });
    </script>
</div>
<!-- //footer -->