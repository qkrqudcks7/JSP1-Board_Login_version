<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<input type="button" onclick="location.href='BoardList.jsp'" value="�Խ��� �ٷΰ���">
<center>
<h2>�Խ��� �α���</h2>
<br>
<br>
<form action="LoginProc.jsp" method="post">
<table width=400 border=1>
<tr height=50>
	<td width=350 align="center"><input type="text" name="id" placeholder="���̵�:" size=50></td>
</tr>
<tr height=50>
	<td width=350 align="center"><input type="password" name="password" placeholder="��й�ȣ:" size=52></td>
</tr>
<tr height=50>
	<td colspan="2" align="center">
	<input type="submit" value="�α���"> &nbsp;&nbsp;
	<input type="button" onclick="location.href='Join.jsp'" value="ȸ������">
	</td>
</tr>
</table>
</form>
</center>
</body>
</html>