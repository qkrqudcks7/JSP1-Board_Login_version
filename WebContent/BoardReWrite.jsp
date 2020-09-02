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
	String id=(String)session.getAttribute("id");
	int num=Integer.parseInt(request.getParameter("num"));
	int ref=Integer.parseInt(request.getParameter("ref"));
	int re_step=Integer.parseInt(request.getParameter("re_step"));
	int re_level=Integer.parseInt(request.getParameter("re_level"));
%>
<center>
<h2>답변글 입력하기</h2>
<form action="BoardReWriteProc.jsp" method="post">
<table width=600 border=1>
<tr height=40>
	<td width=150 align="center">작성자</td>
	<td width=450><input type="text" name="id" value=<%=id %> size=60 readonly="readonly"></td>
</tr>
<tr height=40>
	<td width=150 align="center">제목</td>
	<td width=450><input type="text" name="subject" value="ㄴ[답글] " size=60></td>
</tr>
<tr height=100>
	<td width=150 align="center">글내용</td>
	<td width=450><textarea rows=10 cols=60 name="content"></textarea></td>
</tr>
<tr height=40>
	<td align="center" colspan="2">
	<input type="hidden" name="id" value=<%=id %>>
	<input type="hidden" name="ref" value=<%=ref %>>
	<input type="hidden" name="re_step" value=<%=re_step %>>
	<input type="hidden" name="re_level" value=<%=re_level %>>
	<input type="submit" value="답글 쓰기 완료">&nbsp;&nbsp;
	<input type="reset" value="취소">&nbsp;&nbsp;
	<input type="button" onclick="location.href='BoardList.jsp'" value="전체 글 보기">
	</td>
</tr>
</table>
</form>
</center>
</body>
</html>