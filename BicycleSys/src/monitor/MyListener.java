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

//Listener�ķ�ʽ�ں�ִ̨��һ�߳�
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
			} //�ر�ServerSocket
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
			myThread.start(); // servlet �����ĳ�ʼ��ʱ���� socket
		}
	}
}

/**
 * �Զ���һ�� Class �߳���̳����߳��࣬��д run() ���������ڴӺ�̨��ȡ����������
 * 
 * @author 
 * 
 */
class MyThread extends Thread {
	//private ServerSocket server;
	//protected static Socket socket;
	public void run() {
		while (!this.isInterrupted()) {// �߳�δ�ж�ִ��ѭ��
			
			
//			 ------------------ ��ʼִ�� ---------------------------
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
				Thread.sleep(2000); //ÿ��2000msִ��һ��
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
			//��Socket����õ�����������������Ӧ��BufferedReader����
			PrintWriter os=new PrintWriter(MyListener.socket.getOutputStream());
			//��Socket����õ��������������PrintWriter����
			//BufferedReader sin=new BufferedReader(new InputStreamReader(System.in));
			
			line=is.readLine();
			//��ϵͳ��׼�����豸����BufferedReader����
			System.out.println("Client:"+line);
			//�ڱ�׼����ϴ�ӡ�ӿͻ��˶�����ַ���
			line="get "+line;
			//�ӱ�׼�������һ�ַ���
			//while(true){
			//������ַ���Ϊ "bye"����ֹͣѭ��
			os.println(line);
			//��ͻ���������ַ���
			os.flush();
			//ˢ���������ʹClient�����յ����ַ���
			System.out.println("Server:"+line);
			//��ϵͳ��׼����ϴ�ӡ������ַ���
			//System.out.println("Client:"+is.readLine());
			//��Client����һ�ַ���������ӡ����׼�����
			//line=sin.readLine();
			//��ϵͳ��׼�������һ�ַ���
			//}//����ѭ��
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
			//��Socket����õ�����������������Ӧ��BufferedReader����
			PrintWriter os=new PrintWriter(MyListener.socket.getOutputStream());
			//��Socket����õ��������������PrintWriter����
			//BufferedReader sin=new BufferedReader(new InputStreamReader(System.in));
			
			line=is.readLine();
			//��ϵͳ��׼�����豸����BufferedReader����
			System.out.println("Client:"+line);
			//�ڱ�׼����ϴ�ӡ�ӿͻ��˶�����ַ���
			String trans=transMessage(line);
			testPublishMessageInGoEasy(trans);
			line="get "+line;
			//�ӱ�׼�������һ�ַ���
			//while(true){
			//������ַ���Ϊ "bye"����ֹͣѭ��
			os.println(line);
			//��ͻ���������ַ���
			os.flush();
			//ˢ���������ʹClient�����յ����ַ���
			System.out.println("Server:"+line);
			//��ϵͳ��׼����ϴ�ӡ������ַ���
			//System.out.println("Client:"+is.readLine());
			//��Client����һ�ַ���������ӡ����׼�����
			//line=sin.readLine();
			//��ϵͳ��׼�������һ�ַ���
			//}//����ѭ��
			
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
		String[] aa = t[0].split("\\|"); //�������ܵõ���ȷ�Ľ��
		String deal=t[1].substring(0, 4);
		//System.out.println("aa[0]:"+aa[0]);
		//System.out.println("deal:"+deal);
		trans+="����Ϊ"+aa[1]+"���û���վ��Ϊ"+aa[2]+"����λΪ"+aa[3]+"��";
		if(aa[0].equals("1101")&& (deal.equals("1101")))
	    {
	    	trans+="���˳���Ϊ"+aa[4]+"�ĳ���";
	    }
	    else if(aa[0].equals("1102") && (deal.equals("1102")))
	    {
	    	trans+="���˳���Ϊ"+aa[4]+"�ĳ���";
	    }
	    else
	    {
	    	trans+="����δ֪�¼���";
	    }
	    
		if(t[1].substring(4,6).equals("00"))
		{
			trans+=" �ɹ��ˡ�";//+t[1].substring(4,6);
		}
		else
		{	
			trans+=" ʧ���ˡ�";	
		}
		trans+=" "+t[1].substring(6,t[1].length()-1);
	    
		return trans;//���š�վ��š���λ�����������
	}
}