<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@taglib uri="/struts-tags" prefix="s" %>
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
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/tree.jquery.js"></script>
    <link rel="stylesheet" href="css/jqtree.css">
    <script src="js/jquery.cookie.js"></script>
  	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=LnyRpG5KzEHzzsvz4Hx8ICTv"></script>
  	<script type="text/javascript" src="http://api.map.baidu.com/library/DistanceTool/1.2/src/DistanceTool_min.js"></script>
  	<script type="text/javascript" src="https://cdn.goeasy.io/goeasy.js"></script>
  	<link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/my.css">
    <style type="text/css">
        body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
        #logo{float:left;}
        #tree1{/*#FFFACDF0E68C#FFFF99F3F3FA;background-color:#E8FFC4;width:100%;height:100%;*/
        margin:0;float:left;border-radius:12px;}
        #allmap{
        width:100%;  height:600px; overflow: hidden; margin:-30px 0 0 0;font-family:"微软雅黑";
         float:left;}
        .buttons{
            text-align:center;
            margin:auto;
        }
        .over{background-color:orangered;}
        #sp
        {margin-right:40px;}
        .mybtns{margin-top:15px;float:left;/*margin-bottom:30px;*/}
        #selectarea{
        width:18%;height:85%; margin:30px 1% 0 1%;font-family:"微软雅黑";float:left;
        }
		.level1{
		margin-left:10px;}
		#title{background-color:#F4A460;height:16px;font-family:"微软雅黑";font-weight:bold;}
		#msg{margin:0;height:70px;overflow-y:auto;border-style:solid; border-width:2px; border-color:#F4A460;}
		#lists{height:625px;}
}

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
				<li class="active"><a href="qrynn.action">网点地图</a></li>
				<li  class="dropdown">
            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
               		租赁信息
               		<!--<span class="caret"></span>-->
            	</a>
	            	<ul class="dropdown-menu" role="menu">
	               		<li><a href="uRR.jsp">借还车记录</a></li>
	               		<li><a href="Bal.jsp">卡余额</a></li>
	               			               	
	               		
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
		
			<a title="" target="_blank" href="indexadmin.jsp">
				<img width="100%" height="200" alt="" style="background: url(img/bikel.jpg) no-repeat center;" src="img/alpha.png">
			</a>
	</div>
</div>   
<div class="starter">
    <div id="lef">
    <!--<div id="tree1">
		<div class="list-group">-->
	<div id="lists">
		   <button id="s0" class="list-group-item" >1苏大本部</button>
		   <button id="s1" class="list-group-item" >2普信达苏州公共自行车有限公司</button>
		   <button id="s2" class="list-group-item" >3吴中区</button>
		   <button id="s3" class="list-group-item" >4公共自行车租赁点</button>
		   <button id="s4" class="list-group-item" >5欧典花园北门西站公共自行车</button>
	</div>
	<div id="title">
	站点实时消息
	</div>
	
	<div id="msg" >
	</div>		   
			<!-- </div>
</div>-->    
    </div>
    
    <div id="rig">
   <div class="mtitle">
   地图查看
   </div> 	

<div id="allmap"></div>
	

  
<div class="container mybtns">
站点车较多<img  src="img/mapm.png" width="30" height="39"/>    
 站点车正常<img  src="img/mapmy.png" width="30" height="39"/>
站点车较少<img  src="img/mapmr.png" width="30" height="39"/>
    <div class="buttons">
    	<button type="button" id="sp" class="btn btn-primary" onclick="reload()">刷新</button> 
       <!--  <button type="button" class="btn btn-primary" onclick="pan()">我在哪？</button> -->
        <button type="button" class="btn btn-primary" onclick="add_control()">添加比例尺</button>
    </div>
 
</div>
</div>

<div id="last">
 <footer>
  ©2015:Bei Gao&nbsp;&nbsp;&nbsp;Soochow University
  </footer>
 </div>

