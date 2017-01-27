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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
             toolStripStatusLabel4.Text = System.DateTime.Now.ToString();
        }

        private void toolStripStatusLabel3_Click(object sender, EventArgs e)
        {

        }

           //  toolStripStatusLabel4.Text = System.DateTime.Now.ToString();
            private void Form1_Load(object sender, EventArgs e)
        {
            this.toolStripStatusLabel4.Text = System.DateTime.Now.ToString();
            
            this.toolStripStatusLabel2.Text = GetUser.Role_name+" "+ GetUser.User_name;
          //  this.toolStripStatusLabel5.Text = "";
            /*if (GetUser.Role_name == "普通用户")
            {
                //人员与操作ToolStripMenuItem.Enabled = false;
                //this.User_ToolStripMenuItem.Enabled = false;
                //this.Role_ToolStripMenuItem.Enabled = false;
                //this.toolStripButton_User.Enabled = false;
                //this.toolStripButton_Role.Enabled = false;

            }*/
            /*else if (GetUserInfo.Role_name == "客户")
            {
                this.toolStripButton_Role.Enabled = false;
                this.MainMenuStrip.Enabled = false;
                this.toolStripButton_Search.Enabled = true;
                this.toolStripButton_Account.Enabled = false;
                this.toolStripButton_Client.Enabled = false;
                this.toolStripButton_Stat.Enabled = false;
                this.toolStripButton_ModifyPWD.Enabled = false;
                this.toolStripButton_RentType.Enabled = false;
                this.toolStripButton_User.Enabled = false;
                this.toolStripButton_Bike.Enabled = false;
                this.toolStripButton_Rent.Enabled = false;

            }*/
        
        }
        
        private void timer1_Tick(object sender, EventArgs e)
        {
            toolStripStatusLabel4.Text = System.DateTime.Now.ToString();
        }

        private void 发卡ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form_NewCard nc = new Form_NewCard();
            nc.FormBorderStyle = FormBorderStyle.None;
            nc.Dock = System.Windows.Forms.DockStyle.Fill;
            nc.TopLevel = false;
            panel1.Controls.Add(nc);
            nc.Show();
            nc.BringToFront();
        }

        private void 充值ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form_Charge ch = new Form_Charge();
            ch.FormBorderStyle = FormBorderStyle.None;
            ch.Dock = System.Windows.Forms.DockStyle.Fill;
            ch.TopLevel = false;
            panel1.Controls.Add(ch);
            ch.Show();
            ch.BringToFront();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            Form_NewCard nc = new Form_NewCard();
            nc.FormBorderStyle = FormBorderStyle.None;
            nc.Dock = System.Windows.Forms.DockStyle.Fill;
            nc.TopLevel = false;
            panel1.Controls.Add(nc);
            nc.Show();
            nc.BringToFront();
        }

        private void 挂失ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form_Gs gs = new Form_Gs();
            gs.FormBorderStyle = FormBorderStyle.None;
            gs.Dock = System.Windows.Forms.DockStyle.Fill;
            gs.TopLevel = false;
            panel1.Controls.Add(gs);
            gs.Show();
            gs.BringToFront();
        }

        private void 解挂ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form_Gs gs = new Form_Gs();
            gs.FormBorderStyle = FormBorderStyle.None;
            gs.Dock = System.Windows.Forms.DockStyle.Fill;
            gs.TopLevel = false;
            panel1.Controls.Add(gs);
            gs.Show();
            gs.BringToFront();
        }

        private void 注销ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form_Back gs = new Form_Back();
            gs.FormBorderStyle = FormBorderStyle.None;
            gs.Dock = System.Windows.Forms.DockStyle.Fill;
            gs.TopLevel = false;
            panel1.Controls.Add(gs);
            gs.Show();
            gs.BringToFront();
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            Form_Jg cc = new Form_Jg();
            cc.FormBorderStyle = FormBorderStyle.None;
            cc.Dock = System.Windows.Forms.DockStyle.Fill;
            cc.TopLevel = false;
            panel1.Controls.Add(cc);
            cc.Show();
            cc.BringToFront();
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            Form_Csm cns = new Form_Csm();
            cns.FormBorderStyle = FormBorderStyle.None;
            cns.Dock = System.Windows.Forms.DockStyle.Fill;
            cns.TopLevel = false;
            panel1.Controls.Add(cns);
            cns.Show();
            cns.BringToFront();
        }

        private void 修改密码ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form_Pwd cns = new Form_Pwd();
            cns.FormBorderStyle = FormBorderStyle.None;
            cns.Dock = System.Windows.Forms.DockStyle.Fill;
            cns.TopLevel = false;
            panel1.Controls.Add(cns);
            cns.Show();
            cns.BringToFront();
        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

       
        //充值
        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            Form_Charge ch = new Form_Charge();
            ch.FormBorderStyle = FormBorderStyle.None;
            ch.Dock = System.Windows.Forms.DockStyle.Fill;
            ch.TopLevel = false;
            panel1.Controls.Clear();
            panel1.Controls.Add(ch);
            ch.Show();
            ch.BringToFront();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult result;

            result = MessageBox.Show("确定退出吗？", "退出", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (result == DialogResult.OK)
            {
                //e.Cancel = false;
                Application.ExitThread();
            }
            else
            {
                e.Cancel = true;
            }
            //Application.Exit();
        }

        private void 修改客户信息ToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form_MdfC cns = new Form_MdfC();
            cns.FormBorderStyle = FormBorderStyle.None;
            cns.Dock = System.Windows.Forms.DockStyle.Fill;
            cns.TopLevel = false;
            panel1.Controls.Add(cns);
            cns.Show();
            cns.BringToFront();
        }
    }
}
