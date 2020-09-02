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
	request.setCharacterEncoding("euc-kr");
	int num=Integer.parseInt(request.getParameter("num"));
	BoardDAO b= new BoardDAO();
	b.deleteBoard(num);
	response.sendRedirect("BoardList.jsp");
%>
</body>
</html>