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
%>
<jsp:useBean id="mybean" class="model.UserBean">
	<jsp:setProperty name="mybean" property="*" />
</jsp:useBean>
<%
	BoardDAO b= new BoardDAO();
	int result=b.login(mybean.getId(), mybean.getPassword());
	
	if(result==1){
		session.setAttribute("id", request.getParameter("id"));
		response.sendRedirect("BoardList.jsp");
	}
	else if(result==0){
%>
	<script type="text/javascript">
		alert("비밀번호가 틀립니다.")
		history.go(-1)
	</script>
<%
	}
	else if(result==-1){
%>
	<script type="text/javascript">
		alert("아이디가 틀립니다.")
		history.go(-1)
	</script>
	
<%
	}
	else if(result==-2){
%>
		<script type="text/javascript">
			alert("DB 오류")
			history.go(-1)
		</script>
		
<%		
	}
%>
</body>
</html>