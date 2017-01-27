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
    public partial class Form_Back : Form
    {
        public Form_Back()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                String con = "Server=.;database=my;uid=sa;pwd=wbsdog;";
                Dao dao = new Dao(con);
                String qry = "select balance, deposit from card where cardno='" + textBox1.Text + "';";// +
                //"and state=1 and clientid in (select clientid from client " +
                //"where clientname='" + textBox3.Text + "' and idno='" + textBox1.Text + "');";// +
                //"delete from guashi where cardno='"+textBox2.Text+"';"+
                String upd = "update card set state=3, canceltime='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "' where cardno='" + textBox1.Text + "';"; ;
                DataSet ds = new DataSet();
                ds = dao.doQuery(qry, "card");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    MessageBox.Show("没查到卡！");
                    return;
                }

                foreach (DataRow theRow in ds.Tables[0].Rows)
                {
                    bal.Text = theRow["balance"].ToString();//除了用名字也可以用索引号
                    depst.Text = theRow["deposit"].ToString();
                    sum.Text=(Convert.ToInt32(theRow["balance"])+Convert.ToInt32(theRow["deposit"])).ToString();
                }

                if (dao.doUpdate(upd) == 0)
                {
                    MessageBox.Show("退卡失败！此前或已有记录！");
                }
                else
                {
                    MessageBox.Show("退卡成功！");
                }
            
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
