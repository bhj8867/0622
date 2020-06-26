<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보변경</title>
<link type="text/css" rel="stylesheet" href="style.css">

<script type="text/javascript">
function check(){
	if(document.insertform.name.value==""){
		alert("이름을 입력하시오.");
		document.insertform.name.focus();
		
	}
	if(document.insertform.id.value==""){
		alert("사원번호이 입력되지 않았습니다.");
		document.insertform.id.focus();
		
	}
		document.insertform.submit();
	
}
</script>

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
<%@ include file = "DBconn.jsp" %>
<%

ResultSet rs=null;
PreparedStatement pstmt=null;

int id=Integer.parseInt(request.getParameter("id"));
/* String id=""; */
String name="";
String position="";
String duty="";
String phone="";
String dept="";

try{
	String sql="select name,id,position,duty,phone,dept from personnel where id="+id;
	/* 순서도 중요 */
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		id=rs.getInt("id");
		name=rs.getString("name");
		position=rs.getString("position");
		duty=rs.getString("duty");
		phone=rs.getString("phone");
		dept=rs.getString("dept");
		System.out.print(name+id+position+duty+phone+dept);
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


<form name=insertform method="post" action="modify_process.jsp">
<h2>인사관리 사원 정보 변경 화면</h2>

<table border=1px align=center width=400px>
<tr>
<th>성명</th>
<td><input type=text name=name size=30 value="<%=name %>"></td>
</tr>

<tr>
<th>사원번호</th>
<td><input type=text name=id size=30 value="<%=id%>"></td>
</tr>

<tr>
<th>소속부서</th>
<td>
<select name="dept" >
<option value="인사부" <%if(dept.equals("인사부")){%>selected<%}%>>인사부</option>
<option value="기획부" <%if(dept.equals("기획부")){%>selected<%}%>>기획부</option>
<option value="홍보부" <%if(dept.equals("홍보부")){%>selected<%}%>>홍보부</option>
<option value="영업부" <%if(dept.equals("영업부")){%>selected<%}%>>영업부</option>
<option value="경리부" <%if(dept.equals("경리부")){%>selected<%}%>>경리부</option></select>
</td>
</tr>

<tr>
<th>직급</th>
<td>
<select name="position">
<option value="1" <%if(position.equals("1")){%>selected<%}%>>1급</option>
<option value="2" <%if(position.equals("2")){%>selected<%}%>>2급</option>
<option value="3" <%if(position.equals("3")){%>selected<%}%>>3급</option>
<option value="4" <%if(position.equals("4")){%>selected<%}%>>4급</option>
</select>
</td>
</tr>

<tr>
<th>직책</th>
<td><input type=text name=duty size=30 value="<%=duty%>"></td>
</tr>

<tr>
<th>연락처</th>
<td><input type=text name=phone size=30 value="<%=phone%>"></td>
</tr>

<tr align=center><td colspan=2>
<input type=button value="수정" onClick="javascript:check()">
<input type=button value="취소" onclick="location.href='index.jsp'">
</td></tr>


</table>
</form>
</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>