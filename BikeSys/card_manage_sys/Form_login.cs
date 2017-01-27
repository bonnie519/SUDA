using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CardMng
{
    public partial class Form_login : Form
    {
        static User user = new User();
        //public static CardMng.SocketCn skt = new sys_mang.A.SocketCn();
        public Form_login()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (this.textBox1.Text == "" || this.textBox2.Text == "")
                MessageBox.Show("用户名或密码不能为空！", "提示", MessageBoxButtons.OK);
            else
            {
                    String role=user.CheckLogin(this.textBox1.Text.Trim(), this.textBox2.Text.Trim());
                    //MessageBox.Show(role);
                    if ( role!="异常身份")
                    {
                        GetUser.Role_name=role;
                      
                        //GetUserInfo.User_name = this.textBox1.Text;
                        GetUser.User_name = this.textBox1.Text;
                        this.Hide();
                        Form1 main = new Form1();
                        main.ShowIcon = true;
                        main.ShowDialog();
                    }
                    else
                        MessageBox.Show("用户名或密码错误！", "提示", MessageBoxButtons.OKCancel);

                
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
            textBox2.Text = "";
        }
    }
}
