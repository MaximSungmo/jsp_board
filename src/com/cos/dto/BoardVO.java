package com.cos.dto;

public class BoardVO {
  private int num;
  private String title;
  private String content;
  private String subCategory;
  private String writedate;
  private String id;
  private int readcount;
  private int categoryNum;

  private String username;
  
  public int getNum() {
    return num;
  }
  
  public void setNum(int num) {
    this.num = num;
  }
  
  public String getTitle() {
    return title;
  }
  
  public void setTitle(String title) {
    this.title = title;
  }
  
  public String getContent() {
    return content;
  }
  
  public void setContent(String content) {
    this.content = content;
  }
  
  public String getWritedate() {
    return writedate;
  }
  
  public void setWritedate(String writedate) {
    this.writedate = writedate;
  }
  
  public String getId() {
    return id;
  }
  
  public void setId(String id) {
    this.id = id;
  }
  
  public int getReadcount() {
    return readcount;
  }
  
  public void setReadcount(int readcount) {
    this.readcount = readcount;
  }
  
  public int getCategoryNum() {
    return categoryNum;
  }
  
  public void setCategoryNum(int categoryNum) {
    this.categoryNum = categoryNum;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getSubCategory() {
    return subCategory;
  }

  public void setSubCategory(String subCategory) {
    this.subCategory = subCategory;
  }
}
