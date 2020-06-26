<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직원정보조회</title>
<link type="text/css" rel="stylesheet" href="style.css">

</head>
<body>
<header>
<jsp:include page="header.jsp" />
</header>

<nav>
<jsp:include page="nav.jsp"></jsp:include>
</nav>

<section>
<div class="section">
<%@ include file="DBconn.jsp" %>
<%
//request.setCharacterEncoding("utf-8");
%>

<form name="form" method="post">
<h2>직원 정보 조회</h2>
<table border=1 align=center width=800px>
<!-- th -->
<tr>
<th>no</th>
<th>성명</th>
<th>사번</th>
<th>직급</th>
<th>직책</th>
<th>연락처</th>
<th>소속부서</th>
</tr>

<%
ResultSet rs=null;
PreparedStatement pstmt=null;
int cnt=0;
try{
	String sql="select name,id,position,duty,phone,dept from personnel order by id";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	while(rs.next()){
		cnt++;
		String name=rs.getString("name");//DB에있는 데이터 불러옴
		
		//숫자를 int로 받아오는 것
		//int id=rs.getInt("id"); 
		
		//숫자를 문자로 받아온는것 상관없다.
		String id=rs.getString("id");
		
		String position=rs.getString("position");
		String duty=rs.getString("duty");
		String phone=rs.getString("phone");
		String dept=rs.getString("dept");
%>
<tr >
<td align=center><%=cnt %></td>
<td align=center><%=name %></td>
<td align=center><a href="modify.jsp?id=<%=id%>"><%=id%></a></td>
<td align=center><%=position %></td>
<td align=center><%=duty %></td>
<td align=center><%=phone %></td>
<td align=center><%=dept %></td>
</tr>
<%			
	}
}catch(SQLException e){
	out.println("테이블 호출 실패 "+e.getMessage());
	
}finally{
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}

%>
</table>
</form>
</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>