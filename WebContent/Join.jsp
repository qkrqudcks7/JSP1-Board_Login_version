<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
<h2>회원가입</h2>
<form action="JoinProcess.jsp" method="post">
	<table width="500" border="1">
	<tr height="50">
		<td width="150" align="center">아이디</td>
		<td width="300" align="center"><input type="text" name="id" size="30" placeholder="아이디는 영문과 숫자만 넣어주세요"></td> 
	</tr>
	<tr height="50">
		<td width="150" align="center">비밀번호</td>
		<td width="300" align="center"><input type="password" name="password" size="32" placeholder="패스워드는 영문과 숫자를 입력하세요"></td> 
	</tr>
	<tr height="50">
		<td width="150" align="center">비밀번호 확인</td>
		<td width="300" align="center"><input type="password" name="password2" size="32" placeholder="비밀번호와 똑같이 입력하세요"></td> 
	</tr>
	<tr height="50">
		<td width="150" align="center">이름</td>
		<td width="300" align="center"><input type="text" name="name" size="30"></td> 
	</tr>
		<tr height="50">
		<td width="150" align="center">전화번호</td>
		<td width="300" align="center"><input type="tel" name="phone" size="30"></td> 
	</tr>
	<tr height="50">
		<td width="150" align="center">이메일</td>
		<td width="300" align="center"><input type="email" name="email" size="30"></td> 
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type="submit" value="회원가입">&nbsp;&nbsp;
		<input type="reset" value="취소">&nbsp;&nbsp;
		<input type="button" value="돌아가기" onclick="location.href='Login.jsp'">
		</td>
	</tr>
	</table>
	</form>
</center>
</body>
</html>