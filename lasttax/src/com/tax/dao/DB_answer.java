package com.tax.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.tax.comm.DBUtil;
import com.tax.vo.answer;
import com.tax.vo.share;

public class DB_answer {
    public DB_answer() {}
    
    DBUtil db = new DBUtil();
    
    /*增加一条回答*/
	public void addAns(answer ans) throws ParseException {
		//把java.unit.Date转成java.sql.Date
		SimpleDateFormat bartDateFormat =new SimpleDateFormat("yyyy-MM-dd");  
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
	    String dateStringToParse=(df.format(ans.getDate()));// new Date()为获取当前系统时间  
        java.util.Date date = bartDateFormat.parse(dateStringToParse);  
        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
       
		PreparedStatement pstm = null;
		String sql = "insert into answer(userID,ansID,txt,date,goodNum,keptNum,checked) values (?,?,?,?,?,?,?)";
		try {
			pstm = db.getConPst(sql);
			//设置参数
			pstm.setString(1, ans.getUserID());
			pstm.setInt(2, ans.getAnsID());
			pstm.setString(3, ans.getTxt());
			pstm.setDate(4, sqlDate);
			pstm.setInt(5, ans.getGood());
			pstm.setInt(6, ans.getKeep());
			pstm.setInt(7, ans.getCheck());
			
			pstm.executeUpdate();//执行数据库语句
			System.out.println("添加一条数据到answer");
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.close(pstm, null);
		}
	}
	
	//获取id里最大的数（本身是int类型）
	public int getMaxID() {
		int maxID=1;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			String sql = "select max(ansID) from answer";
			pstm = db.getConPst(sql);
			//rs保存结果集
			rs = pstm.executeQuery();
			while(rs.next()) {
				maxID=rs.getInt("max(ansID)");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			DBUtil.close(pstm,null);
		}
		return maxID;
	}
	
	//用以用户(提问者本身)修改回答的内容
	public void update() {

	}
	

	
}
