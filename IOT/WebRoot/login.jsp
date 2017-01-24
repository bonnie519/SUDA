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

<body style="background-image:url(pic2.jpg)">
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

     <div style="margin-left:auto;margin-right:auto;margin-top:150px;">
      
      <form class="form-signin" action="login/user_login" method="post" id="myform">
       
        <h2 align="center" class="form-signin-heading">请登录</h2>
        <input type="text" class="input-block-level" placeholder="用户名" name="name"/>
        <input type="password" class="input-block-level" placeholder="密码" name="password"/>
        <label class="checkbox">
          <input type="checkbox" value="remember-me">记住密码
        </label>
        <div align="center">
        <input class="btn-default btn-large" type="submit" value="登录" onclick="login()"/>&nbsp;&nbsp;&nbsp;
        <input class="btn-default btn-large" type="submit" value="注册" onclick="register()"/>
        </div>
      </form>
     
    </div>
</body>
</html>