<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import= "vo.*"%>
<%@ page import= "dao.*" %>

<%
	// 여러개의 값 받기
	String[] ck = request.getParameterValues("ck");

	ArrayList<Emp> list = null;	
	ArrayList<Integer> ckList = new ArrayList<>();
	
	// ck 값 분기
	if(ck == null){
		System.out.println(ck + " <-- ck");	
	}else{
	
		for(String s : ck){
			ckList.add(Integer.parseInt(s));
		}
		
		System.out.println(ck.length + " <-- ck.length");
		list = EmpDAO.selectEmpListByGrade(ckList);
	
		System.out.println(ckList);
		
	}
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title></title>
</head>
<body>
   <h1>EMP GRADE 검색</h1>
   <form action="./q004WhereIn.jsp" method="post">
      GRADE : 
      <%
         for(int i=1; i<6; i=i+1) {
      %>
            <input name="ck" type="checkbox" value="<%=i%>"><%=i%>
      <%      
         }
      %>
      <br>
      <button type="submit">검색</button>
   </form>
   
   <hr>
   
   <h1>결과 View</h1>
   
   <%
   	if(ck == null){ 
   		return;  // ck가 null이면 아무것도 출력없이 끝
   	}
   	
   %>
   <table>
		<tr>
			<th>ename</th>
			<th>grade</th>
		</tr>
		<%
			for(Emp e : list){
		%>
			<tr>
				<td><%=e.geteName() %></td>
				<td><%=e.getGrade() %></td>
			</tr>
		<%
			}
		%>
   </table>
   
   <hr>
</body>
</html>