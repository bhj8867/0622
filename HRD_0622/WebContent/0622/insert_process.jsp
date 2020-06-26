<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert</title>
</head>
<body>
<%@ include file="DBconn.jsp" %>
<%
ResultSet rs=null;
PreparedStatement pstmt=null;

String sql="insert into personnel values(?,?,?,?,?,?)";
pstmt=conn.prepareStatement(sql);

try{
	pstmt.setString(1, request.getParameter("id"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("dept"));
	pstmt.setString(4, request.getParameter("position"));
	pstmt.setString(5, request.getParameter("duty"));
	pstmt.setString(6, request.getParameter("phone"));
	
	
	pstmt.executeUpdate();
	System.out.print("테이블 삽입 성공 ");
	%>
	<script type="text/javascript">
	alert("입력되었습니다.");
	location.href="select.jsp";
	</script>
	<% 
}catch(SQLException e){
	out.print("데이터 삽입 실패 "+e.getMessage());
}finally{
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
}
%>

</body>
</html>