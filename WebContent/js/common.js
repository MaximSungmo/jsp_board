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


// null check
function isEmpty(val) {
  if (typeof (val) === 'undefined' || val == null || trim(val) == '') {
    return true;
  }
  return false;
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
