<%@page import="model.BoardBean"%>
<%@page import="java.util.Vector"%>
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
	String id=null;
	if(session.getAttribute("id")!=null){
		id=(String)session.getAttribute("id");
	}
	BoardDAO b= new BoardDAO();
	Vector<BoardBean> v =b.getAll();
	
	if(id==null){
%>
		<input type="button" value="�α���" onclick="location.href='Login.jsp'">
<%
	}
	else{
%>
		<%=id %>�� �ݰ����ϴ�.&nbsp;&nbsp;<input type="button" value="�α׾ƿ�" onclick="location.href='Logout.jsp'">
		<center>
		<h2>��ü �Խñ� ����</h2>
		<table width=700 border=1>
		<tr height=40>
			<td align="right" colspan="5">
			<input type="hidden" value="<%=id %>">
			<input type="button" value="�۾���" onclick="location.href='BoardWrite.jsp'">
			</td>
		</tr>
		<tr height=40>
			<td width=50 align="center">��ȣ</td>
			<td width=320 align="center">����</td>
			<td width=100 align="center">�ۼ���</td>
			<td width=150 align="center">�ۼ���</td>
			<td width=70 align="center">��ȸ��</td>
		</tr>
		<%
			for(int i=0;i<v.size();i++){
				BoardBean bean= v.get(i);
		%>
		<tr height=40>
			<td width=50 align="center"><%=i+1 %></td>
			<td width=320 align="left">
			<a href="BoardInfo.jsp?num=<%=bean.getNum()%>" style="text-decoration:none">
			<%
				if(bean.getRe_step()>1){
					for(int j=0;j<(bean.getRe_step()-1)*5;j++){
			%>
						&nbsp;
			<%
					}
				}
			%>
			<%=bean.getSubject() %></a></td>
			<td width=100 align="center"><%=bean.getId() %></td>
			<td width=150 align="center"><%=bean.getReg_date() %></td>
			<td width=70 align="center"><%=bean.getReadcount() %></td>
		</tr>
		
		<%
			}
		%>
		</table>
		</center>
<%
		
	}
%>
</body>
</html>