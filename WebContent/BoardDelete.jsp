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
	int num=Integer.parseInt(request.getParameter("num"));
	BoardDAO b = new BoardDAO();
	BoardBean bean=b.getOneUpdate(num);
	
	if(session.getAttribute("id").equals(bean.getId()) || bean.getId()==null){
%>
		<center>
		<h2>게시글 삭제</h2>
		<form action="BoardDeleteProc.jsp" method="post">
		<table width=600 border=1 bgcolor="skyblue">
		<tr height=40>
			<td width=120 align="center">작성자</td>
			<td width=180 align="center"><%=bean.getId() %></td>
			<td width=120 align="center">작성일</td>
			<td width=180 align="center"><%=bean.getReg_date() %></td>
		</tr>
		<tr height=40>
			<td width=120 align="center">제목</td>
			<td align="center" colspan="3"><%=bean.getName() %></td>
		</tr>
		<tr height=40>
			<td align="center" colspan="4">
			<input type="hidden" name="num" value="<%=num%>">
			<input type="submit" value="글 삭제">&nbsp;&nbsp;
			<input type="button" value="취소" onclick="location.href='BoardList.jsp'">
			</td>
		</tr>
		</table>
		</form>
		</center>
<%
	}
	else{
%>
		<script type="text/javascript">
			alert("작성자만 삭제할 수 있습니다.")
			history.go(-1)
		</script>
<%
	}
%>
</body>
</html>