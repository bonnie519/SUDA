package monitor;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.uwantsoft.goeasy.client.goeasyclient.GoEasy;

//Listener的方式在后台执行一线程
public class MyListener implements ServletContextListener {
	private MyThread myThread;
	protected static ServerSocket server;
	protected static Socket socket;
	public void contextDestroyed(ServletContextEvent e) {
		if (myThread != null && myThread.isInterrupted()) {
			myThread.interrupt();
			try {
				socket.close();
				server.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} //关闭ServerSocket
		}
	}
	public void contextInitialized(ServletContextEvent e) {
		String str = null;
		server=null;
		socket=null;
		try {
			server=new ServerSocket(4700);
		}catch (IOException e1) {
			e1.printStackTrace();
		}
		if (str == null && myThread == null) {
			myThread = new MyThread();
			myThread.start(); // servlet 上下文初始化时启动 socket
		}
	}
}

/**
 * 自定义一个 Class 线程类继承自线程类，重写 run() 方法，用于从后台获取并处理数据
 * 
 * @author 
 * 
 */
class MyThread extends Thread {
	//private ServerSocket server;
	//protected static Socket socket;
	public void run() {
		while (!this.isInterrupted()) {// 线程未中断执行循环
			
			
//			 ------------------ 开始执行 ---------------------------
			//System.out.println("____FUCK TIME:" + System.currentTimeMillis());
			try{
				MyListener.socket=MyListener.server.accept();
				//CThread th= new CThread();
				//th.start();
				getdata();
				//server.close();
			}
			catch (IOException e)
			{}
			try {
				Thread.sleep(2000); //每隔2000ms执行一次
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
	private class CThread extends Thread{
		public void run()
		{
			String line;
			try{
			BufferedReader is=new BufferedReader(new InputStreamReader(MyListener.socket.getInputStream()));
			//由Socket对象得到输入流，并构造相应的BufferedReader对象
			PrintWriter os=new PrintWriter(MyListener.socket.getOutputStream());
			//由Socket对象得到输出流，并构造PrintWriter对象
			//BufferedReader sin=new BufferedReader(new InputStreamReader(System.in));
			
			line=is.readLine();
			//由系统标准输入设备构造BufferedReader对象
			System.out.println("Client:"+line);
			//在标准输出上打印从客户端读入的字符串
			line="get "+line;
			//从标准输入读入一字符串
			//while(true){
			//如果该字符串为 "bye"，则停止循环
			os.println(line);
			//向客户端输出该字符串
			os.flush();
			//刷新输出流，使Client马上收到该字符串
			System.out.println("Server:"+line);
			//在系统标准输出上打印读入的字符串
			//System.out.println("Client:"+is.readLine());
			//从Client读入一字符串，并打印到标准输出上
			//line=sin.readLine();
			//从系统标准输入读入一字符串
			//}//继续循环
			}catch(IOException e)
			{
				System.out.println(e.toString());
			}
			
		}
	}
	public void getdata() {
		//while (!this.isInterrupted()) {
			String line;
			try{
			BufferedReader is=new BufferedReader(new InputStreamReader(MyListener.socket.getInputStream()));
			//由Socket对象得到输入流，并构造相应的BufferedReader对象
			PrintWriter os=new PrintWriter(MyListener.socket.getOutputStream());
			//由Socket对象得到输出流，并构造PrintWriter对象
			//BufferedReader sin=new BufferedReader(new InputStreamReader(System.in));
			
			line=is.readLine();
			//由系统标准输入设备构造BufferedReader对象
			System.out.println("Client:"+line);
			//在标准输出上打印从客户端读入的字符串
			String trans=transMessage(line);
			testPublishMessageInGoEasy(trans);
			line="get "+line;
			//从标准输入读入一字符串
			//while(true){
			//如果该字符串为 "bye"，则停止循环
			os.println(line);
			//向客户端输出该字符串
			os.flush();
			//刷新输出流，使Client马上收到该字符串
			System.out.println("Server:"+line);
			//在系统标准输出上打印读入的字符串
			//System.out.println("Client:"+is.readLine());
			//从Client读入一字符串，并打印到标准输出上
			//line=sin.readLine();
			//从系统标准输入读入一字符串
			//}//继续循环
			
			}catch(IOException e)
			{
				System.out.println(e.toString());
			}
			
		//}
	}
	public void testPublishMessageInGoEasy(String message)
	{
		GoEasy goEasy = new GoEasy("e3d9349d-5116-447f-aad2-edc529c98c3f");
	    goEasy.publish("your_channel",message);
	}
	
	public String transMessage(String message)
	{
		String trans="";
		String [] t =message.split("Res:");
		//System.out.println("t[0]:"+t[0]);
		
		t[1].replace('#', ' ');
		//System.out.println("t[1]:"+t[1]);
		String[] aa = t[0].split("\\|"); //这样才能得到正确的结果
		String deal=t[1].substring(0, 4);
		//System.out.println("aa[0]:"+aa[0]);
		//System.out.println("deal:"+deal);
		trans+="卡号为"+aa[1]+"的用户在站点为"+aa[2]+"，车位为"+aa[3]+"处";
		if(aa[0].equals("1101")&& (deal.equals("1101")))
	    {
	    	trans+="借了车号为"+aa[4]+"的车，";
	    }
	    else if(aa[0].equals("1102") && (deal.equals("1102")))
	    {
	    	trans+="还了车号为"+aa[4]+"的车，";
	    }
	    else
	    {
	    	trans+="发生未知事件，";
	    }
	    
		if(t[1].substring(4,6).equals("00"))
		{
			trans+=" 成功了。";//+t[1].substring(4,6);
		}
		else
		{	
			trans+=" 失败了。";	
		}
		trans+=" "+t[1].substring(6,t[1].length()-1);
	    
		return trans;//卡号、站点号、车位、结果、日期
	}
}