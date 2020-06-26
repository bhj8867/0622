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

String id=request.getParameter("id");//폼에서 입력받은 id(from name =id)

String name=request.getParameter("name");
String position=request.getParameter("position");
String duty=request.getParameter("duty");
String phone=request.getParameter("phone");
String dept=request.getParameter("dept");
//int idx=Integer.parseInt(request.getParameter("id")); 폼에서 넘어오는 데이터는 모두 string으로 넘어 오기때문에 반드시 이렇게 해줘야한다.

//폼에서 입력받은 id idx로 변수설정

try{
		String sql="update personnel set id=?, name=?, position=?,duty=?,dept=?,phone=? where id="+id;
		//sql="update personnel set name="+name+",position="+position+",duty="+duty+",dept="+dept+",phone="+phone+" where name="+id;
		//sql="update personnel set name='"+name+"',position='"+position+"',duty='"+duty+"',dept='"+dept+"' where id="+id";
		 //System.out.println(sql);
	 	pstmt=conn.prepareStatement(sql);
	 	pstmt.setString(1,id);//string id
		pstmt.setString(2,name);
		pstmt.setString(3,position);
		pstmt.setString(4,duty);
		pstmt.setString(5,dept);
		pstmt.setString(6,phone);
		pstmt.executeUpdate();

		%>
		<script>
			self.window.alert("수정되었습니다.");
			location.href="select.jsp";
		</script>
		<%
	}catch(SQLException e){
		out.println("실패 "+e.getMessage());
		%>
		<script>
			self.window.alert("인사 정보를 다시 확인하세요.");
			loacation.href="javascript:history.back()";
		</script>
		<%	
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