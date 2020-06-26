<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원등록</title>
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

<form name=insertform method="post" action="insert_process.jsp">
<h2>인사관리 사원 등록 화면</h2>

<table border=1px align=center width=400px>
<tr>
<th>성명</th>
<td><input type=text name=name size=30></td>
</tr>

<tr>
<th>사원번호</th>
<td><input type=text name=id size=30></td>
</tr>

<tr>
<th>소속부서</th>
<td>
<select name="dept">
<option value="인사부" selected>인사부</option>
<option value="기획부" >기획부</option>
<option value="홍보부" >홍보부</option>
<option value="영업부" >영업부</option>
<option value="경리부" >경리부</option></select>
</td>
</tr>

<tr>
<th>직급</th>
<td>
<select name="position">
<option value="1" selected >1급</option>
<option value="2" >2급</option>
<option value="3" >3급</option>
<option value="4" >4급</option>
</select>
</td>
</tr>

<tr>
<th>직책</th>
<td><input type=text name=duty size=30></td>
</tr>

<tr>
<th>연락처</th>
<td><input type=text name=phone size=30></td>
</tr>

<tr align=center><td colspan=2>
<input type=button value=전송 onClick="javascript:check()">
<input type="reset" value="다시작성">
</td></tr>


</table>


</form>
</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>