</body>
</html>
<script type="text/javascript">
var goEasy= new GoEasy({
appkey:'e3d9349d-5116-447f-aad2-edc529c98c3f'
});

  
    goEasy.subscribe({
                        channel: 'map',
                        onMessage: function(message){
                           // alert('Meessage received:'+message.content);
                            document.getElementById('msg').innerHTML+=message.content+'<br />';
                        }
                    });                 
   //document.getElementById('msg').innerHTML='';
   function chg(obj)
   {
   if(obj.className!="over")
             {
				obj.oldClass=obj.className;
				obj.className="over";             
             }
             else if(obj.oldClass)
             {
             this.className=obj.oldClass;
             }
   
   }
   // 百度地图API功能


        var map = new BMap.Map("allmap");    // 创建Map实例
        var inipoint=new BMap.Point(120.64,31.3);//120.64,31.3
        map.centerAndZoom(inipoint,12);  // 初始化地图,设置中心点坐标和地图级别
        map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        map.setCurrentCity("苏州");          // 设置地图显示的城市 此项是必须设置的
        map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
       // var icon=new BMap.Icon("img/greenbike.png");
		


    /*缩放控件type有四种类型:
     BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/
    var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
    var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
    var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL}); //右上角，仅包含平移和缩放按钮
    var points=new Array();//=new points();
    points[0]=new BMap.Point(120.646014,31.315248);
    points[1]=new BMap.Point(120.634858,31.296536);
    points[2]=new BMap.Point(120.63143,31.308685);
    points[3]=new BMap.Point(120.643395,31.273815);
    points[4]=new BMap.Point(120.802252,31.638943);
    //points[5]=new BMap.Point(120.742349,31.318765);
    //points[6]=new BMap.Point(120.689711,31.350303);
    //points[7]=new BMap.Point(120.85708,31.392828);
    //points[8]=new BMap.Point(120.617189,31.387348);
    //points[9]=new BMap.Point(120.560462,31.273984);
    //points[0]=new BMap.Point(120.646014,31.315248);
    //points[0]=new BMap.Point(120.646014,31.315248);
    //points[0]=new BMap.Point(120.646014,31.315248);
    //points[0]=new BMap.Point(120.646014,31.315248);
    //alert(points[0].toString());
    var aicon = new BMap.Icon('img/mapm.png', new BMap.Size(30,39),{
    	anchor:new BMap.Size(16,39),infoWindowAnchor:new BMap.Size(16,0)}
    );
    var bicon=new BMap.Icon('img/mapmy.png', new BMap.Size(30,39),{
    	anchor:new BMap.Size(16,39),infoWindowAnchor:new BMap.Size(16,0)}
    );
    var cicon=new BMap.Icon('img/mapmr.png', new BMap.Size(30,39),{
    	anchor:new BMap.Size(16,39),infoWindowAnchor:new BMap.Size(16,0)}
    );
    var mkr=new Array();
    //var vv="bikenoinfo['000"+4+"'].state";
  
    
    var st=new Array();
    st[0]="<s:property value="bikenoinfo['0001'].state" />";
    st[1]="<s:property value="bikenoinfo['0002'].state" />";
    st[2]="<s:property value="bikenoinfo['0003'].state" />";
    st[3]="<s:property value="bikenoinfo['0004'].state" />";
    st[4]="<s:property value="bikenoinfo['0005'].state" />";
       for(i=0;i<5;i++) {
  // if (st.value=="bikenoinfo['000"+i+1+"'].state";
    //mkr[i]=new BMap.Marker(points[i],{icon:micon});//, {icon: micon}
    //alert(st[i]);
        if(st[i]=="+")
        {
        	mkr[i]=new BMap.Marker(points[i],{icon:aicon});
        	goEasy.publish({
                        channel: 'map',
                        message: '站点'+(i+1)+'车太多!'
                    });
        }
        else if(st[i]=="-")
        {
        	mkr[i]=new BMap.Marker(points[i],{icon:cicon});
        	goEasy.publish({
                        channel: 'map',
                        message: '站点'+(i+1)+'车太少!'
                    });
        }
        else
        mkr[i]=new BMap.Marker(points[i],{icon:bicon});
        
        map.addOverlay(mkr[i]);
    }
    map.setViewport(points);         //调整地图的最佳视野为显示标注数组point

    var opts0={title:'<span style="font-size:14px;color:#0A8021">[0001] 苏大本部</span>'};
    var opts1={title:'<span style="font-size:14px;color:#0A8021">[0002]普信达苏州公共自行车有限公司</span>'};
    var opts2={title:'<span style="font-size:14px;color:#0A8021">[0003]吴中区公共自行车</span>'};
    var opts3={title:'<span style="font-size:14px;color:#0A8021">[0004]公共自行车租赁点</span>'};
    var opts4={title:'<span style="font-size:14px;color:#0A8021">[0005]欧典花园北门西站公共自行车</span>'};
    var opts5={title:'<span style="font-size:14px;color:#0A8021">公共自行车租赁点</span>'};
    var opts6={title:'<span style="font-size:14px;color:#0A8021">公共自行车借用点</span>'};
    var opts7={title:'<span style="font-size:14px;color:#0A8021">公共自行车租赁点</span>'};
    var opts8={title:'<span style="font-size:14px;color:#0A8021">吴中区公共自行车</span>'};
    var opts9={title:'<span style="font-size:14px;color:#0A8021">公共自行车办卡点</span>'};
    //var opts0={title:'<span style="font-size:14px;color:#0A8021">苏州大学-北门</span>'};
    //var opts0={title:'<span style="font-size:14px;color:#0A8021">苏州大学-北门</span>'};
    var infoWindow=new Array();
    infoWindow[0] =new BMap.InfoWindow("<div style='line-height:1.5em;font-size:12px;'>" +
            "可借"+"<s:property value="bikenoinfo['0001'].rentable" />"+"辆， 可还：<s:property value="bikenoinfo['0001'].returnable" />"+"辆<br/></div>", opts0);  // 创建信息窗口对象，引号里可以书写任意的html语句。
    infoWindow[1] =new BMap.InfoWindow("<div style='line-height:1.8em;font-size:12px;'>" +
           "可借"+"<s:property value="bikenoinfo['0002'].rentable" />"+"辆， 可还：<s:property value="bikenoinfo['0002'].returnable" />"+"辆<br/></div>", opts1); 
    infoWindow[2] =new BMap.InfoWindow("<div style='line-height:1.8em;font-size:12px;'>" +
            "可借"+" <s:property value="bikenoinfo['0003'].rentable" />"+"辆， 可还：<s:property value="bikenoinfo['0003'].returnable" />"+"辆<br/></div>", opts2);
    infoWindow[3] =new BMap.InfoWindow("<div style='line-height:1.8em;font-size:12px;'>" +
            "可借"+" <s:property value="bikenoinfo['0004'].rentable" />"+"辆， 可还：<s:property value="bikenoinfo['0004'].returnable" />"+"辆<br/></div>", opts3);
    infoWindow[4] =new BMap.InfoWindow("<div style='line-height:1.5em;font-size:12px;'>" +
            "可借"+"<s:property value="bikenoinfo['0005'].rentable" />"+"辆， 可还：<s:property value="bikenoinfo['0005'].returnable" />"+"辆<br/></div>", opts4);  // 创建信息窗口对象，引号里可以书写任意的html语句。
 


    infoWindow[5] =new BMap.InfoWindow("<div style='line-height:1.8em;font-size:12px;'>" +
            "<b>地址:</b>苏州市吴中区</br><b>电话:</b>(0512)65113180</br><b>口碑：</b>" +
            "<a style='text-decoration:none;color:#2679BA;float:right' href='#'>详情>></a></div>", opts5);
    infoWindow[6] =new BMap.InfoWindow("<div style='line-height:1.8em;font-size:12px;'>" +
            "<b>地址:</b>苏州市吴中区</br><b>电话:</b>(0512)65113180</br><b>口碑：</b>" +
            "<a style='text-decoration:none;color:#2679BA;float:right' href='#'>详情>></a></div>", opts6);
    infoWindow[7] =new BMap.InfoWindow("<div style='line-height:1.8em;font-size:12px;'>" +
            "<b>地址:</b>苏州市昆山市</br><b>电话:</b>(0512)65113180</br><b>口碑：</b>" +
            "<a style='text-decoration:none;color:#2679BA;float:right' href='#'>详情>></a></div>", opts7);
    infoWindow[8] =new BMap.InfoWindow("<div style='line-height:1.8em;font-size:12px;'>" +
            "<b>地址:</b>苏州市相城区</br><b>电话:</b>(0512)65113180</br><b>口碑：</b>" +
            "<a style='text-decoration:none;color:#2679BA;float:right' href='#'>详情>></a></div>", opts8);
    infoWindow[9] =new BMap.InfoWindow("<div style='line-height:1.8em;font-size:12px;'>" +
            "<b>地址:</b>苏州市吴中区</br><b>电话:</b>(0512)65113180</br><b>口碑：</b>" +
            "<a style='text-decoration:none;color:#2679BA;float:right' href='#'>详情>></a></div>", opts9);

    //利用闭包正确处理循环marker
    for (i =0; i <5; i ++) {
     (function() {
         var index = i;
         mkr[i].addEventListener('click', function () {
             this.openInfoWindow(infoWindow[index]);
            // document.getElementById("s"+index).style.background="";
         });
     })();
     }
     
   for(i=0;i<5;i++)
	{
	 (function() {
         var index = i;
         var listn=document.getElementById("s"+index);
         listn.addEventListener("click", function () {
             //alert("I am "+index);
             //this.style.background="#FFFF99";
             
             map.openInfoWindow(infoWindow[index],points[index]);
         });
     })();
	/*var listn=document.getElementById(""+i);
	listn.addEventListener("onclick",showinfo(i));*/
	} 
  	function mylocation(){
  	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			alert('您的位置：'+r.point.lng+','+r.point.lat);
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
	//关于状态码
	//BMAP_STATUS_SUCCESS	检索成功。对应数值“0”。
	//BMAP_STATUS_CITY_LIST	城市列表。对应数值“1”。
	//BMAP_STATUS_UNKNOWN_LOCATION	位置结果未知。对应数值“2”。
	//BMAP_STATUS_UNKNOWN_ROUTE	导航结果未知。对应数值“3”。
	//BMAP_STATUS_INVALID_KEY	非法密钥。对应数值“4”。
	//BMAP_STATUS_INVALID_REQUEST	非法请求。对应数值“5”。
	//BMAP_STATUS_PERMISSION_DENIED	没有权限。对应数值“6”。(自 1.1 新增)
	//BMAP_STATUS_SERVICE_UNAVAILABLE	服务不可用。对应数值“7”。(自 1.1 新增)
	//BMAP_STATUS_TIMEOUT	超时。对应数值“8”。(自 1.1 新增)
	}
    //添加控件和比例尺
    
    function add_control(){

        map.addControl(top_left_control);
        map.addControl(top_left_navigation);
        map.addControl(top_right_navigation);
        alert(""+document.getElementById('msg').offsetHeight);
    }
 	function pan(){
 	
		map.panTo(new BMap.Point("常州市钟楼区"));   //两秒后移动到广州
	
 	}
 	function reload()
 	{
 		window.location.reload();
 	}
</script>