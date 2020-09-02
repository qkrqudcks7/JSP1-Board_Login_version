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
<jsp:useBean id="mybean" class="model.UserBean">
	<jsp:setProperty name="mybean" property="*"/>
</jsp:useBean>
<%
	request.setCharacterEncoding("euc-kr");
	BoardDAO b=new BoardDAO();
	
	if(mybean.getPassword().equals(request.getParameter("password2"))){
		b.insertUser(mybean);
		response.sendRedirect("Login.jsp");
	}
	else{
%>
		<script type="text/javascript">
			alert("패스워드가 다릅니다.")
			history.go(-1)
		</script>
<%
	}
	
%>
</body>
</html>