package com.tax.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.tax.comm.DBUtil;

public class DB_check {
	public DB_check() {
	}
	DBUtil db = new DBUtil();
	
	public void checkCons(int consID) {
		//审核通过咨询对象，把咨询对象在数据库中保存的check属性切换为1
		PreparedStatement pstm = null;
		String sql = "update consult set checked = 1 where consID = ?";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setInt(1, consID);
			pstm.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
}
