package dao;

import java.sql.*;

import java.util.*;

import vo.Dept;

public class DeptDAO {
	//Map 사용
	public static ArrayList<HashMap<String, Object>> selectDeptListOnOff() throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();  // dept[]
		
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT deptno deptNo, dname, loc, 'on'onOff FROM dept";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("depNo", rs.getInt("deptNo"));
			m.put("dname", rs.getString("dname"));
			m.put("loc", rs.getString("loc"));
			m.put("onOff", rs.getString("onOff"));
			list.add(m);
		}
		
		
		return list;
	}
	
	
	//VO 사용
	public static ArrayList<Dept> selectDeptList() throws Exception{
		ArrayList<Dept> list = new ArrayList<>();  // dept[]
		
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT deptno deptNo, dname, loc FROM dept";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Dept d = new Dept();
			d.deptNo = rs.getInt("deptNo");
			d.dName = rs.getString("dname");
			d.loc = rs.getString("loc");
			list.add(d);
		}
		
		
		return list;
	}
}
