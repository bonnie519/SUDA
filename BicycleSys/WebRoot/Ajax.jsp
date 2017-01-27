<%@ page language="java" contentType="text/html; charset=UTF-8"  
    pageEncoding="UTF-8"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <script type="text/javascript" src="js/jquery.min.js" ></script>  
        <script type="text/javascript">
    
    $(document).ready( function() {  
          
        //使用 Ajax 的方式 判断登录  
        $("#btn_login").click( function() {  
              
            var url = 'ajaxaction.action';  
              
            alert("===");  
              
            //获取表单值，并以json的数据形式保存到params中  
            var params = {  
                loginName:$("#loginName").val(),  
                password:$("#password").val()  
            }  
            //使用$.post方式      
            $.post(  
              
                url,        //服务器要接受的url  
                  
                params,     //传递的参数       
                  
                function cbf(data){ //服务器返回后执行的函数 参数 data保存的就是服务器发送到客户端的数据  
                  
                    //alert(data);  
                    var member = eval("("+data+")");    //包数据解析为json 格式    
              
                    $('#result').html("欢迎您：  "+member.name+"<br />"+member.pwd);  
                      
                },   
                  
                'json'  //数据传递的类型  json  
              
            );  
          
        });  
          
    });  
  </script>
    </head>
    <body>
    <span>用户名：</span>  
        <input type="text" id="loginName" name="loginName">  
        <br />  
  
        <span>密码：</span>  
        <input type="password" name="password" id="password">  
        <br />  
  
        <input type="button" id="btn_login" value="Login" />  
        <p>  
            这里显示ajax信息：  
            <br />  
            <span id="result"></span>  
        </p>  
    </body>  
</html> 