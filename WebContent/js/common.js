function shareTwitter(msg, url) {
  // var shareUrl = "http://twitter.com/home?status=" + encodeURIComponent(msg)
  // + " " + encodeURIComponent(url);
  var shareUrl = "https://twitter.com/intent/tweet?text=" + encodeURIComponent(msg) + "&url=" + encodeURIComponent(url);
  var objwin = window.open(shareUrl, 'twitterPopup', 'scrollbars=no,menubar=0,toolbar=0');
  if (objwin) {
    objwin.focus();
  }
}

function shareFaceBook(msg, url) {
  var shareUrl = "http://www.facebook.com/sharer/sharer.php?t=" + encodeURIComponent(msg) + "&u=" + encodeURIComponent(url);
  var objwin = window.open(shareUrl, 'facebookPopup', 'scrollbars=no,menubar=0,toolbar=0');
  if (objwin) {
    objwin.focus();
  }
}

function setPageLink(pageNum) {
  $("#currentPage").val(pageNum);
  $("#listForm").attr("target", "");
  $("#listForm").submit();
}

function getEditor() {
  /*
   * 에디터 생성.
   * 
   * basePath : 에디터 모듈이 있는 폴더의 Url 경로를 적어줍니다. (필수) width : 에디터의 너비 height : 에디터의
   * 높이 onLoad : 에디터 초기 로드 이벤트
   */
  xfe = new XFE({
  basePath : location.protocol + '//' + location.hostname + ':' + location.port + '/editor',
  width : '740px',
  height : '700px',
  onLoad : initLoad
  });

  /*
   * 에디터를 redering 합니다. 에디터를 생성할 HTML 객체의 id 값을 parameter 값으로 넘겨줘야 합니다. (필수)
   */
  xfe.render('xfe_ex');

}

// 숫자체크
function isNumber(control, msg) {

  var val = control;
  var Num = "1234567890";
  for (var i = 0; i < val.length; i++) {
    if (Num.indexOf(val.substring(i, i + 1)) < 0) {
      if (msg != null && msg != '') {
        alert(msg + ' 형식이 잘못되었습니다.');
      }
      return false;
    }
  }
  return true;
}

// 날짜체크
function isDate(control, msg) {

  // '/'나 '-' 구분자 제거
  var val = getRemoveFormat(control);

  // 숫자, length 확인
  if (isNumber(val, msg) && val.length == 8) {
    var year = val.substring(0, 4);
    var month = val.substring(4, 6);
    var day = val.substring(6, 8);

    // 유효날짜 확인
    if (checkDate(year, month, day, msg)) {
      return true;
    } else {
      return false;
    }
  } else {
    alert(msg + " 유효하지 않은 년,월,일(YYYYMMDD)입니다. 다시 확인해 주세요!");
    return false;
  }
}

// 구분자 제거
function getRemoveFormat(val) {
  if (val.length == 10) {
    var arrDate = new Array(3);
    arrDate = val.split("/");
    if (arrDate.length != 3) {
      arrDate = val.split("-");
    }
    return arrDate[0] + arrDate[1] + arrDate[2];
  } else {
    return val;
  }
}

