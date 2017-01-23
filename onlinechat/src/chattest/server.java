package chattest;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

//import chatroom.ChatServer;

public class server {
	private static final int SERVERPORT = 9999;
	public static void main(String args[])
	{
		//private static final SocketImpl SERVERPORT = 9999;
		//ChatServer a=new ChatServer();
	
	try {
		ServerSocket s= new ServerSocket(SERVERPORT);
		System.out.println("Started:"+s);
	
		Socket incoming = s.accept();
		System.out.println("Connection accepted:"+incoming);
		
		BufferedReader in=new BufferedReader
			(new InputStreamReader(incoming.getInputStream()));
		
		PrintWriter out=new PrintWriter
			(new BufferedWriter(new OutputStreamWriter
					(incoming.getOutputStream())),true);
		
		BufferedReader sin=new BufferedReader
				(new InputStreamReader(System.in));
		String line;
		System.out.println("Client:"+in.readLine());
		System.out.println("Hello! Enter BYE to exit.");
		line=sin.readLine();
		
		while(true)
		{
			//line=in.readLine();
			
			if(line.trim().equals("BYE"))
			{
				System.out.println("The client entered BYE!");
				System.out.println("Connection will be closed!");
				
				break;
			}
			
			out.println("向客户端输出该字符串Echo:"+line);
			out.flush();
			System.out.println("ServerEcho:"+line);
		//talk.setText("Echo:"+line);
		//setVisible(true);
			System.out.println("Client:"+in.readLine());
			
			line=sin.readLine();
		}
		out.close();
		in.close();
		s.close();
		incoming.close();
		}
		catch(IOException f)
		{
		//f.printStackTrace();
			System.out.println("IOException!");
			return;
		}
	}
}
