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
    public partial class Form_NewCard : Form
    {
        public Form_NewCard()
        {
            InitializeComponent();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox2.SelectedItem.ToString() == "是")
            {
                textBox7.Text = "80";
            }
            if (comboBox2.SelectedItem.ToString() == "否")
            {
                textBox7.Text = "150";
            }
        }

        //发卡
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || (textBox2.Text == "") || textBox3.Text == "" || textBox1.Text == ""
                || comboBox1.SelectedItem.ToString() == "" || comboBox1.SelectedItem.ToString() == "" )
            {
                MessageBox.Show("客户信息填写不能为空！");
                return;
            }
            if (textBox5.Text == "" || comboBox3.SelectedItem.ToString() == "")
            {
                MessageBox.Show("卡信息填写不能为空！");
                return;            
            }

            String con = "Server=.;database=my;uid=sa;pwd=wbsdog;";
            //int islocal,sex;
            try
            {
                Dao dao = new Dao(con);
                String today = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff");
                String validday = (Convert.ToInt32(today.Substring(0, 4)) + 2).ToString()+today.Substring(4,today.Length-4);
                MessageBox.Show(validday);
               //MessageBox.Show(dateTimePicker1.Value.Day.ToString());
                //MessageBox.Show(dateTimePicker1.Value.ToString());
                String clt = "insert into client values('"+textBox1.Text+
                    "','"+textBox2.Text+"','001','"+textBox4.Text+"',"+comboBox2.SelectedIndex+
                    ",'"+textBox3.Text+"',"+comboBox1.SelectedIndex+");";
                String crd = "insert into card values('"+textBox5.Text+"',0,'"+textBox1.Text+"','"+today+"',0,"+
                Convert.ToDecimal(textBox7.Text)+",0,'"+validday+"','','"+ GetUser.User_name+"');";
                if (dao.doUpdate(clt) == 0||dao.doUpdate(crd)==0)
                {
                    MessageBox.Show("办新卡失败！请检查以前是否办过卡！");
                }
                else
                {
                    MessageBox.Show("发卡成功！");
                }
                dao.CloseCon();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
             
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }
    }
}
