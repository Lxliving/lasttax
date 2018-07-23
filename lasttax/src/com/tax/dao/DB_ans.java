package com.tax.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tax.comm.DBUtil;
import com.tax.vo.answer;
import com.tax.vo.consult;

public class DB_ans {
	public DB_ans() {}
	DBUtil db = new DBUtil();
	
	public answer getByID(int ansID) {
		//通过回答的ID号来返回一个回答
		answer ans = new answer();
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select * from answer where ansID = '"+ ansID + "'";
			pstm = db.getConPst(sql);
			//rs保存结果集
			rs = pstm.executeQuery();
			while(rs.next()) {
				ans.setAnsID(rs.getInt("ansID"));
				ans.setDate(rs.getDate("date"));
				ans.setGood(rs.getInt("goodNum"));
				ans.setKeep(rs.getInt("keptNum"));
				ans.setTxt(rs.getString("txt"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return ans;
	}
	public int getChecked(int ansID) {
		//查询一个answer是否已经经过审核
		int checked = 0;
		ResultSet rs = null;
		PreparedStatement pstm = null;
		try {
			String sql = "select checked from answer where ansID = '"+ ansID + "'";
			pstm = db.getConPst(sql);
			//rs保存结果集
			rs = pstm.executeQuery();
			while(rs.next()) {
				checked = rs.getInt("checked");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return checked;
	}
}
