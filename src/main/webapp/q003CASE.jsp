<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
 <%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>

<!-- Model -->
<%
	ArrayList<HashMap<String, String>> caseList = EmpDAO.selectJobCaseList();

%>

<!-- view -->


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>JObList</h1>
	<table border='1'>
		<tr>
			<th>ENAME</th>
			<th>JOB</th>
			<th>COLOR</th>
		</tr>
	<%
		for(HashMap<String, String> m: caseList){
	%>
		<tr>
			<th><%=(String)(m.get("ename"))%></th>
			<th><%=(String)(m.get("job"))%></th>
			<th><%=(String)(m.get("color"))%></th>
		</tr>
	<%
		}
	%>
	</table>
</body>
</html>