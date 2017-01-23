package chattest;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class client {
	private static final int SERVERPORT = 9999;
	public static void main(String args[])
	{
		//private static final SocketImpl SERVERPORT = 9999;
		//ChatServer a=new ChatServer();
	
	try {
		Socket s=new Socket("localhost",SERVERPORT);
		System.out.println("Socket:"+s);
		
		BufferedReader in=new BufferedReader
				(new InputStreamReader(s.getInputStream()));
		
		PrintWriter out=new PrintWriter
				(new BufferedWriter(new OutputStreamWriter(s.getOutputStream())),true);
		
		BufferedReader sin=
				new BufferedReader(new InputStreamReader(System.in));
		
		String readline;
		System.out.println("Enter a string,Enter BYE to exit.");
		readline=sin.readLine();
		while(true)
		{
			if(readline.equals("BYE"))
				break;
			
			out.println(readline);
			out.flush();
			
			//talk.setText(str);
			System.out.println("Server:"+in.readLine());
			
			readline=sin.readLine();
		}
		out.close();
		in.close();
		s.close();
	
	}
	catch(IOException f)
	{
		//f.printStackTrace();
		System.out.println("IOException!");
		return;
	}
	}
}