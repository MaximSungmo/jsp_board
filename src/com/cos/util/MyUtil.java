package com.cos.util;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.cos.dto.BoardVO;

public class MyUtil {
	//크로스 사이트 스크립트 공격 방어
	public static String getReplace(String code) {	
		return code.replaceAll(" ", "&nbsp;").replaceAll("<", "&lt").replaceAll(">", "&gt").replaceAll("\n", "<br>");
	}
	
	//모든 HTML 태그 제거
	//Junit은 add library로 빌드하고 @Test 어노테이션을 붙인다.
	//return 이 없어야 하고, static X, 리턴타입 X, void (O), 매개변수가 없어야 됨.
	public static String removeTag(String html){
		html = html.replaceAll("&nbsp;", " ");
		return html.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
	}
	
	public static String preview(String content) {
		Document doc = Jsoup.parse(content);
		Elements img_tag = doc.select("img");
		Elements iframe_tag = doc.select("iframe");
		String remove_content = removeTag(content);
		
		if(remove_content.length() == 0) {
			if(img_tag.size() > 0 && iframe_tag.size() > 0) {
				remove_content = "본문에 이미지와 영상만 존재합니다.";
			}else if(img_tag.size() > 0 && iframe_tag.size() == 0) {
				remove_content = "본문에 이미지만 존재합니다.";
			}else if(img_tag.size() == 0 && iframe_tag.size() > 0) {
				remove_content = "본문에 영상만 존재합니다.";
			}else {
				remove_content = "본문에 내용이 존재하지 않습니다.";
			}
		}else {
			//한줄에 영어만 하면 73, 한글 43줄
			if(remove_content.length() > 43) {
				remove_content = remove_content.substring(0, 43);
			}
		}
		
		return remove_content;
	}
	
	public static String makeYoutube(String content) {
		Document doc = Jsoup.parse(content);
		Elements a_tag = doc.select("a");
		String iFrame = "";
		for(Element item : a_tag) {
			if(item.attr("href").contains("www.youtube.com/watch")) {
				System.out.println("youtube 영상링크가 존재합니다.");
				String temp = item.attr("href");
				String[] split = temp.split("=");
				String value = split[1];
				value = value.substring(0, 11);
				iFrame = "<iframe id=\"player\" type=\"text/html\" width=\"90%\" height=\"409\" src=\"http://www.youtube.com/embed/"+value+"\" frameborder=\"0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\"></iframe>";
				item.after(iFrame);
			}
		}
		return doc.toString();
	}
	
	   //HotPost 변경유무 확인 (데이터 조회, 수정, 삭제시 호출됨)
	   public static boolean getBoardChange(List<BoardVO> hotPost1, List<BoardVO> hotPost2) {
	      boolean change = false;
	      for(int i=0; i< hotPost1.size(); i++) {
	         if(hotPost1.get(i).getNum() != hotPost2.get(i).getNum()) change = true;
	         if(!hotPost1.get(i).getTitle().equals(hotPost2.get(i).getTitle())) change = true;
	         if(hotPost1.get(i).getReadcount() != hotPost2.get(i).getReadcount()) change = true;
	      }
	      return change;
	   }
	
	
	
	
	
	
	
}
