package chat;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;

public class MyServer
{
	public static void main(String args[])
	{
	Socket socket=null;
	ServerSocket server=null;
	DataInputStream in=null;
	DataOutputStream out=null;
	String str=" ";
	JFrame frame=new JFrame("服务器");
	JButton button=new JButton("发送");
	JTextArea area=new JTextArea();
	JTextField text=new JTextField();
        area.setEditable(false);
	JScrollPane scroll=new JScrollPane(area);

	frame.add(BorderLayout.NORTH,button);
	frame.add(BorderLayout.CENTER,scroll);
	frame.add(BorderLayout.SOUTH,text);
	frame.setVisible(true);
	frame.setBounds(100,100,450,350);
	Button listener=new Button();
	listener.getArea(text, area);
	button.addActionListener(listener);
	
	try
	{server=new ServerSocket(12354);}
	catch(IOException e1){area.append("正在监听\n");}

	try
	{
		area.append("等待客户呼叫\n");
		socket=server.accept();
		area.append("客户连接成功\n");
	}
	catch(IOException e){area.append("正在等待客户\n");}

	try
	{
		out=new DataOutputStream(socket.getOutputStream());
	    in=new DataInputStream(socket.getInputStream());
	    listener.getwriteout(out);
	}
	catch(IOException e){}

	while(true)
	{
		try
		{
			str=in.readUTF();
			area.append("客户端 : "+str+"\n");
		}
		catch(IOException e){area.append("客户离开\n");break;}
	}
	}
	
}

class Button implements ActionListener
{
	JTextArea area;
	JTextField text;
	String str;
	DataOutputStream writeout;
	void getArea(JTextField field,JTextArea showtext)
	{text=field;area=showtext;}
	void getwriteout(DataOutputStream out)
	{writeout=out;}
	public void actionPerformed(ActionEvent e)
	{
		str=text.getText();
		area.append("服务器 : "+str+'\n');
		
		try
		{writeout.writeUTF(str);}
		catch(IOException e2){area.append("发送失败\n");}
	}
}
/*
class ReadText extends Thread 
{
	DataInputStream readin;
	void getreadin(DataInputStream in)
	{readin=in;}
	JTextArea area;
	JTextField text;
	String s;
	void getArea(JTextField field,JTextArea showtext)
	{text=field;area=showtext;}
	public void run()
	{
		try
		{
		s=readin.readUTF();
		}
		catch(IOException e){area.append("客户端离开\n");}
		area.append(s+"\n");
	}
}

class WriteText extends Thread 
{
	DataInputStream writeout;
	void getwriteout(DataInputStream out)
	{writeout=out;}
	JTextArea area;
	JTextField text;
	void getArea(JTextField field,JTextArea showtext)
	{text=field;area=showtext;}
	public void run()
	{
		try
		{
		writeout.write(s);
		}
		catch(IOException e){area.append("客户端离开\n");}
	}
}*/
