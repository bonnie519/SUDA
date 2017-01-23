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
public class Client extends Frame { //�^��Frame��
    TextField tf = new TextField(); //��������
    TextArea ta = new TextArea(); //��ʾ�����
    JScrollPane jsp=new JScrollPane(ta);
    
    Socket s = null;
    DataOutputStream dos = null;
    DataInputStream dis = null;
    boolean bConnected = false;
    
    public static void main(String[] args) {
        new Client().CreateFrame();
    }
    public void CreateFrame() { //����ͼ�ν���     
        this.setBounds(300, 300, 300, 300);
        ta.setEditable(false);
        this.add(tf, BorderLayout.SOUTH);
        this.add(ta, BorderLayout.NORTH);
        this.add(jsp);
        setTitle("Client");
        
        this.addWindowListener(new WindowAdapter() { //��Ӧ�رմ����¼�
                    public void windowClosing(WindowEvent e) {
                        disconnect();
                        System.exit(0);
                    }
                });
        tf.addActionListener(new tfListener()); //��Ӧ�����¼�
        this.pack();
        this.setVisible(true);
        connect();
        Recv();
    }
    public void connect() {
        try {
            s = new Socket("localhost", 9997); //�����ͻ��˶���
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
    public void disconnect() { //���ڹر�ʱ�رտͻ��ˣ����룬���
        try {
            dos.close();
            dis.close();
            s.close();
        } catch (IOException e) {
            System.out.println("Client�˳��ˡ�");
            e.printStackTrace();
        }
    }
    class tfListener implements ActionListener { //�����ʵ�ֵĽӿڣ���Ӧ�����¼�
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
                String str = dis.readUTF();//�õ�����
                ta.setText(ta.getText() + str + '\n');//��ʾ����ʾ����
            }
        }
    catch (Exception e) {
            System.out.println("Server�˳���");
        }
       
    }
}