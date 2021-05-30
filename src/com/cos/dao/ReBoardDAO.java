package com.cos.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cos.dto.ReBoardVO;
import com.cos.util.DBManager;

public class ReBoardDAO {
  PreparedStatement pstmt;
  ResultSet rs;
  
  public int select_renum(int num) {
    String SQL = "SELECT MAX(renum) FROM reboard WHERE num = ?";
    Connection conn = DBManager.getConnection();
    try {
      pstmt = conn.prepareStatement(SQL);
      pstmt.setInt(1, num);
      rs = pstmt.executeQuery();
      if (rs.next()) {
        int auto_increment = rs.getInt(1);
        return auto_increment + 1;
      } else {
        // null일 경우 게시물의 첫번째 덧글일 것이므로...
        return 1;
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt, rs);
    }
    return -1;
  }
  
  public int insert(ReBoardVO reboard) {
    String SQL = "INSERT INTO reboard(id, recontent, writedate, num) VALUES(?,?,now(),?)";
    Connection conn = DBManager.getConnection();
    try {
      pstmt = conn.prepareStatement(SQL);
      // pstmt.setInt(1, reboard.getRenum());
      pstmt.setString(1, reboard.getId());
      pstmt.setString(2, reboard.getRecontent());
      pstmt.setInt(3, reboard.getNum());
      pstmt.executeUpdate();
      return 1;
      
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt);
    }
    return -1;
  }
  
  public List<ReBoardVO> select_list(int num) {
    String SQL = "SELECT * FROM reboard WHERE num = ? ORDER BY renum DESC";
    Connection conn = DBManager.getConnection();
    try {
      pstmt = conn.prepareStatement(SQL);
      pstmt.setInt(1, num);
      rs = pstmt.executeQuery();
      List<ReBoardVO> list = new ArrayList<>();
      while (rs.next()) {
        ReBoardVO reboard = new ReBoardVO();
        reboard.setRenum(rs.getInt("renum"));
        reboard.setId(rs.getString("id"));
        reboard.setRecontent(rs.getString("recontent"));
        reboard.setWritedate(rs.getString("writedate"));
        reboard.setNum(rs.getInt("num"));
        list.add(reboard);
      }
      return list;
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt, rs);
    }
    return null;
  }
  
  public int delete(int num, int renum) {
    String SQL = "DELETE FROM reboard WHERE num = ? AND renum = ?";
    Connection conn = DBManager.getConnection();
    try {
      pstmt = conn.prepareStatement(SQL);
      pstmt.setInt(1, num); // 문장이 완성됨
      pstmt.setInt(2, renum);
      pstmt.executeUpdate();
      return 1;
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      DBManager.close(conn, pstmt);
    }
    
    return -1;
  }
  
}