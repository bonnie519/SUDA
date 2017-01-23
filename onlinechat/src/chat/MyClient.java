package chat;

import java.net.*;
import java.io.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;


public class MyClient
{
	public static void main(String args[])
	{
		String str=null;
		JTextArea area=new JTextArea();
		JTextField text=new JTextField();
		JButton button=new JButton("����");
		JScrollPane scroll=new JScrollPane(area);
                area.setEditable(false);
		Listener listener=new Listener();
		JFrame frame=new JFrame("Client");


		frame.add(BorderLayout.NORTH,button);
		frame.add(BorderLayout.CENTER,scroll);
		frame.add(BorderLayout.SOUTH,text);
		frame.setVisible(true);
		frame.setBounds(600,700,450,350);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		listener.getArea(text, area);

		button.addActionListener(listener);
		Socket client=null;
		DataInputStream in=null;
		DataOutputStream out=null;

		try
		{
		   client=new Socket("127.0.0.1",12354);
		   str="���ǿͻ��ˣ�������!\n";
		}
		catch(IOException e){area.append("����ʧ��\n");}

		try
		{
		out=new DataOutputStream(client.getOutputStream());
	        in=new DataInputStream(client.getInputStream());
	        listener.getwriteout(out);
         	out.writeUTF(str);
		}
		catch(IOException e){area.append("��ô�ˡ�����");}

		while(true)
		{
			try
			{
				str=in.readUTF();
				area.append("������ : "+str+"\n");
			}
			catch(IOException e){area.append("�ͻ��뿪\n");break;}
		}
	}
}


class Listener implements ActionListener
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
		area.append("�ͻ���:"+str+'\n');
		try
		{writeout.writeUTF(str);}
		catch(IOException e2){area.append("����ʧ��\n");}
	}
}