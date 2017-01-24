<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<%@ page
	import="org.jfree.data.general.DefaultPieDataset,org.jfree.chart.ChartFactory
,org.jfree.chart.JFreeChart,org.jfree.chart.servlet.*,java.io.File"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<title>集群数据量统计界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="media/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/font-awesome.min.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/style-metro.css" rel="stylesheet" type="text/css" />
<link href="media/css/style.css" rel="stylesheet" type="text/css" />
<link href="media/css/style-responsive.css" rel="stylesheet"
	type="text/css" />

<link href="media/css/uniform.default.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/jquery.gritter.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/daterangepicker.css" rel="stylesheet"
	type="text/css" />
<link href="media/css/fullcalendar.css" rel="stylesheet" type="text/css" />
<link href="media/css/jqvmap.css" rel="stylesheet" type="text/css"
	media="screen" />
<link href="media/css/jquery.easy-pie-chart.css" rel="stylesheet"
	type="text/css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="media/css/datetimepicker.css" />
<link rel="shortcut icon" href="media/image/favicon.ico" />

<!-- ****************************用户自定义的CSS************************************* -->
<link href="css/webControl.css" rel="stylesheet" type="text/css" />
<!-- ***************************************************************** -->
<script src="media/js/jquery-2.0.0.js" type="text/javascript"></script>
<script src="media/js/jquery-migrate-1.2.1.min.js"
	type="text/javascript"></script>
<script src="media/js/jquery-ui-1.10.1.custom.min.js"
	type="text/javascript"></script>
<script src="media/js/bootstrap.min.js" type="text/javascript"></script>
<script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="media/js/jquery.blockui.min.js" type="text/javascript"></script>
<script src="media/js/jquery.cookie.min.js" type="text/javascript"></script>
<script src="media/js/jquery.uniform.min.js" type="text/javascript"></script>
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
<script type="text/javascript"
	src="media/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript"
	src="media/js/jquery.inputmask.bundle.min.js"></script>
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
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading,.form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"],.form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}

.mytable {
	padding: 0;
	margin: 0 auto;
	border-collapse: collapse;
	text-align: center;
	vertical-align: middle;
	width: 700px;
	margin-top: 70px;
}

.mycolumn {
	border: 1px solid #B1CDE3;
	background: #fff;
	font-size: 12px;
	padding: 3px 3px 3px 8px;
	color: #4f6b72;
}
</style>

<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=1.5&ak=Coeu9ONArhi2YsgiMpxgLu4k"></script>


</head>

