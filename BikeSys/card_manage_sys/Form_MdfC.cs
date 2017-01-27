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
    public partial class Form_MdfC : Form
    {
        public Form_MdfC()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            String sql = "update client set ";
            Boolean flag=true;
            if (textBox1.Text == "" && textBox2.Text == "" && textBox3.Text == "")
            {
                MessageBox.Show("请至少选择一项进行修改！");
                return;
            }
            
            if(textBox1.Text!="")
            {
                sql+="clientname='"+textBox1.Text+"'";
                flag=false;
            }
            if (textBox2.Text != "")
            {
                if(!flag)
                    sql+=", idno='" + textBox2.Text + "'";
                else
                {
                    sql += "idno='" + textBox2.Text + "'";
                    flag=false;
                }
            }       
            if (textBox3.Text != "")
            {        
                if(flag)
                    sql += "tel='" + textBox3.Text + "'";
                else
                     sql+=", tel='" + textBox3.Text + "'";
            }       
                
            
           sql+=" where clientid in( select clientid from card where cardno='"+textBox4.Text+"');";

             try
            {
                String con = "Server=.;database=my;uid=sa;pwd=wbsdog;";
                Dao dao = new Dao(con);
              
                //"and state=1 and clientid in (select clientid from client " +
                //"where clientname='" + textBox3.Text + "' and idno='" + textBox1.Text + "');";// +
                //"delete from guashi where cardno='"+textBox2.Text+"';"+
                //"insert into jiegua values('" + textBox2.Text + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "');";

                if (dao.doUpdate(sql) <= 0)
                {
                    MessageBox.Show("没查到卡！更新信息失败！");
                    return;
                }
                else
                    MessageBox.Show("更新成功！");
           
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
