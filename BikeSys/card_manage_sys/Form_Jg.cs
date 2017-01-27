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
    public partial class Form_Jg : Form
    {
        public Form_Jg()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                String con = "Server=.;database=my;uid=sa;pwd=wbsdog;";
                Dao dao = new Dao(con);
                String sql = "select balance from card where cardno='" + textBox1.Text + "';";// +
                //"and state=1 and clientid in (select clientid from client " +
                //"where clientname='" + textBox3.Text + "' and idno='" + textBox1.Text + "');";// +
                //"delete from guashi where cardno='"+textBox2.Text+"';"+
                //"insert into jiegua values('" + textBox2.Text + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "');";
                DataSet ds=new DataSet();
                ds=dao.doQuery(sql,"card");
                if (ds.Tables[0].Rows.Count==0)
                {
                    MessageBox.Show("没查到卡！余额查询失败！");
                    return;
                }

                foreach (DataRow theRow in ds.Tables[0].Rows)
                {
                    textBox3.Text=theRow["balance"].ToString();//除了用名字也可以用索引号
                }
                //{
                  //  MessageBox.Show("注销失败！查无此客户或卡,或卡状态不正常！");
                //}
                //else
                //{
                  //  MessageBox.Show("注销成功！");
                //}
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            textBox3.Text = "";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
