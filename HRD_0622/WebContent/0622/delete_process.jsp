<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ include file="DBconn.jsp" %>
<% 
request.setCharacterEncoding("utf-8");

PreparedStatement pstmt=null;
ResultSet rs=null;
String sql="";

String name=request.getParameter("name");

String id=request.getParameter("id");
System.out.println("입력 : " +name+id);

try{
	sql="select id,name from personnel where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);//입력받은 idx가 db의 id와 일치하면 sql 조회한다.
	rs=pstmt.executeQuery();

		if(rs.next()){
			String rId=rs.getString("id");
			String rName=rs.getString("name");
			
			if (pstmt != null) 
				pstmt.close();
			
			if(id.equals(rId)){
				sql="delete from personnel where name=? and id=?";
				pstmt=conn.prepareStatement(sql);

				pstmt.setString(1, name);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
				
				%>
				<script type="text/javascript">
				self.window.alert("퇴사처리 하였습니다.");
				location.href="jacascript:history.back()"
				location.href="index.jsp";
				</script>
				<%
	}else{
		%>
		<script type="text/javascript">
		self.window.alert("일치하는 아이디가 없습니다.");
		location.href="javascript:history.back()";
		</script>
		<% 
		}
		
	}else{
		%>
		<script type="text/javascript">
		self.window.alert("일치하는 이름이 없습니다.");
		location.href="javascript:history.back()";
		</script>
		<%
}
}catch(SQLException e) {
	out.print("오류" + e.getMessage());
} finally {
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
}

%>
