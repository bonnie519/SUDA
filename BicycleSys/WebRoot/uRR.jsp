<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bmap.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=1" />
    <link rel="stylesheet" type="text/css" href="css/my.css">
    
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/laydate.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
    <style type="text/css">
        body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
       
        .buttons{
            text-align:center;
            margin:auto;
        }
       #tableinfo{margin:100px auto; width:75%;height:75%;overflow-y:auto;}
	#btnmenu{float:left;}
	#fm{margin-top:50px;margin-bottom:40px;}
    </style>
    <title></title>

</head>
<body>
<!--LnyRpG5KzEHzzsvz4Hx8ICTv  26.336164,52.030018-->
<div class="space">
 <nav class="navbar navbar-inverse navbar-fixed-top mynav" role="navigation">
	<div class="navbar-header">
		<img  id="logo"  src="img/bike.jpg" width="168" height="75"/>

	</div>

		<!--<div id="navbar" class="collapse navbar-collapse">-->
		<div id="mnav">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="indexusr.jsp">主页</a></li>
				<!-- <li><a href="qry_sta.action">站点信息</a></li>-->
				<li><a href="qrynn.action">网点地图</a></li>
				<li  class="dropdown active">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
               		租赁信息
               		<!--<span class="caret"></span>-->
            	</a>
	            	<ul class="dropdown-menu" role="menu">
	               		<li class="active"><a href="uRR.jsp">借还车记录</a></li>
	               		<li><a href="uBal.jsp">卡余额</a></li>
	               			               	
	               		
	            	</ul>
         		</li>
         		<li><a href="Guide.jsp">服务指南</a></li>
				
				<li><a href="#">关于</li>
				
			</ul>
			
			<!--<li id="usr" class="dropdown">
	            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
	               		租赁管理
	               		
	            	</a>
		            	<ul class="dropdown-menu" role="menu">
		               		<li><a href="RR.jsp">借还车记录</a></li>
		               		<li><a href="Bal.jsp">卡余额</a></li>
		               		
		               		<li><a href="qry_sta.action">站点信息</a></li>
		            	</ul>
	         		</li> -->
			
			<ul  class="nav navbar-nav navbar-right">
				<li class="navbar-text">
               		登录
         		</li>
			</ul> 
			
        </div> 		
		</div>
	</div>
	</nav>
</div>


<div class="flexslider" id="banner-tabs">
<br />
<div class="slides">
		
			<a title="" target="_blank" href="index.jsp">
				<img width="1360" height="200" alt="" style="background: url(img/bikel.jpg) no-repeat center;" src="img/alpha.png">
			</a>
	</div>
</div>   

<div class="starter">
<div id="lef">
    公告栏<br />
    <ul>
    <li>x月x日xx站点停运通知</li>
    <li>xx领导检查通知</li>
    <li>放假通知</li>
    <li>春节放假通知</li>
    <li>国庆放假通知</li>
    <li>端午放假通知</li>
    <li>五一放假通知</li>
    <li>清明放假通知</li>

    </ul>
</div>
<div id="rig">
<div class="mtitle">借还车记录</div>
<form action="QryRr_inf.action" method="post" role="form">
<div class="form-group" id="dt">
日期：从<input class="laydate-icon" id="start" name="startd">到
<input class="laydate-icon" id="end" name="endd">
<!--<input type="date" name="startd">  -->
<span>
地区：
<select name="district">
		<option></option>
		<option>沧浪区</option>
		<option>吴中区</option>
		<option>相城区</option>
		<option>xx区</option>
</select>
</span>
<button type="submit" class="btn btn-default">Search</button>
</div>
</form>	
    <div id="tableinfo">
    
 <table class="table table-hover" style="width:100%;height:78%;">
 <thead>
	 <script language="javascript">
	    var result="<s:property value="#request.returnv" />";
		if(result!="")
		{
			document.write("<tr><th>卡号</th><th>借车日期</th><th>借车站点</th><th>借车车位</th><th>还车日期</th><th>还车站点</th><th>还车车位</th></tr></thead>");
			if(result=="F")
			alert("查询失败！无此条件下的借还记录信息");
			//document.getElementById("cinfo").innerHTML="查询失败！请检查卡信息";
			
		}
	</script>
    </thead>
    <tbody>
    <c:forEach var="record" items="${rentr}">
    <tr class="success"><td>${record.cardno}</td>
  	<td>${record.bdate}</td>
    <td>${record.stationb}</td>
    <td>${record.bbnum}</td>
    <td>${record.rdate}</td>
    <td>${record.stationr}</td>
    <td>${record.rbnum}</td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
    
    </div>
</div>
</div>

<div id="last">
 <footer>
  ©2015:Bei Gao&nbsp;&nbsp;&nbsp;Soochow University
  </footer>
 </div>
</html>
<script language="javascript">

(function(){
        laydate.skin('danlan');//切换皮肤，请查看skins下面皮肤库
        laydate({elem: '#start'});//绑定元素
        laydate({elem: '#end'});//绑定元素
}());    

 //日期范围限制
    var start = {
        elem: '#start',
        format: 'YYYY-MM-DD',
        min: '2000-01-01', //设定最小日期为当前日期
        max: '2099-06-16', //最大日期
        istime: true,
        istoday: false,
        choose: function(datas){
            end.min = datas; //开始日选好后，重置结束日的最小日期
            end.start = datas //将结束日的初始值设定为开始日
        }
    };

    var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16',
        istime: true,
        istoday: false,
        choose: function(datas){
            start.max = datas; //结束日选好后，充值开始日的最大日期
        }
    };
laydate(start);
laydate(end);

</script>
