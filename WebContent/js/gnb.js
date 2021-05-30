function initMenu(n1,n2,n3,n4,n5){
    var n1 = n1-1;
    var n2 = n2-1;
    var n3 = n3-1;
    var n4 = n4-1;
    var n5 = n5-1;
    var page = (n1 < 0) ? "main" : "sub";
    
    // wrap
    var $wrap = $("#wrap");
    // gnb 정보
    var $gnb = $("#gnb");
    
    // 해당 뎁스의 gnb정보
    var gnbData = gnbDataPush($gnb);
    var depth2Data = getNavi([n1]);
    var depth3Data = getNavi([n1,n2]);
    var depth4Data = getNavi([n1,n2,n3]);
    var depth5Data = getNavi([n1,n2,n3,n4]);
    // 현재위치
    var nowGnbData = getNavi([n1,n2,n3,n4,n5],true);
    
    // 반응형 체크
    var defWidth = 1000;
    var mobileChk = ($wrap.width() < defWidth) ? true : false;
    
    // 선언
    var $gnbList = $gnb.children();
    var $gnbBg = $("#submenuArea");
    var $gnbListFirst = $gnbList.eq(0).children("a");
    var $gnbListLast = $gnbList.eq($gnbList.length-4); // 회원정보, 이용안내 제외
    var $blackBg = $("#blackBG");
    var $searchBox = $("#searchBoxArea");
    var $mobileOpen = $("#mobileIndexOpen");
    var $mobileClose = $("#mobileIndexClose a");
    var $searchBtn = $('#btnSearchTop');
    var $tab = "";
    var $contents = $("#contens");
    var $boardTable = $(".boardWrap table");
    var $naviTit = $(".naviandtitle > h3");
    var tabNumChk = 0;
    var prevViewNum = 0;
    var mobileGnbTimer = 0;
    var searchTimer = 0;
    var snsTimer = 0;
    var resizeTimer2 = 0;
    var $btnTotal = $(".btnTotal > a"); 
    
    // *** 레이아웃 설정 시작 ***//
    resizeTimer2 = 2;
    gnbPc($gnb);
    
    // 메인페이지
    if(page == "main"){
        
    }
    // 서브페이지
    else{        
        // 타이틀 태그 변경
        nowPageTit({
            "basicTit" : "성남시보건소" // 기본 출력되는 이름
        });
        
        // 현재 GNB에 클래스 부여
        if(n1 >= 0) gnbData[n1]["obj"].parent().addClass("fbC");
        if(n2 >= 0) depth2Data[n2]["obj"].addClass("current");
        if(n3 >= 0) depth3Data[n3]["obj"].addClass("current");
        
        // 서브 타이틀
        $naviTit.text(nowGnbData["text"]);       
        
        if(!mobileChk){            
            // LNB 생성
            var depth1Title = gnbData[n1]["obj"].parent().attr("id");
            $("#contleft > h2").html(gnbData[n1]["obj"].html()).addClass(depth1Title);
            // 2뎁스, 하위메뉴 출력
            $("#lnb").html(makeList(depth2Data,false,n2,n3));
            
        }
                
        $(".sitemap").html(makeList(gnbData,true,n1,n2,n3));
        $(".sitemap > li > a").addClass("themeFC");                          
    } // -- 서브 끝 --//
    
    // ** 메인,서브 공통 시작 **//
    // 이전 클래스 새로운 클래스로 변경
    $("a[target='_blank']").each(function(e){
        var $this = $(this);
        if(!$this.attr("title")) $this.attr("title","새창에서 열림");  
    });
    $("#contents a").each(function(e){
        var $this = $(this);   
        buttonChange($this);
    });

    function buttonChange(btn) {
        var name = "";
        var str = btn.text();

        if(str.indexOf("다운") > -1) name = "down";
        if(str.indexOf("보기") > -1) name = "view";
        if(str.indexOf("바로가기") > -1) name = "view";
        if(str.indexOf("파일열기") > -1) name = "new";
        
        btn.parent().addClass(name);
    }   
    
    // 페이지 상관없이 탭 사용 할 수 있게끔
    if(!nowGnbData["class"] || nowGnbData["class"].indexOf("MkTab") < 0){
        $(".ttabWrap").each(function(){
            var $this = $(this);
            var $tab = $this.children("#ttab3");
            var $tabList = $tab.children();
            if($tabList.size() > 1){
                $this.show();
                tabChange($tab,mobileChk);
                tabNumChk = 1;
            } 
        });
    }
    
    // --- 레이아웃 설정 끝 ---//
    
    // ** 이벤트 등록 시작 **//
    
    // gnb 마우스 오버/포커스 이벤트
    function gnbPc($gnb){
        
        // 초기화
        $gnb.find("a").off();
        $gnb.find(".open").removeClass("open");
        $gnb.find(".subMain").remove();
        $gnb.find(".link").each(function(){
            var $this = $(this);
            var href = $this.attr("data-href");
            $this.attr("href",href).removeAttr("data-href").removeClass("link");
        });
        $gnb.parent().attr("id","gnbNav");
        $gnb.attr("id","gnb");
        
        $gnbList.on({
            mouseover : function(){
                var $this = $(this);
                $this.addClass("fbl").siblings().removeClass("fbl");
                gnbShow();
            },
            mouseleave : function(){
                gnbHide();
            }
        });

        $gnbList.children("a").on({
            focusin : function(){
                var $this = $(this).parent();
                $this.addClass("fbl").siblings().removeClass("fbl");
                gnbShow();
            }
        });

        if($gnbListLast.children("ul").children().length > 1){
            $gnbListLast = $gnbListLast.children("ul").children();
            $gnbListLast = $gnbListLast.eq($gnbListLast.length-1).children("a");
        }else{
            $gnbListLast = $gnbListLast.children("a");
        }

        $gnbListFirst.keydown(function(e){
            // shift + tab 눌렸을때
            var key = e.keyCode;
            if(key == 9 && e.shiftKey == true) gnbHide();
        });

        $gnbListLast.on({
            keydown : function(e){
                // tab키
                var key = e.keyCode;
                if(key == 9 && e.shiftKey == false) gnbHide();
            },
            focusin : function(){
                gnbShow();
            }
        });
        
        // 전체메뉴보기
        $btnTotal.click(function(){
            var $this = $(this);
            $gnbBg.removeClass("divide");
            if($gnbBg.css("display") == "block"){
                gnbHide();
            }else{
                $this.addClass("on");
                gnbShow();
            }
            return false;
        })
        
        function gnbShow(){
            $gnb.css("overflow","visible");
            $gnbList.children("ul").show();
            $gnbBg.show();
        }

        function gnbHide(){
            $gnb.css("overflow","hidden");
            $gnbList.children("ul").hide();
            $gnbList.removeClass("fbl");
            $gnb.removeClass("siblingsHide");
            $gnbBg.removeClass("divide");
            $gnbBg.hide();
            $btnTotal.removeClass("on");
        }
    }              
    
    // -- 이벤트 등록 끝 --//
    
    // 탭 생성
    function makeTab(obj){
        var $tabWrap = obj["$tabWrap"];
        $tab = obj["$tab"];
        var obj = obj["tabData"];
        var tab = "";
        var tabLength = obj.length;
        for(var i=0;i<tabLength;i++){
            var tag = obj[i]["obj"];
            if(nowGnbData["obj"][0].outerHTML == tag[0].outerHTML){
                (i == tabLength - 1) ? tab += "<li class='ttabLast choiced'>" : tab += "<li class='choiced'>";
            }else{
                (i == tabLength - 1) ? tab += "<li class='ttabLast'>" : tab += "<li>";
            }
            tab += tag[0].outerHTML + "</li>\n";
        }
        // console.log(tab);
        $tab.html(tab);
        $tabWrap.show();

        // 탭 on/off 이벤트
        $tab.find("a").on("mouseover focusin",function(){
            var $this = $(this).parent();
            $this.addClass("on").siblings().removeClass("on");
        });
        $tab.find("a").on("mouseleave focusout",function(){
            var $this = $(this).parent();
            $this.removeClass("on");
        });
        $tab.find("a").on("click",function(){
            var $this = $(this).parent();
            $this.addClass("choiced").siblings().removeClass("choiced");
        });

        // 탭 개수에 따른 너비 조절, 모바일 처리
        tabChange($tab,mobileChk);
    }
    
    // 탭 pc/모바일 변경
    function tabChange($tab,mobileChk){
        var $tabList = $tab.children();
        var $virtSelect = $tab.siblings(".virtSelect");
        if(mobileChk){
            if(!$virtSelect[0]) {
                $tab.parent().prepend("<div class='virtSelect'><a href='#script'>탭메뉴</a></div>");
                $virtSelect = $tab.siblings(".virtSelect");
            }
            $virtSelect.children("a").html($tab.find(".choiced").children("a").html());
            $tab.addClass("changedSel");
            $tab.hide();
            $virtSelect.show();
            // 버츄얼 셀렉트 박스
            var virtTimer = 0;
            $virtSelect.children("a").click(function(){
                if(virtTimer == 0){
                    virtTimer = 1;
                    $tab.show();
                }else{
                    $tab.hide();
                    virtTimer = 0;
                }
            })
        }
        // pc일 경우
        else{
            $tab.show();
            $tab.removeClass("changedSel");
            $virtSelect.hide();
            var tabLength = $tabList.size();
            if(tabLength > 5) tabLength = 5;
            var tabMargin = 0;
            if(tabLength > 1){
                tabMargin = $tabList.eq(1).css("margin").split("px");  
                if(tabMargin[1]/1 > 0 || tabMargin[3]/1 > 0){
                    tabMargin = (tabMargin[1]/1 + tabMargin[3]/1) * (tabLength - 1);
                }else{
                    tabMargin = 0;
                }
            }
            // 실제 적용될 탭 너비
            var minWidth = ($tab.width() - tabMargin) / tabLength;
            modify();
            // 분할한 탭 너비와 실제 탭의 너비를 비교해 더 긴 탭이 있을 경우엔 탭 한줄 최대 개수를 낮추고 다시 정리한다.
            // *걸리는게 없을때까지 반복하게끔 처리
            function modify(){
                for(var i=0;i<$tabList.size();i++){
                    var width = $tabList.eq(i).width();
                    if(width > minWidth){
                        minWidthModify();
                        modify();
                        return false;
                    }
                }   
            }
            function minWidthModify(){
                tabLength--;
                minWidth = ($tab.width() - tabMargin) / tabLength;
            }
            $tabList.css("min-width",minWidth + "px");
        }
    }
    
     // depthData에 따른 리스트 출력, chk로 하위 뎁스 전체 보임 여부, chkNum와 chkNum2,chkNum3로
      // 현재위치 지정
    function makeList(depthData,chk,chkNum,chkNum2,chkNum3){
        var list = "";
        var lnbLength = depthData.length;
        for(var i=0;i<lnbLength;i++){
            var tag = depthData[i]["obj"].clone();
            list += "<li>" + tag[0].outerHTML;
            var keyLength = 0;
            var childDepth = depthData[i]["childDepth"];
            for(var name in childDepth){ keyLength++; }
            if(keyLength > 1 && (childDepth[0]["class"] == "MkSub" || chk)){
                if(chkNum == i || chk){
                    list += "\n<ul class='submenu'>\n";
                }else{
                    list += "\n<ul class='submenu' style='display:none;'>\n";
                }
                var depthDownDataLength = childDepth.length;
                for(var j=0;j<depthDownDataLength;j++){
                    var tag2 = childDepth[j]["obj"].clone();
                    list += "<li>" + tag2[0].outerHTML;
                    if(chkNum3){
                        var keyLength2 = 0;
                        var childDepth2 = childDepth[j]["childDepth"];
                        for(var name in childDepth2){ keyLength2++; }
                        if(keyLength2 > 1 && (childDepth[0]["class"] == "MkSub" || chk)){
                            if(chkNum2 == j || chk){
                                list += "\n<ul>\n";
                            }else{
                                list += "\n<ul style='display:none;'>\n";
                            }
                            var depthDownDataLength2 = childDepth2.length;
                            for(var k=0;k<depthDownDataLength2;k++){
                                var tag3 = childDepth2[k]["obj"].clone();
                                list += "<li>" + tag3[0].outerHTML + "</li>\n";
                            }
                            
                            list += "</ul>\n";
                        }
                    }
                    list += "</li>\n"; 
                }
                list += "</ul>\n";
            }
            list += "</li>\n";
        }
        // console.log(list);
        return list;
    }
    
    // 타이틀 변경 주소 지정값이 있을 경우엔 해당하는걸로 아니면 현재 페이지 이름
    function nowPageTit(obj){
        var nowUrl = location.href;
        var basicTit = obj["basicTit"];
        document.title = nowGnbData["text"] + " : " + basicTit;
        for(var url in obj){
            if(nowUrl.indexOf(url) > -1){
                document.title = obj[url] + " : " + basicTit;
                return false;
            }
        }
        return false;
    }
    
    // gnb 정보 저장
    function gnbDataPush(obj){
        var depthChk = 0;
        var depthData = [];
        var depth = obj.children();
        dataPush(depth, depthData);
        function dataPush(depth, depthData){
            var length = depth.length;
            for(var i=0;i<length;i++){
                var $this = depth.eq(i).children("a");
                depthData[i] = data($this);
                var downDepth = $this.siblings().children();
                if(downDepth.length > 0){
                    dataPush(downDepth, depthData[i]["childDepth"]);
                }
            }
        }
        function data($this){
            return {
                "obj" : $this,
                "text" : $this.text(),
                "href" : $this.attr("href"),
                "class" : $this.parent().parent().attr("class"), // MkTab인지 구분
                "childDepth" : []
            };
        }
        return depthData;
    }
    
    // 해당하는 네비게이션 정보 추출
    // array = 페이지번호, nowChk = 현재위치가 필요한지 체크
    function getNavi(array, nowChk){
        var data = gnbData;
        var length = array.length;
        var num = 0;
        for(var i=0;i<length;i++){
            if(array[i] >= 0){
                if(nowChk){
                    data = (array[i+1] >= 0) ? data[array[i]]["childDepth"] : data[array[i]];    
                }else{
                    data = data[array[i]]["childDepth"];   
                }
            }else{
                break;
            }
        }
        if(!nowChk && data.length < 1){
            // console.log("해당하는 " + (length+1) + "뎁스가 없습니다.");
            return false;
        }
        return data;
    }
    
}

