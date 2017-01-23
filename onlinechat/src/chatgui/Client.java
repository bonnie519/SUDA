package chatgui;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.SocketException;
import java.net.UnknownHostException;

import javax.swing.JScrollPane;
public class Client extends Frame { //繼承Frame类
    TextField tf = new TextField(); //输入框对象
    TextArea ta = new TextArea(); //显示框对象
    JScrollPane jsp=new JScrollPane(ta);
    
    Socket s = null;
    DataOutputStream dos = null;
    DataInputStream dis = null;
    boolean bConnected = false;
    
    public static void main(String[] args) {
        new Client().CreateFrame();
    }
    public void CreateFrame() { //产生图形界面     
        this.setBounds(300, 300, 300, 300);
        ta.setEditable(false);
        this.add(tf, BorderLayout.SOUTH);
        this.add(ta, BorderLayout.NORTH);
        this.add(jsp);
        setTitle("Client");
        
        this.addWindowListener(new WindowAdapter() { //响应关闭窗口事件
                    public void windowClosing(WindowEvent e) {
                        disconnect();
                        System.exit(0);
                    }
                });
        tf.addActionListener(new tfListener()); //响应输入事件
        this.pack();
        this.setVisible(true);
        connect();
        Recv();
    }
    public void connect() {
        try {
            s = new Socket("localhost", 9997); //建立客户端对象
           // BufferedReader in=new BufferedReader
        	//		(new InputStreamReader(s.getInputStream()));
            dos = new DataOutputStream(s.getOutputStream());
            dis = new DataInputStream(s.getInputStream());
            bConnected = true;
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void disconnect() { //窗口关闭时关闭客户端，输入，输出
        try {
            dos.close();
            dis.close();
            s.close();
        } catch (IOException e) {
            System.out.println("Client退出了。");
            e.printStackTrace();
        }
    }
    class tfListener implements ActionListener { //输入框实现的接口，响应输入事件
        public void actionPerformed(ActionEvent e) {
            String str = "Client:".concat(tf.getText());
            ta.setText(ta.getText()+"->"+str+'\n');
            tf.setText("");
            try {
                dos.writeUTF(str);
                dos.flush();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
    
    public void Recv() {
    try{
            while (bConnected) {
                String str = dis.readUTF();//拿到数据
                ta.setText(ta.getText() + str + '\n');//显示到显示框中
            }
        }
    catch (Exception e) {
            System.out.println("Server退出了");
        }
       
    }
}