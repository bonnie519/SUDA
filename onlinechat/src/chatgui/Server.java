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
public class Server extends Frame { //�^��Frame��
    TextField tf = new TextField(); //��������
    TextArea ta = new TextArea(); //��ʾ�����
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
            ss = new ServerSocket(9997); //��������˶���
            started = true;
        } catch (BindException e) {
            System.out.println("�˿�ʹ����");
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            //while (started) {
                Socket s = ss.accept(); //���տͻ���
                //ChatClient c = new ChatClient(s);
                System.out.println("�͑��˽��ճɹ�");
                dos = new DataOutputStream(s.getOutputStream());
                dis = new DataInputStream(s.getInputStream());
                bConnected = true;
                //new Thread(c).start(); //�����߳�
                //clients.add(c); //����߳���
            //}
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                ss.close();
            } catch (IOException e) {
                // TODO �Զ����� catch ��
                e.printStackTrace();
            }
        }
    }
    
    public void CreateFrame() { //����ͼ�ν���     
        this.setBounds(300, 300, 300, 300);
        ta.setEditable(false);
        this.add(tf, BorderLayout.SOUTH);
        this.add(ta, BorderLayout.NORTH);
        add(jsp);
        setTitle("Server");
    
     
        this.addWindowListener(new WindowAdapter() { //��Ӧ�رմ����¼�
                    public void windowClosing(WindowEvent e) {
                        disconnect();
                        System.exit(0);
                    }
                });
        tf.addActionListener(new tfListener()); //��Ӧ�����¼�
        
        this.pack();
        this.setVisible(true);
       // connect();
        //new Thread(r).start();
        
        start();
        Recv();
    }
    
    class tfListener implements ActionListener { //�����ʵ�ֵĽӿڣ���Ӧ�����¼�
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
    
    public void disconnect() { //���ڹر�ʱ�رտͻ��ˣ����룬���
        try {
            dos.close();
            dis.close();
            ss.close();
        } catch (IOException e) {
            System.out.println("Server�˳��ˡ�");
            e.printStackTrace();
        }
    }
    
    public void Recv() {
        try {
            while (bConnected) {
                String str= dis.readUTF(); //�õ�����
                ta.setText(ta.getText() + str + '\n');//��ʾ����ʾ����
            }
        } catch (Exception e) {
            System.out.println("Client�˳���");//SocketException e
        } //catch (IOException e1) {
        	
            //e1.printStackTrace();
        //}
    }
    
    /*
    class ChatClient { //�����ͻ����߳̽��գ���������//implements runnable
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
                System.out.println("�����˳���");
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
                System.out.println("�͑����˳���");
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
