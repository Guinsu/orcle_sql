<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%

	ArrayList<HashMap<String, Integer>> list = EmpDAO.selectEmpSalState();
	ArrayList<HashMap<String, Object>> list2 = EmpDAO.selectEmpMgr();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>등급별 Sal 통계 </h1>
	<table border = '1'>
		<tr>
			<th>grade</th>
			<th>count</th>
			<th>sum</th>
			<th>avg</th>
			<th>max</th>
			<th>min</th>
		</tr>
			<%
				for(HashMap<String, Integer> m : list){
			%>
				<tr>
					<td>
						<%
							for(int i=0; i<m.get("grade"); i=i+1){	
						%>
							&#128151;
						<%
							}
						%>
					</td>
					<td><%=m.get("count") %></td>
					<td><%=m.get("sum") %></td>
					<td><%=m.get("avg") %></td>
					<td><%=m.get("max") %></td>
					<td><%=m.get("min") %></td>	
				</tr>
			<% 
				}
			%>
	</table>
	
	
	<h1>emp의 관리자 및 관리자 등급</h1>
	<table border = '1'>
		<tr>
			<th>empno</th>
			<th>ename</th>
			<th>grade</th>
			<th>mgrName</th>
			<th>mgrGrade</th>
		</tr>
			<%
				for(HashMap<String, Object> m : list2){
			%>
				<tr>
					<td><%=(Integer)m.get("empno") %></td>
					<td><%=(String)m.get("ename") %></td>
					<td>
						<%
							for(int i=0; i<(Integer)m.get("grade"); i=i+1){	
						%>
							&#128151;
						<%
							}
						%>
						
					</td>
					<td><%=(String)m.get("mgrName") %></td>
					<td>
						<%
							for(int i=0; i<(Integer)m.get("mgrGrade"); i=i+1){	
						%>
							&#128151;
						<%
							}
						%>
					</td>
				</tr>
			<% 
				}
			%>
	</table>
</body>
</html>