<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ValTel.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form action="Pwd_valtel" method="post">
    <span style="color: red"><!-- ${requestScope.sendMailMsg}--></span>  
         用户名：<input type="text" name="userNameOrEmail" /><span style="color: red">...</span><br/> 
         
    <span style="color: red"><!-- ${requestScope.sendMailMsg}--></span>  
         联系电话：<input type="text" name="userNameOrEmail" /><span style="color: red">...</span><br/>        
    <input type="submit" value="提交" /><a href=""></a>  
</form>  
  </body>
</html>