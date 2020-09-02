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
	BoardDAO b=new BoardDAO();
	BoardBean bean= b.getOneUpdate(num);
	if(session.getAttribute("id").equals(bean.getId())){
%>
	<center>
		<h2>게시글 수정</h2>
		<form action="BoardUpdateProc.jsp" method="post">
		<table width=600 border=1 bgcolor="skyblue">
		<tr height=40>
			<td width=120 align="center">작성자</td>
			<td width=180 align="center"><%=bean.getId() %></td>
			<td width=120 align="center">작성일</td>
			<td width=180 align="center"><%=bean.getReg_date() %></td>
		</tr>
		<tr height=40>
			<td width=120 align="center">제목</td>
			<td width=480 colspan="3">&nbsp;
			<input type="text" name="subject" value="<%=bean.getSubject() %>" size=60>
			</td>
		</tr>
		<tr height=40>
			<td width=120 align="center">글 내용</td>
			<td width=480 colspan="3">&nbsp;
			<textarea rows=10 cols=60 name="content" align="left"><%=bean.getContent() %></textarea>
			</td>
		</tr>
		<tr height=40>
			<td colspan="4" align="center">
			<input type="hidden" name="num" value="<%=bean.getNum() %>">
			<input type="submit"value="글 수정">&nbsp;&nbsp;
			<input type="button" onclick="location.href='BoardList.jsp'" value="전체 보기">
		</table>
		</form>
		</center>
<%
	}
	else{
%>
		<script type="text/javascript">
			alert("작성자만 변경할 수 있습니다.")
			history.go(-1)
		</script>
<%
	}
%>

</body>
</html>