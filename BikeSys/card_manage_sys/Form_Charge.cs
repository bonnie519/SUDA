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
    public partial class Form_Charge : Form
    {
        public Form_Charge()
        {
            InitializeComponent();
        }

        //充值
        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text == "" || textBox2.Text == "")
            {
                MessageBox.Show("充值信息不能为空！");
                return;
            }
            String con = "Server=.;database=my;uid=sa;pwd=wbsdog;";
            try
            {
                Dao dao = new Dao(con);
                String crd = "update card set balance=balance+"+Convert.ToDecimal(textBox2.Text)+", state=1 where cardno='"+textBox1.Text+"';";
                String csm = "insert into consm values('" + textBox1.Text + "'," + Convert.ToDecimal(textBox2.Text) + ",'0001','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff")+ "');";
                if (dao.doUpdate(crd) == 0||dao.doUpdate(csm)==0)
                {
                    MessageBox.Show("充值失败！请确定卡号无误！");
                }
                else
                {
                    MessageBox.Show("充值成功！");
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
