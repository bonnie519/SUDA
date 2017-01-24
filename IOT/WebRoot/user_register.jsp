<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/struts-tags"  prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<title>学生报名</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/style-metro.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	
	<link href="media/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/jquery.gritter.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/daterangepicker.css" rel="stylesheet" type="text/css" />
	<link href="media/css/fullcalendar.css" rel="stylesheet" type="text/css"/>
	<link href="media/css/jqvmap.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="media/css/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen"/>
	<link rel="stylesheet" type="text/css" href="media/css/datetimepicker.css" />
	<link rel="shortcut icon" href="media/image/favicon.ico" />

	<!-- ****************************用户自定义的CSS************************************* -->
	<link href="css/webControl.css" rel="stylesheet" type="text/css"/>
	<!-- ***************************************************************** -->
	<script src="media/js/jquery-2.0.0.js" type="text/javascript"></script>
	<script src="media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	<script src="media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      
	<script src="media/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.blockui.min.js" type="text/javascript"></script>  
	<script src="media/js/jquery.cookie.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.uniform.min.js" type="text/javascript" ></script>
	<script src="media/js/jquery.vmap.js" type="text/javascript"></script>   
	<script src="media/js/jquery.vmap.russia.js" type="text/javascript"></script>
	<script src="media/js/jquery.vmap.world.js" type="text/javascript"></script>
	<script src="media/js/jquery.vmap.europe.js" type="text/javascript"></script>
	<script src="media/js/jquery.vmap.germany.js" type="text/javascript"></script>
	<script src="media/js/jquery.vmap.usa.js" type="text/javascript"></script>
	<script src="media/js/jquery.vmap.sampledata.js" type="text/javascript"></script>  
	<script src="media/js/jquery.flot.js" type="text/javascript"></script>
	<script src="media/js/jquery.flot.resize.js" type="text/javascript"></script>
	<script src="media/js/jquery.pulsate.min.js" type="text/javascript"></script>
	<script src="media/js/date.js" type="text/javascript"></script>
	<script src="media/js/daterangepicker.js" type="text/javascript"></script>     
	<script src="media/js/jquery.gritter.js" type="text/javascript"></script>
	<script src="media/js/fullcalendar.min.js" type="text/javascript"></script>
	<script src="media/js/jquery.easy-pie-chart.js" type="text/javascript"></script>
	<script src="media/js/jquery.sparkline.min.js" type="text/javascript"></script> 
	<script src="media/js/index.js" type="text/javascript"></script> 
	<!-- ***************************************************************** --> 
	<script type="text/javascript" src="media/js/select2.min.js"></script>	
	<script type="text/javascript" src="media/js/bootstrap-datetimepicker.js"></script>	
	<script type="text/javascript" src="media/js/jquery.inputmask.bundle.min.js"></script> 
	<script src="media/js/app.js"></script>
	<script src="media/js/form-components.js"></script> 
	<!-- ***************************************************************** --> 
	<script>

		jQuery(document).ready(function() {    
		   App.init(); // initlayout and core plugins
		   Index.init();
		   FormComponents.init();
		   Index.initJQVMAP(); // init index page's custom scripts
		   Index.initCalendar(); // init index page's custom scripts
		   Index.initCharts(); // init index page's custom scripts
		   Index.initChat();
		   Index.initMiniCharts();
		   Index.initDashboardDaterange();
		   Index.initIntro();

		});

	</script>
	<style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #fff;
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
</head>

<body style="background-image:url(pic3.jpg)">
      <script>
      function login()
      {
          var frm=document.getElementById("myform");
          frm.action="login/user_login";
          frm.submit();
      }
      function register()
      {
          var frm=document.getElementById("myform");
          //frm.action="user_register.jsp";
          frm.action="login/user_register";
          frm.submit();
      }
      </script>

     <div style="margin-left:auto;margin-right:auto;margin-top:110px;">
          
         <p align="center" style="color:#33CCFF;font-size:15;font-weight:bold;">如果您还没有账号，赶快注册吧</p>
         <form class="form-signin" action="register/user_register" method="post" id="myform">
         <table>
               <tr>
               <td>用户名：</td>
               <td> <input type="text" class="input-block-level" placeholder="请输入用户名" name="account"/></td>
               </tr>
                <tr>
               <td>真实姓名：</td>
               <td> <input type="text" class="input-block-level" placeholder="请输入真实姓名" name="name"/></td>
               </tr>
                <tr>
               <td>密码：</td>
               <td> <input type="password" class="input-block-level" placeholder="请输入密码" name="password"/></td>
               </tr>
                <tr>
               <td>年龄：</td>
               <td> <input type="text" class="input-block-level" placeholder="请输入年龄" name="age"/></td>
               </tr>
                <tr>
               <td>性别：</td>
               <td><label class="radio inline"><input type="radio" name="sex" value="man"/>男</label>&nbsp;&nbsp;&nbsp;&nbsp;<label class="radio inline"><input type="radio" name="sex" value="woman"/>女</label></td>
               </tr>
               <tr>
               <td>地址：</td>
               <td> <textarea name="address" placeholder="请输入地址"></textarea></td>
               </tr>
               
               
         </table>
          <div align="center">
          <input class="btn-default btn-large" type="submit" value="提交"/>
          </div>
       
      </form>
     
    </div>
</body>
</html>