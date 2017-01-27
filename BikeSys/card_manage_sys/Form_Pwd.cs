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
    public partial class Form_Pwd : Form
    {
        public Form_Pwd()
        {
            InitializeComponent();
        }

        private bool CheckData()
        {
            //旧密码
            if (string.IsNullOrEmpty(textBox1.Text.Trim()))
            {
                MessageBox.Show("旧密码不能为空", "警告", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBox1.Focus();
                return false;
            }
            //新密码
            if (string.IsNullOrEmpty(textBox2.Text.Trim()))
            {
                MessageBox.Show("新密码不能为空", "警告", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBox2.Focus();
                return false;
            }
            //密码校验
            if (string.IsNullOrEmpty(textBox3.Text.Trim()))
            {
                MessageBox.Show("密码校验不能为空", "警告", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBox3.Focus();
                return false;
            }
            //一致校验
            if (!textBox2.Text.Trim().Equals(textBox3.Text.Trim()))
            {
                MessageBox.Show("新密码与校验密码不一致", "警告", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBox3.Focus();
                return false;
            }
            return true;
        }

        private string UpdateSql()
        {
            /*StringBuilder sbSql = new StringBuilder();
            sbSql.Append(" UPDATE Usr SET");
            sbSql.Append(" Cashier.PassWord='" + textBox2.Text.Trim() + "'");
            sbSql.Append(" WHERE");
            sbSql.Append(" Cashier.CashierID ='" ;//+ //Global.cashierId + "'");
            sbSql.Append(" AND Cashier.PassWord  ='" + textBox1.Text.Trim() + "'");*/
             String sql = "update usr set password ='" + textBox2.Text + "' " +
                "where username ='"+GetUser.User_name+"' and password ='"+textBox1.Text +"';";
            return sql;
        }

        private bool ModifyPassword()
        {
            bool rslt = false;
            try
            {
                String con = "Server=.;database=my;uid=sa;pwd=wbsdog;";
                Dao dao = new Dao(con);
                String sql = "update usr set password ='" + textBox2.Text + "' " +
             "where username ='" + GetUser.User_name + "' and password ='" + textBox1.Text + "';";
                if (dao.doUpdate(sql) > 0)
                {
                    rslt= true;
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return rslt;
        }

        //提交修改密码
        private void button1_Click(object sender, EventArgs e)
        {
            MessageBox.Show(textBox1.Text);
            if (!CheckData())
            {
                this.DialogResult = DialogResult.None;
                return;
            }
            if (ModifyPassword())
            {
                MessageBox.Show("密码修改成功.", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                MessageBox.Show("密码修改失败.", "提示", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            
        }

        //重置
        private void button2_Click(object sender, EventArgs e)
        {
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
        }
    }
}
