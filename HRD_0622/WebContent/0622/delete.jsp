<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>퇴사 처리</title>
<link type="text/css" rel="stylesheet" href="style.css">

<script type="text/javascript">
function delcheck(){
	if(document.delform.name.value==""){
		alert("이름을 입력하시오.");
		document.delform.name.focus();
	}
	if(document.delform.id.value==""){
		alert("사원번호이 입력되지 않았습니다.");
		document.delform.id.focus();
		return;
	}
		document.delform.submit();	
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

<form name=delform method="post" action="delete_process.jsp">
<h2>인사관리 퇴사처리 화면</h2>

<table border=1px align=center width=400px>
<tr>
<th>성명</th>
<td><input type=text name=name size=30></td>
</tr>

<tr>
<th>사원번호</th>
<td><input type=text name=id size=30></td>
</tr>

<tr align=center><td colspan=2>
<input type=button value=삭제 onClick="javascript:delcheck()">
<input type="button" value=취소 onclick="location.href='index.jsp'">
<button onclick="location.href='address'">button</button>
</td></tr>

</table>
</form>
</div>
</section>

<footer><jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
</html>