// 유효날짜 확인
function checkDate(varCk1, varCk2, varCk3, msg) {
  if (varCk1 >= "0001" && varCk1 <= "9999" && varCk2 >= "01" && varCk2 <= "12") {
    febDays = "29";
    if ((parseInt(varCk1, 10) % 4) == 0) {
      if ((parseInt(varCk1, 10) % 100) == 0 && (parseInt(varCk1, 10) % 400) != 0) {
        febDays = "28";
      }
    } else {
      febDays = "28";
    }
    if (varCk2 == "01" && varCk3 >= "01" && varCk3 <= "31")
      return true;
    if (varCk2 == "02" && varCk3 >= "01" && varCk3 <= febDays)
      return true;
    if (varCk2 == "03" && varCk3 >= "01" && varCk3 <= "31")
      return true;
    if (varCk2 == "04" && varCk3 >= "01" && varCk3 <= "30")
      return true;
    if (varCk2 == "05" && varCk3 >= "01" && varCk3 <= "31")
      return true;
    if (varCk2 == "06" && varCk3 >= "01" && varCk3 <= "30")
      return true;
    if (varCk2 == "07" && varCk3 >= "01" && varCk3 <= "31")
      return true;
    if (varCk2 == "08" && varCk3 >= "01" && varCk3 <= "31")
      return true;
    if (varCk2 == "09" && varCk3 >= "01" && varCk3 <= "30")
      return true;
    if (varCk2 == "10" && varCk3 >= "01" && varCk3 <= "31")
      return true;
    if (varCk2 == "11" && varCk3 >= "01" && varCk3 <= "30")
      return true;
    if (varCk2 == "12" && varCk3 >= "01" && varCk3 <= "31")
      return true;
  }
  alert(msg + " 유효하지 않은 년,월,일(YYYYMMDD)입니다. 다시 확인해 주세요!");
  return false;
}

function isEmail(varCk, msg) {
  var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
  if (regex.test(varCk) === false) {
    if (msg != null && msg != '') {
      alert(msg + " 유효하지 않은 이메일입니다. 다시 확인해 주세요!");
    }
    return false;
  }
  return true;
}

// null check
function isEmpty(val) {
  if (typeof (val) === 'undefined' || val == null || trim(val) == '') {
    return true;
  }
  return false;
}

// null check
function isNotEmpty(val) {
  return !isEmpty(val);
}

// Trim whitespace from left and right sides of s.
function trim(s) {
  return s.replace(/^\s*/, "").replace(/\s*$/, "");
}

function encode(unencoded) {
  return encodeURIComponent(unencoded).replace(/'/g, "%27").replace(/"/g, "%22");
}

function decode(encoded) {
  return decodeURIComponent(encoded.replace(/\+/g, " "));
}

function isImageFile(fileName) {

  if (isEmpty(fileName)) {
    return true;
  }

  var ext = fileName.split('.').pop().toLowerCase();

  // 확장자 체크
  var regExpImgExt = /\.(bmp|gif|jpg|jpeg|png|pdf)$/i;

  if (regExpImgExt.test(fileName)) {
    alert("이미지파일( bmp, gif, jpg, jpeg, png, pdf)만 등록이 가능합니다.");
    return false;
  }
  return true;
}

function isAllowedFile(fileName) {

  if (isEmpty(fileName)) {
    return true;
  }

  // 확장자 체크
  var regExpFileExt = /\.(asp|bat|cgi|cmd|css|dll|exe|htm|html|inc|java|js|jsp|mdb|php|php3|phtml|pi|pl|properties|sh|swf|xml)$/i;
  if (regExpFileExt.test(fileName)) {
    var ext = fileName.split('.').pop().toLowerCase();
    alert("(" + ext + ") 형식은 업로드할수 없는 확장자의 파일입니다.");
    return false;
  }

  var regExpFileCompressExt = /\.(7z|ais|alz|arc|arj|cab|egg|gz|hgx|jar|jas|lzh|pak|psz|rar|sea|tar|tbz|tgz|war|zip|zool)$/i;
  if (regExpFileCompressExt.test(fileName)) {
    alert("압축파일 형식은 업로드할수 없는 확장자의 파일입니다.");
    return false;
  }
  return true;
}

function setScrap(menu_idx) {
  if (confirm("나의 스크랩에 추가하시겠습니까?")) {
    $.ajax({
    type : "POST",
    url : "/inc/myFavorite.do",
    dataType : "json",
    data : {
      "menu_idx" : menu_idx
    },
    success : function(data) {
      if (data.success) {
        alert("나의 스크랩에 추가 되었습니다.");
      } else {
        alert("로그인이 만료되었거나 이미 스크랩되어 있는 메뉴입니다.");
      }
    },
    error : function(request, status, error) {
      alert("에러코드: " + request.status + "\r\n메시지: " + request.responseText);
    }
    });
  }
}

function errorMThumb(img) {
  img.src = "/include/mayor/image/common/thum_mPhoto.jpg";
}

function errorThumb(img) {
  img.src = "/include/mayor/image/common/thum_Photo.jpg";
}

function fileDownload(filePath, saveFileNm, oFileNm) {
  var filter = "win16|win32|win64|mac";
  if (navigator.platform) {
    if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
      location.href = "/fileDownload.do?filePath=" + filePath + "&saveFileNm=" + saveFileNm + "&oFileNm=" + oFileNm;
    } else {
      $.fileDownload('/fileDownload.do', {
      httpMethod : "POST",
      data : {
      'filePath' : filePath,
      'saveFileNm' : saveFileNm,
      'oFileNm' : oFileNm
      }
      });
    }
  }
}

