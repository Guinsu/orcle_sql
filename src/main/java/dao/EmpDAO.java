package dao;

import java.sql.Connection;
import java.sql.*;
import java.util.*;
import vo.Dept;
import vo.Emp;

public class EmpDAO {
	
	// q003Case.jsp
	public static ArrayList<HashMap<String, String>> selectJobCaseList() throws Exception{
		
		ArrayList<HashMap<String, String>> list = new  ArrayList<>();
		 Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT ename,job, CASE\r\n"
				+ "					        WHEN job = 'PRESIDENT' Then '빨강'\r\n"
				+ "					        WHEN job = 'MANAGER' THEN '주황'\r\n"
				+ "					        WHEN job = 'ANALYST' THEN '노랑'\r\n"
				+ "					        WHEN job = 'CLERK' THEN '초록'\r\n"
				+ "					        ELSE '파랑' END color\r\n"
				+ "		FROM emp\r\n"
				+ "		ORDER BY (CASE \r\n"
				+ "			        WHEN color = '빨강' THEN 1\r\n"
				+ "			        WHEN color = '주황' THEN 2\r\n"
				+ "			        WHEN color = '노랑' THEN 3\r\n"
				+ "			        WHEN color = '초록' THEN 4\r\n"
				+ "			        ELSE 5 END) ASC\r\n";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
					
			HashMap<String, String> m = new HashMap<>();
			m.put("ename", rs.getString("ename"));
			m.put("job", rs.getString("job"));
			m.put("color", rs.getString("color"));
			
			list.add(m);
		}
				
		conn.close();
		return list;
	}
		
	
	//DEPTNO 뒤에 부서별 인원 같이 조회하는 메서드
	public static ArrayList<HashMap<String, Integer>>  selectDeptNoCntList() throws Exception{
		 ArrayList<HashMap<String, Integer>> list = new  ArrayList<>();
		
		Connection conn = DBHelper.getConnection();
		
		String sql = "SELECT count(*) cnt, deptno deptNo"
				+ " FROM emp "
				+ " WHERE deptno IS NOT NULL "
				+ " GROUP BY deptno"
				+ " ORDER BY deptno ASC";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		while(rs.next()) {
			
			HashMap<String, Integer> m = new HashMap<>();
			m.put("cnt", rs.getInt("cnt"));
			m.put("deptNo", rs.getInt("deptNo"));
			
			list.add(m);
		}
				
		conn.close();
		return list;
	}
	
	
	
	
	// 중복을 제외한 DEPTNO 목록을 출력하는 메서드
	public static ArrayList<Integer> selectDeptNoList() throws Exception{
		ArrayList<Integer> list = new  ArrayList<>();
		 
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT DISTINCT deptno deptNo"
				+ " FROM emp"
				+ " WHERE deptno IS NOT NULL"
				+ " ORDER BY deptno ASC";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			int i = rs.getInt("deptNo"); // 랩퍼타입과 기본 타입간에 Auto Boxing
			list.add(i);
		}
		
		conn.close();
		return list;
	}
	
	// 조인으로 map을 사용하는 경우
	public static ArrayList<HashMap<String, Object>> selectEmpAndDeptList() throws Exception{
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT emp.empno empNo, emp.ename ename, emp.deptno deptNo, dept.dname dname FROM emp INNER JOIN dept ON emp.deptno = dept.deptno";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<>();
			m.put("empNo",rs.getInt("empNo"));
			m.put("ename",rs.getString("ename"));
			m.put("deptNo",rs.getInt("deptNo"));
			m.put("dname",rs.getString("dname"));
			list.add(m);
		}
		
		conn.close();
		return list;
	}
	
	
	public static ArrayList<Emp> selectEmpList() throws Exception{
		ArrayList<Emp> list = new ArrayList<>();  // dept[]
		
		Connection conn = DBHelper.getConnection();
		String sql = "SELECT empno empNo, ename, sal FROM emp";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Emp e = new Emp();
			e.setEmpNo(rs.getInt("empNo"));
			e.seteName(rs.getString("ename"));
			e.setSal(rs.getDouble("sal"));
			list.add(e);
		}
		
		conn.close();
		return list;
	}
}

