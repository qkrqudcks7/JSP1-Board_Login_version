<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int num= Integer.parseInt(request.getParameter("num").trim());
	BoardDAO b = new BoardDAO();
	BoardBean bean = b.getOneBoard(num);
%>
<center>
<h2>�Խñ� ����</h2>
<table width=600 border=1 bgcolor="skyblue">
<tr height=40>
	<td align="center" width=120>�۹�ȣ</td>
	<td align="center" width=180><%=bean.getNum() %></td>
	<td align="center" width=120>��ȸ��</td>
	<td align="center" width=180><%=bean.getReadcount() %></td>
</tr>
<tr height=40>
	<td align="center" width=120>�ۼ���</td>
	<td align="center" width=180><%=bean.getId() %></td>
	<td align="center" width=120>�ۼ���</td>
	<td align="center" width=180><%=bean.getReg_date() %></td>
</tr>
<tr height=40>
	<td align="center" width=120>����</td>
	<td align="center" colspan="3"><%=bean.getSubject() %></td>
</tr>
<tr height=100>
	<td align="center" width=120>�� ����</td>
	<td align="center" colspan="3"><%=bean.getContent() %></td>
</tr>
<tr height=40>
	<td align="center" colspan="4">
	<input type="button" value="��۾���" onclick="location.href='BoardReWrite.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'">
	<input type="button" value="�����ϱ�" onclick="location.href='BoardUpdate.jsp?num=<%=bean.getNum() %>'">
	<input type="button" value="�����ϱ�" onclick="location.href='BoardDelete.jsp?num=<%=bean.getNum() %>'">
	<input type="button" value="��ü����" onclick="location.href='BoardList.jsp'">
	</td>
</tr>
</table>
</center>
</body>
</html>