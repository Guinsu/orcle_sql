<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>

<!-- controller -->
<%

	//어떤 컬럼으로 정렬
	String col = request.getParameter("col");
	System.out.println(col + "<-----q005OrderBy.jsp param col");

	// asc(오름차순) / desc(내림차순)
	String sort = request.getParameter("sort");
	System.out.println(sort + "<-----q005OrderBy.jsp param sort");
	
	// DAO(모델) 호출 -> 모델 반환
	ArrayList<Emp> list = EmpDAO.selectEmpLisSort(col, sort);
	System.out.println(list.size() + " <-- q005OrderBy.jsp list.size()");	

%>

<!-- view -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>
				empno
				<a href="./q005OrderBy.jsp?col=empno&sort=asc">오름차순</a>
				<a href="./q005OrderBy.jsp?col=empno&sort=desc">내림차순</a>
			</th>
			<th>
				ename
				<a href="./q005OrderBy.jsp?col=ename&sort=asc">오름차순</a>
				<a href="./q005OrderBy.jsp?col=ename&sort=desc">내림차순</a>
			</th>
		</tr>
		
		<%
			for(Emp e : list){
		%>
			<tr>
				<td><%=e.getEmpNo()%></td>
				<td><%=e.geteName()%></td>
			</tr>
		
		<%
			}
		%>
	</table>
</body>
</html>