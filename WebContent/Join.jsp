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
<h2>ȸ������</h2>
<form action="JoinProcess.jsp" method="post">
	<table width="500" border="1">
	<tr height="50">
		<td width="150" align="center">���̵�</td>
		<td width="300" align="center"><input type="text" name="id" size="30" placeholder="���̵�� ������ ���ڸ� �־��ּ���"></td> 
	</tr>
	<tr height="50">
		<td width="150" align="center">��й�ȣ</td>
		<td width="300" align="center"><input type="password" name="password" size="32" placeholder="�н������ ������ ���ڸ� �Է��ϼ���"></td> 
	</tr>
	<tr height="50">
		<td width="150" align="center">��й�ȣ Ȯ��</td>
		<td width="300" align="center"><input type="password" name="password2" size="32" placeholder="��й�ȣ�� �Ȱ��� �Է��ϼ���"></td> 
	</tr>
	<tr height="50">
		<td width="150" align="center">�̸�</td>
		<td width="300" align="center"><input type="text" name="name" size="30"></td> 
	</tr>
		<tr height="50">
		<td width="150" align="center">��ȭ��ȣ</td>
		<td width="300" align="center"><input type="tel" name="phone" size="30"></td> 
	</tr>
	<tr height="50">
		<td width="150" align="center">�̸���</td>
		<td width="300" align="center"><input type="email" name="email" size="30"></td> 
	</tr>
	<tr>
		<td align="center" colspan="2">
		<input type="submit" value="ȸ������">&nbsp;&nbsp;
		<input type="reset" value="���">&nbsp;&nbsp;
		<input type="button" value="���ư���" onclick="location.href='Login.jsp'">
		</td>
	</tr>
	</table>
	</form>
</center>
</body>
</html>