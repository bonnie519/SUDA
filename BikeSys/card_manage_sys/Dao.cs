using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
namespace CardMng
{
    class Dao:Form
    {
        private SqlConnection mycon;
        public Dao(String constr)
        {
            try
            {
                mycon = new SqlConnection(constr);
                
            }
            catch (System.Exception ex)
            {
                ex.ToString();
            }
        }

        public DataSet doQueryAll(String Table)
        {
            DataSet ds = null;
            try
            {
                mycon.Open();
                SqlCommand comm = new SqlCommand();
                comm.CommandText = Table;
                comm.Connection = mycon;
                comm.CommandType = CommandType.TableDirect;
                SqlDataAdapter da = new SqlDataAdapter(comm);
                ds = new DataSet();
                da.Fill(ds, Table);
            }
            catch (System.Exception ex)
            {
                ex.ToString();
            }
            mycon.Close();
            return ds;
        }

        public DataSet doQuery(String QryStr, String Table)
        {
            DataSet ds = null;
            try
            {
                mycon.Open();
                SqlCommand comm = new SqlCommand();
                comm.CommandText = QryStr;
                comm.CommandType = CommandType.Text;
                comm.Connection = mycon;
                SqlDataAdapter da = new SqlDataAdapter(comm);
                ds = new DataSet();
                da.Fill(ds, Table);
            }
            catch (System.Exception ex)
            {
                ex.ToString();
            }
            mycon.Close();
            return ds;
        }

        public int doUpdate(String str)
        {
            int count = 0;
            try
            {
                mycon.Open();
                SqlCommand comm = new SqlCommand(str,mycon);
                count = comm.ExecuteNonQuery();
                //MessageBox.Show(count.ToString());
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            this.CloseCon();
            return count;
        }

        public void CloseCon()
        {
            mycon.Close();
        }
    }
}
