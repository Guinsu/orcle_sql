<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>

<%
	ArrayList<Integer> empList = EmpDAO.selectDeptNoList();
	ArrayList<HashMap<String, Integer>> groupByList = EmpDAO.selectDeptNoCntList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<SELECT name="deptno">
		<option value="">:::����:::</option>
		<%
			for(Integer d : empList){
		%>
		<option value="<%=d%>"><%=d%></option>
		<%
			}
		%>
	</SELECT>
	<h1>* DISTINCT ��� GROUP BY�� ����ؾ߸��ϴ� ���</h1>
	<SELECT name="dept">
		<option value="">:::����:::</option>
		<%
			for(HashMap<String, Integer> m : groupByList){
		%>
		<option value="<%=m.get("deptNo")%>"><%=m.get("cnt")%> - <%=m.get("deptNo")%></option>
		<%
			}
		%>
	</SELECT>
</body>
</html>