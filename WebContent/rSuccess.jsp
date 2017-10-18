<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rSuccess.jsp' starting page</title>
    
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="padding-top:50px">
    <div class="jumbotron">
      <div class="container">
      	<center>
	        <h1>注册成功</h1>
	        <p>欢迎加入四次元口袋</p>
	        <a href="main.jsp">点击此处返回主页</a>
        </center>
      </div>
    </div>
  </body>
</html>