<body class="page-header-fixed">
	<div class="page-container row-fluid">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar nav-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu">
				<!-- ****************************学员报名*********************************** -->
				<li class=""><a href="javascript:;"> <i
						class="icon-user-md"></i> <span class="title">系统设定模块</span> <span
						class="arrow "></span>
				</a>



					<ul class="sub-menu">
						<li><a href="jsp/student_jsp/studentApply.jsp"><i
								class="icon-male"></i>管理员设定</a></li>
						<li><a href="jsp/student_jsp/studentList.jsp"><i
								class="icon-male"></i>基础参数设定</a></li>
						<li><a href="jsp/student_jsp/studentClassList.jsp"><i
								class="icon-male"></i>部门管理</a></li>
						<li><a href="jsp/student_jsp/studentApply.jsp"><i
								class="icon-male"></i>用户管理</a></li>
						<li><a href="jsp/student_jsp/studentApply.jsp"><i
								class="icon-male"></i>区域设定</a></li>
						<li><a href="jsp/student_jsp/studentApply.jsp"><i
								class="icon-male"></i>用户集群设定</a></li>
					</ul></li>
				<!-- ****************************教师*********************************** -->
				<li class=""><a class="active" href="javascript:;"> <i
						class="icon-bell"></i> <span class="title">传感监测模块</span> <span
						class="arrow "></span>
				</a>
					<ul class="sub-menu">
						<li>
							<a href="monitor/temp_monitor"><i class="icon-bell"></i>温度监测<span class="arrow"></span></a>
						</li>
						<li>
							<a href="monitor/humi_monitor"><i class="icon-bell"></i>湿度监测<span class="arrow"></span></a>
						</li>
						<li>
							<a href="monitor/integrated_monitor"><i class="icon-bell"></i>综合监测<span class="arrow"></span></a>
						</li>
					
					</ul>
					
					</li>
				<!-- ***************************教务****************************** -->
				<li class=""><a class="active" href="javascript:;"> <i
						class="icon-cogs"></i> <span class="title">数据分析模块</span> <span
						class="arrow "></span>
				</a>

					<ul class="sub-menu">
						<li><a href="data/data_clusternum"><i class="icon-cogs"></i>传感器集群数据量统计</a></li>
						<li><a href="data/data_nodebroken"><i class="icon-cogs"></i>节点故障率评估统计</a></li>
						<li><a href="data/data_clusterstate"><i class="icon-cogs"></i>集群状态</a></li>
						<li><a href="data/data_baidumap"><i class="icon-cogs"></i>可视化管理</a></li>
					</ul></li>

				<!-- ***************************财务****************************** -->
				<li class=""><a class="active" href="javascript:;"> <i
						class="icon-book"></i> <span class="title">事件日志模块</span> <span
						class="arrow "></span>
				</a>


					<ul class="sub-menu">
						<li><a
							href="jsp/education_administration_jsp/classManagerment/classSetting.jsp"><i
								class="icon-book"></i>监测异常日志</a></li>
						<li><a
							href="jsp/education_administration_jsp/classManagerment/classList.jsp"><i
								class="icon-book"></i>温度日志</a></li>
						<li><a
							href="jsp/education_administration_jsp/classManagerment/classList.jsp"><i
								class="icon-book"></i>湿度日志</a></li>
					</ul></li>

				<!-- ***************************分析****************************** -->
				<li class=""><a class="active" href="javascript:;"> <i
						class="icon-cogs"></i> <span class="title">系统使用帮助</span> <span
						class="arrow "></span>
				</a>


					<ul class="sub-menu">
						<li><a href="jsp/analysis_jsp/mediaCountBarChart.jsp"><i
								class="icon-cogs"></i>系统说明书</a></li>
						<li><a href="jsp/analysis_jsp/studentCountBarChart.jsp"><i
								class="icon-cogs"></i>常见问题及解决方法</a></li>
						<li><a href="jsp/analysis_jsp/schoolAdmitStudentBarChart.jsp"><i
								class="icon-cogs"></i>联系我们</a></li>
					</ul></li>
				<!-- ***************************系统****************************** -->

			</ul>
		</div>

		<%
			request.setCharacterEncoding("GBK");
		%>

		<div class="page-content">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<div class="portlet box blue ">
							<div class="portlet-title">
								<div class="caption  offset5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;集群数据量统计</div>
							</div>
							<div class="portlet-body form">
								<%
									DefaultPieDataset dpd = new DefaultPieDataset();
																					dpd.setValue("苏大文星阁监控群", 25);
																					dpd.setValue("苏大博物馆监控群", 25);
																					dpd.setValue("苏大出版社监控群", 45);
																					dpd.setValue("苏大逸夫楼监控群", 20);
																					dpd.setValue("苏大怡远楼监控群", 15);
																					dpd.setValue("苏大工体楼监控群", 10);

								   JFreeChart chart = ChartFactory.createPieChart("", dpd, true,false, false);
								   String fileName = ServletUtilities.saveChartAsPNG(chart,1000,600,null,session);
																							
							         // ServletUtilities.setTempFilePrefix("public-jfreechart-");
																					
                                     //根据文件名去临时目录下寻找该图片，这里的/DisplayChart路径要与配置文件里用户自定义的<url-pattern>一致
								     String url = request.getContextPath() + "/DisplayChart?filename=" + fileName;
								%>

								<img src="data_clusternum.png" width="1000" height="600" />

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var map = new BMap.Map("container"); // 创建地图实例  
		var point = new BMap.Point(120.646314, 31.307774); // 创建点坐标  
		map.centerAndZoom(point, 15); // 初始化地图，设置中心点坐标和地图级别  

		//根据daboxId创建自定义图层，用户可用自己创建的geotableid替换30960
		var customLayer = new BMap.CustomLayer({
			geotableId : 58809,
			q : '', //检索关键字
			tags : '', //空格分隔的多字符串
			filter : '' //过滤条件,参考http://developer.baidu.com/map/lbs-geosearch.htm#.search.nearby
		});

		function callback(e)//单击热点图层
		{
			var customPoi = e.customPoi, //获取poi对象
			str = [];
			str.push("title = " + customPoi.title);
			str.push("temp = " + customPoi.temp);
			str.push("humi = " + customPoi.humi);
			var content = '<p style="width:280px;margin:0;line-height:20px;">地址：'
					+ customPoi.title
					+ '<br>温度：'
					+ customPoi.temp
					+ '</p>'
					+ '<br>湿度：' + customPoi.humi;
			var searchInfoWindow = new BMapLib.SearchInfoWindow(map, content, { //带检索的信息窗口
				title : customPoi.title, //标题
				width : 290, //宽度
				height : 40, //高度
				panel : "panel", //检索结果面板
				enableAutoPan : true, //自动平移
				enableSendToPhone : true, //是否显示发送到手机按钮
				searchTypes : [ BMAPLIB_TAB_SEARCH, //周边检索
				BMAPLIB_TAB_TO_HERE, //到这里去
				BMAPLIB_TAB_FROM_HERE //从这里出发
				]
			});
			customLayer.addEventListener('onhotspotclick', callback);//单击图层事件
			var point = new BMap.Point(customPoi.point.lng, customPoi.point.lat);
			searchInfoWindow.open(point);
		}
		map.addTileLayer(customLayer);
	</script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-37564768-1' ]);
		_gaq.push([ '_setDomainName', 'keenthemes.com' ]);
		_gaq.push([ '_setAllowLinker', true ]);
		_gaq.push([ '_trackPageview' ]);
		(function() {
			var ga = document.createElement('script');
			ga.type = 'text/javascript';
			ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://'
					: 'http://')
					+ 'stats.g.doubleclick.net/dc.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(ga, s);
		})();
	</script>
</body>
</html>