<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<input type="button" onclick="location.href='BoardList.jsp'" value="게시판 바로가기">
<center>
<h2>게시판 로그인</h2>
<br>
<br>
<form action="LoginProc.jsp" method="post">
<table width=400 border=1>
<tr height=50>
	<td width=350 align="center"><input type="text" name="id" placeholder="아이디:" size=50></td>
</tr>
<tr height=50>
	<td width=350 align="center"><input type="password" name="password" placeholder="비밀번호:" size=52></td>
</tr>
<tr height=50>
	<td colspan="2" align="center">
	<input type="submit" value="로그인"> &nbsp;&nbsp;
	<input type="button" onclick="location.href='Join.jsp'" value="회원가입">
	</td>
</tr>
</table>
</form>
</center>
</body>
</html>