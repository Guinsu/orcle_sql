<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<!-- controller-->
<%
	//DAO ȣ�� ��
	ArrayList<Dept> deptList = DeptDAO.selectDeptList();
	ArrayList<Emp> empList = EmpDAO.selectEmpList();
	ArrayList<HashMap<String, Object>> deptOnOffList = DeptDAO.selectDeptListOnOff();
	ArrayList<HashMap<String, Object>> empAndDeptList = EmpDAO.selectEmpAndDeptList();
%>

<!-- view -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>q001VoOrMap - Query ���� 001</title>
</head>
<body>
	<h1>Dept List</h1>
	<table border="1">
		<tr>
			<th>deptNo</th>
			<th>dName</th>
			<th>loc</th>
			<th></th>
		</tr>
		<%
			for(Dept d : deptList){
		%>
			<tr>
				<td><%=d.deptNo %></td>
				<td><%=d.dName %></td>
				<td><%=d.loc %></td>
			</tr>
		<%
			}
		%>				
	</table>
	
	<h1>Emp List</h1>
	<table border="1">
		<tr>
			<th>empNo</th>
			<th>eName</th>
			<th>sal</th>
			<th></th>
		</tr>
		<%
			for(Emp d : empList){
		%>
			<tr>
				<td><%=d.empNo %></td>
				<td><%=d.eName %></td>
				<td><%=d.sal %></td>
			</tr>
		<%
			}
		%>				
	</table>
	
	
	<h1>deptOnOffList</h1>
	<table border="1">
		<tr>
			<th>deptNo</th>
			<th>dname</th>
			<th>loc</th>
			<th>onOff</th>
		</tr>
		<%
			// map���� : ����ȯ�� �ʿ� �� ���� �ִ�.  IDE �ڵ��ϼ� ����� ����� �� ����.
			for(HashMap<String, Object> don : deptOnOffList){
		%>
			<tr>
				<td><%=(Integer)(don.get("deptNo"))%></td>
				<td><%=(String)(don.get("dname"))%></td>
				<td><%=(String)(don.get("loc"))%></td>
				<td><%=(String)(don.get("onOff"))%></td>
			</tr>
		<%
			}
		%>				
	</table>
	
	<h1>Emp INNER Join Dept List</h1>
	<table border="1">
		<tr>
			<th>empNo</th>
			<th>ename</th>
			<th>deptNo</th>
			<th>dname</th>
		</tr>
		<%
			// map���� : ����ȯ�� �ʿ� �� ���� �ִ�.  IDE �ڵ��ϼ� ����� ����� �� ����.
			for(HashMap<String, Object> ed : empAndDeptList){
		%>
			<tr>
				<td><%=(Integer)(ed.get("deptNo"))%></td>
				<td><%=(String)(ed.get("dname"))%></td>
				<td><%=(String)(ed.get("loc"))%></td>
				<td><%=(String)(ed.get("onOff"))%></td>
			</tr>
		<%
			}
		%>				
	</table>
</body>
</html>