package chatgui;

import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.TextArea;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.net.BindException;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JScrollPane;

import chatgui.Client.tfListener;
public class Server extends Frame { //繼承Frame类
    TextField tf = new TextField(); //输入框对象
    TextArea ta = new TextArea(); //显示框对象
    JScrollPane jsp=new JScrollPane(ta);
    
    boolean started = false;
    ServerSocket ss = null;
    
    DataOutputStream dos = null;
    DataInputStream dis = null;
    boolean bConnected = false;
 
    public static void main(String[] args) {
        Server a=new Server();
        //a.start();
        a.CreateFrame();
    }
    void start() {
        try {
            ss = new ServerSocket(9997); //建立服务端对象
            started = true;
        } catch (BindException e) {
            System.out.println("端口使用中");
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            //while (started) {
                Socket s = ss.accept(); //接收客户端
                //ChatClient c = new ChatClient(s);
                System.out.println("客戶端接收成功");
                dos = new DataOutputStream(s.getOutputStream());
                dis = new DataInputStream(s.getInputStream());
                bConnected = true;
                //new Thread(c).start(); //启动线程
                //clients.add(c); //添加线程类
            //}
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                ss.close();
            } catch (IOException e) {
                // TODO 自动生成 catch 块
                e.printStackTrace();
            }
        }
    }
    
    public void CreateFrame() { //产生图形界面     
        this.setBounds(300, 300, 300, 300);
        ta.setEditable(false);
        this.add(tf, BorderLayout.SOUTH);
        this.add(ta, BorderLayout.NORTH);
        add(jsp);
        setTitle("Server");
    
     
        this.addWindowListener(new WindowAdapter() { //响应关闭窗口事件
                    public void windowClosing(WindowEvent e) {
                        disconnect();
                        System.exit(0);
                    }
                });
        tf.addActionListener(new tfListener()); //响应输入事件
        
        this.pack();
        this.setVisible(true);
       // connect();
        //new Thread(r).start();
        
        start();
        Recv();
    }
    
    class tfListener implements ActionListener { //输入框实现的接口，响应输入事件
        public void actionPerformed(ActionEvent e) {
        	String str = "Server:".concat(tf.getText());
            ta.setText(ta.getText() +"->"+str+'\n');
            tf.setText("");
            try {
                dos.writeUTF(str);
                dos.flush();
                //dos.close();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
    
    public void disconnect() { //窗口关闭时关闭客户端，输入，输出
        try {
            dos.close();
            dis.close();
            ss.close();
        } catch (IOException e) {
            System.out.println("Server退出了。");
            e.printStackTrace();
        }
    }
    
    public void Recv() {
        try {
            while (bConnected) {
                String str= dis.readUTF(); //拿到数据
                ta.setText(ta.getText() + str + '\n');//显示到显示框中
            }
        } catch (Exception e) {
            System.out.println("Client退出了");//SocketException e
        } //catch (IOException e1) {
        	
            //e1.printStackTrace();
        //}
    }
    
    /*
    class ChatClient { //建立客户端线程接收，发送数据//implements runnable
        private Socket s;
        DataInputStream dis = null;
        DataOutputStream dos = null;
        boolean bConnected = false;
        public ChatClient(Socket s) {
            this.s = s;
            try {
                dis = new DataInputStream(s.getInputStream());
                dos = new DataOutputStream(s.getOutputStream());
                bConnected = true;
            } catch (IOException e) {
                e.printStackTrace();
            }
        }*/
        /*void send(String str) {
            try {
                dos.writeUTF(str);
            } catch (SocketException e) {
                System.out.println("對方退出了");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        public void run() {
            try {
                while (bConnected) {
                    String str = dis.readUTF();
                    // System.out.println(str);
                    //for (int i = 0; i < clients.size(); i++) {
                        //ChatClient c = clients.get(i);
                        //c.
                        send(str);
                    //}
                }
            } catch (EOFException e) {
                System.out.println("客戶端退出了");
            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                if (dis != null)
                    if (s != null)
                        try {
                            dis.close();
                            s.close();
                            dos.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
            }
        }*/
    //}

}
