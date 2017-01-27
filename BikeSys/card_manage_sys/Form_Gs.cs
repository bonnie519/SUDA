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
    public partial class Form_Gs : Form
    {
        public Form_Gs()
        {
            InitializeComponent();
        }

        //挂失
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                String con = "Server=.;database=my;uid=sa;pwd=wbsdog;";
                Dao dao = new Dao(con);
                String sql = "update card set state=2 where cardno='" + textBox2.Text + "' " +
                "and clientid in (select clientid from client " +
                "where clientname='" + textBox3.Text + "' and idno='" + textBox1.Text + "');" +
                "insert into guashi values('" + textBox2.Text + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "');";
                if (dao.doUpdate(sql) == 0)
                {
                    MessageBox.Show("挂失失败！查无此客户或卡！");
                }
                else
                {
                    MessageBox.Show("挂失成功！");
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            
        }

        //解挂
        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                String con = "Server=.;database=my;uid=sa;pwd=wbsdog;";
                Dao dao = new Dao(con);
                String sql = "update card set state=1 where cardno='" + textBox2.Text + "' " +
                "and state=2 and clientid in (select clientid from client " +
                "where clientname='" + textBox3.Text + "' and idno='" + textBox1.Text + "');" +
                //"delete from guashi where cardno='"+textBox2.Text+"';"+
                "insert into jiegua values('" + textBox2.Text + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "');";
                if (dao.doUpdate(sql) == 0)
                {
                    MessageBox.Show("解挂失败！查无此客户或卡,或未挂失！");
                }
                else
                {
                    MessageBox.Show("挂失成功！");
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        //注销
        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                String con = "Server=.;database=my;uid=sa;pwd=wbsdog;";
                Dao dao = new Dao(con);
                String sql = "update card set state=3 where cardno='" + textBox2.Text + "' " +
                "and state=1 and clientid in (select clientid from client " +
                "where clientname='" + textBox3.Text + "' and idno='" + textBox1.Text + "');";// +
                    //"delete from guashi where cardno='"+textBox2.Text+"';"+
                //"insert into jiegua values('" + textBox2.Text + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "');";
                if (dao.doUpdate(sql) == 0)
                {
                    MessageBox.Show("注销失败！查无此客户或卡,或卡状态不正常！");
                }
                else
                {
                    MessageBox.Show("注销成功！");
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
