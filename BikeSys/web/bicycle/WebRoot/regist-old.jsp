<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>registration</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type=”text/css”>
<!–
body {
 font-family: Arial, Helvetica, sans-serif;
 font-size:12px;
 color:#666666;
 background:#fff;
 text-align:center;
}
* {
 margin:0;
 padding:0;
}
a {
 color:#1E7ACE;
 text-decoration:none;
}
a:hover {
 color:#000;
 text-decoration:underline;
}
h3 {
 font-size:14px;
 font-weight:bold;
}
pre,p {
 color:#1E7ACE;
 margin:4px;
}
input, select,textarea {
 padding:1px;
 margin:2px;
 font-size:11px;
}
.buttom{
 padding:1px 10px;
 font-size:12px;
 border:1px #1E7ACE solid;
 background:#D0F0FF;
}
#formwrapper {
 width:450px;
 margin:15px auto;
 padding:20px;
 text-align:left;
 border:1px solid #A4CDF2;
}
fieldset {
 padding:10px;
 margin-top:5px;
 border:1px solid #A4CDF2;
 background:#fff;
}
fieldset legend {
 color:#1E7ACE;
 font-weight:bold;
 padding:3px 20px 3px 20px;
 border:1px solid #A4CDF2;
 background:#fff;
}
fieldset label {
 float:left;
 width:120px;
 text-align:right;
 padding:4px;
 margin:1px;
}
fieldset div {
 clear:left;
 margin-bottom:2px;
}
.enter{ text-align:center;}
.clear {
 clear:both;
}-->
</style>
  </head>
  
  <body>
   <h3>未注册创建帐户</h3>
 <form action="regist.action" method="post" id=”apForm”>
 <fieldset>
  <legend>用户注册</legend>
  <p><strong>您的电子邮箱不会被公布出去,但是必须填写.</strong> 在您注册之前请先认真阅读服务条款.</p>
  <div>
  <label for="username">用户名</label>
  <input type="text" name="username" id="cr_Name"  size="20" maxlength="30" />
  *(最多30个字符)<br />
 </div>
 
 	<div class="form-group">
			<label class="col-xs-2 col-xs-offset-3 control-label">用户名</label>
			<div class="col-xs-3">
				<input type="text" class="form-control" placeholder="Enter username"
					id="username">
			</div>
		</div>
 
  <div>
  <label for="Email">电子邮箱</label>
  <input type="text" name="Email" id="Email" size="20" maxlength="150" /> *<br />
 </div>
  <div>
  <label for="password">密码</label>
  <input type="password" name="password" id="cr_password" size="18" maxlength="15" />
  *(最多15个字符)<br />
 </div>
  <div>
  <label for="confirm_password">重复密码</label>
  <input type="password" name="confirm_password" id="confirm_password" size="18" maxlength="15" />
  *<br />
 </div>
  <div>
  <label for="AgreeToTerms">同意服务条款</label>
      <input type="checkbox" name="AgreeToTerms" id="AgreeToTerms" value="1" />
      <a href="#" title="您是否同意服务条款">先看看条款？</a> * </div>
  <div class="enter">
  	<input name="Submit" type="submit" class="buttom" value="提交" />
     <input name="Submit" type="reset" class="buttom" value="重置" />
 </div>
  <p><strong>* 在提交您的注册信息时, 我们认为您已经同意了我们的服务条款.<br />
     * 这些条款可能在未经您同意的时候进行修改.</strong></p>
 </fieldset>
 </form>
 
  </body>
</html>