function fileView(filePath, saveFileNm, oFileNm) {
  $("body").append("<form name=\"fileForm\" id=\"fileForm\" method=\"post\" target=\"_blank\">");
  $("#fileForm").append("<input type=\"hidden\" name=\"filePath\" value=\"" + filePath + "\"/>");
  $("#fileForm").append("<input type=\"hidden\" name=\"saveFileNm\" value=\"" + saveFileNm + "\"/>");
  $("#fileForm").append("<input type=\"hidden\" name=\"oFileNm\" value=\"" + oFileNm + "\"/>");
  var win = window.open("", "fileView");
  $("#fileForm").attr("target", "fileView").attr("action", "/fileView.do").submit();
  $("#fileForm").remove();
  win.focus();
}

function printPopup(total_value) {
  var win;
  if (total_value != undefined) {
    win = window.open("/printPopup.do?total_value=" + encodeURI(encodeURIComponent(total_value)), "popup_print", "width=763,height=500, scrollbars=yes");
  } else {
    win = window.open("/printPopup.do", "popup_print", "width=763,height=500, scrollbars=yes");
  }
  win.focus();
}

function sysPrintPopup() {
  var win = window.open("/sys/printPopup.do", "popup_print", "width=800,height=900, scrollbars=yes");
  win.focus();
}

function sysHopePrintLog() {
  var idx = $("#idx").val();
  $.ajax({
  type : "POST",
  url : "/sys/mayor/printLog.do",
  dataType : 'json',
  data : {
    "idx" : idx
  },
  success : function(data) {
    if (data.success) {
      return;
    } else {
      alert("로그오류");
    }
  },
  error : function(request, status, error) {
    alert("에러코드 : " + request.status + "\n" + "메시지 :" + request.responseText);
  }
  });

}

function sysSnMonitorPrintLog() {
  var question_idx = $("#question_idx").val();
  var report_cd = $("#report_cd").val();
  $.ajax({
  type : "POST",
  url : "/sys/snMonitor/report/printLog.do",
  dataType : 'json',
  data : {
  "question_idx" : question_idx,
  "report_cd" : report_cd
  },
  success : function(data) {
    if (data.success) {
      return;
    } else {
      alert("로그오류");
    }
  },
  error : function(request, status, error) {
    alert("에러코드 : " + request.status + "\n" + "메시지 :" + request.responseText);
  }
  });

}

function sysTrafficReportPrintLog() {
  var idx = $("#idx").val();
  $.ajax({
  type : "POST",
  url : "/sys/traffic/report/printLog.do",
  dataType : 'json',
  data : {
    "idx" : idx
  },
  success : function(data) {
    if (data.success) {
      return;
    } else {
      alert("로그오류");
    }
  },
  error : function(request, status, error) {
    alert("에러코드 : " + request.status + "\n" + "메시지 :" + request.responseText);
  }
  });

}
