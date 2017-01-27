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
    public partial class Form_Csm : Form
    {
        public Form_Csm()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            
            try
            {
                String con = "Server=.;database=my;uid=sa;pwd=wbsdog;";
                Dao dao = new Dao(con);
                String sql = "select cardno,csm_amt,rdate from consm where cardno='" + textBox1.Text + "';";// +
                //"and state=1 and clientid in (select clientid from client " +
                //"where clientname='" + textBox3.Text + "' and idno='" + textBox1.Text + "');";// +
                //"delete from guashi where cardno='"+textBox2.Text+"';"+
                //"insert into jiegua values('" + textBox2.Text + "','" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff") + "');";
                DataSet ds = new DataSet();
                ds = dao.doQuery(sql, "consm");
                if (ds.Tables[0].Rows.Count == 0)
                {
                    MessageBox.Show("fail!");
                    return;
                }
                
                dataGridView1.DataSource = ds;
                dataGridView1.DataMember = "consm";
                
                dataGridView1.Columns[0].HeaderText = "卡号";
                dataGridView1.Columns[0].DataPropertyName = ds.Tables[0].Columns[0].ToString();
                //dataGridView1.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                
                dataGridView1.Columns[1].HeaderText = "金额";
                dataGridView1.Columns[1].DataPropertyName = ds.Tables[0].Columns[1].ToString();
                //dataGridView1.Columns[1].FillWeight = 30;
                //dataGridView1.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                dataGridView1.Columns[2].HeaderText = "日期";
                dataGridView1.Columns[2].DataPropertyName = ds.Tables[0].Columns[2].ToString();
                //dataGridView1.Columns[2].FillWeight = 50;
                //dataGridView1.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
                dataGridView1.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
                dataGridView1.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
               
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
