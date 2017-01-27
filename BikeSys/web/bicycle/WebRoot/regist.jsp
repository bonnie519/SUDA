<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <meta charset="UTF-8">
    <meta name=viewport content="width=device-width">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title></title>
    <style>
    h4{
        text-align:center;
        color:#843534;
        padding:10px;
        margin-top:50px;
    }
        .myspan span{
     		padding-top:20px;
            font-weight: bold;
        }
        footer{
            text-align:center;
            margin:40px auto 50px auto;
        }
        #login{
        margin-right:20px;
        }
    </style>
    
     <script type="text/javascript">
		function checkForm(form)
		{
			//var user=document.getElementById("username").value;
			//var pwd= document.getElementById("password").value;
			//alert(user+"|pwd:"+pwd);
			
			if(form.username.value=="")
        	{
            	alert("用户名不能为空！");
            	form.username.focus();
            	return false;
        	}
        	else if(form.password.value=="")
        	{
            	alert("密码不能为空!");
            	form.password.focus();
            	return false;
        	}
			else return true;
		}
		</script>
</head>
<body>
    <div class="container">
        <h4>注册新用户</h4>
        <hr>
    <form onSubmit="return checkForm(this);" role="form" class="form-horizontal" action="regist" method="post"  id="appForm">
    <div class="form-group">
        <label class="col-xs-2 col-xs-offset-3 control-label">用户名</label>
            <div class="col-xs-3">
                <input type="text" class="form-control" placeholder="Enter username"
               id="username" name="username">
            </div>
    </div>

    <div class="form-group myspan">
        <label class="col-xs-2 col-xs-offset-3 control-label">身份证</label>
        <div class="col-xs-3">
            <input type="text" class="form-control" placeholder="Enter username"
                   id="ID">
        </div>
         <span > *（最多xx个字符）</span>
    </div>
    <div class="form-group myspan">
        <label class="col-xs-2 col-xs-offset-3 control-label">姓名</label>
        <div class="col-xs-3">
            <input type="text" class="form-control" placeholder="Enter username"
                   id="name">
        </div>
         <span > *（最多xx个字符）</span>
    </div>
    <div class="form-group">
        <label class="col-xs-2 col-xs-offset-3 control-label">性别</label>
        <div class="col-xs-3">
            <select name="sex" class="form-control" placeholder="Enter username"
                   id="sex">
                <option value="1">男</option>
                <option value="0">女</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 col-xs-offset-3 control-label">地址</label>
        <div class="col-xs-3">
            <input type="address" class="form-control" placeholder="Enter username"
                   id="address">
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 col-xs-offset-3 control-label">联系电话</label>
        <div class="col-xs-3">
            <input type="phone" class="form-control" placeholder="Enter username"
                   id="phone">
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 col-xs-offset-3 control-label">职位</label>
        <div class="col-xs-3">
            <input type="text" class="form-control" placeholder="Enter username"
                   id="position">
        </div>
    </div>
    <div class="form-group">
        <label class="col-xs-2 col-xs-offset-3 control-label">用户类型</label>
        <div class="col-xs-3">
            <select id="role" name="userlevel" class="form-control">
                <option >请选择</option>
                <option value="admin">管理员</option>
                <option value="admin">服务人员</option>
                <option value="admin">普通客户</option>
            </select>
        </div>
    </div>
    <div class="form-group myspan">
        <label class="col-xs-2 col-xs-offset-3 control-label">密码</label>
        <div class="col-xs-3">
            <input type="text" class="form-control" placeholder="Enter username"
                   id="password" name="password">
        </div>
        <span > *（最多xx个字符）</span>
    </div>

    <div class="form-group">
        <label class="col-xs-2 col-xs-offset-3 control-label">重复密码</label>
        <div class="col-xs-3">
            <input type="password" class="form-control" placeholder="Enter username"
                   id="cfrpwd">
        </div>
    </div>
        
    <div class="form-group">
        <div class="col-xs-2 col-xs-offset-5 mybuttons">
        <span id="login"><button type="submit" class="btn btn-default"
                                     name="submit1">提交</button></span>

			<span ><button type="reset" class="btn btn-default"
                           name="reset1">重置</button></span>
            </div>
        </div>
    </form>

        <footer>
        @copyright2015
        </footer>
    </div>
    
   
  </body>
  </html>