using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace CardMng
{
    public class User
    {
        private SqlConnection mycon;
       // public string strCmd;

        public User()
        {
            this._U_id = 0;
            this._U_name = "";
            this._Role_Id = 0;
            this._U_pwd = "";
            this._U_Tel = "";
        }
        public User(int id,string name,int role_id,string pwd,string tel)
        {
            this._U_id = id;
            this._U_name = name ;
            this._Role_Id = role_id;
            this._U_pwd = pwd ;
            this._U_Tel = tel;
        }
        public bool Insert()
        {
           // this.strCmd = "insert into BUser values('"+this._Role_Id+"','"+this._U_name+"','"+this._U_pwd+"','"+this._U_Tel+"',null)";
            //if (DB.NonQuery(this.strCmd) > 0)
                return true;
            //else
              //  return false;
        }
        public bool Modify()
        {
            //this.strCmd = "update BUser set Role_Id='" + this._Role_Id + "',U_name='" + this._U_name + "',U_pwd='" + this._U_pwd + "',U_Tel='" + this._U_Tel + "' where U_id='" + this._U_id + "';";
            //if(DB.NonQuery(this.strCmd)>0)
                return true;
            //else
              //  return false;
        }
        public bool Delete()
        {
           // DB.sqlCom = new System.Data.SqlClient.SqlCommand("Pro_User_Delete", DB.sqlCon);
           // DB.sqlCom.CommandType = CommandType.StoredProcedure;

           // //输入参数
           // SqlParameter u_id = new SqlParameter("@U_id", SqlDbType.Int,4);
           // u_id.Value = this.U_id;
           // DB.sqlCom.Parameters.Add(u_id);
           //try
           // {
           //     DB.OpenCon();
           //     DB.sqlCom.ExecuteNonQuery();
           //     return true;
           // }
           // catch (SqlException se)
           // {
           //     MessageBox.Show("对数据库进行删除时出错！", "提示", MessageBoxButtons.OK);
           //     return false;
           // }
           // finally
           // {
           //     DB.CloseCon();
           // }
            return true;

        }


        public DataSet Select()
        {
            DataSet DT = new DataSet();
            //this.strCmd = "select * from V_user_Info where User_f is null;";
            //DT = DB.Search(this.strCmd, "V_user_Info").Tables["V_user_Info"];
            return DT;
        }
        //登录检验
        public String CheckLogin(string user_name,string pwd)
        {
            string constr = "Server=.;database=my;uid=sa;pwd=wbsdog;";
             //DataSet result=null;
            String role = "";
            try
            {
                mycon = new SqlConnection(constr);
                mycon.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = mycon;
                cmd.CommandText = "select b.rolename from dbuser a, roleinfo b where a.roleid=b.roleid and a.clientid='"+user_name+
                    "' and a.clientpwd='"+pwd+"';";//no='"+role+'"+role+"';";
                cmd.CommandType = CommandType.Text;
                SqlDataReader da= cmd.ExecuteReader();
                
               // MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                //result= new DataSet();
                //da.Fill(result, "user";
                while(da.Read())
                {
                    role=Convert.ToString(da[0]);
                }
                da.Close();
                return role;
            }
            catch (SqlException ex)
            {
                ex.ToString();
                //MessageBox.Show("用户名或密码错误！", "提示", MessageBoxButtons.OKCancel);
                return "异常身份";
                //MessageBox.Show(ex.Message);
            }
            finally
            {
                mycon.Close();
            }
            
            
          

            
        }
        

        //修改密码
        public bool Modify_PWD(string pwd)
        {
            //this.strCmd = "update BUser set U_pwd='" + pwd + "' where U_id='" + this._U_id + "' and U_pwd='" + this._U_pwd + "';";
           // if (DB.NonQuery(this.strCmd) > 0)
                return true;
            //else
              //  return false;

        }

        //授权
        public bool Author_Power(string role_name)
        {
           // this.strCmd = "update BUser set Role_Id=(select Role_Id from Role where Role_name='"+role_name+"') where U_id='"+this._U_id+"';";
           // if (DB.NonQuery(this.strCmd) > 0)
                return true;
           // else
           //     return false;
        }
       
        private int _U_id;
        public int U_id
        {
            set { this._U_id = value; }
            get { return this._U_id; }
        }

        private int _Role_Id;
        public int Role_Id
        {
            set { this._Role_Id = value; }
            get { return this._Role_Id; }
        }

        private string _U_name;
        public string U_name
        {
            set {
                if (value.Length <= 10)
                {
                   this._U_name = value; 
                }
                //else
                //    MessageBox.Show("输入的姓名不合法！", "提示", MessageBoxButtons.OKCancel);
                }
            get { return this._U_name; }
        }
      
        private string _U_pwd;
        public string U_pwd
        {
            set
            {
                if (value.Length <= 20)
                {
                    foreach (char a in value)
                    {
                        if ((a >= '1' && a <= '9') || (a >= 'a' && a <= 'z') || (a >= 'A' && a <= 'Z'))
                            this._U_pwd= value;
                        //else
                        //    MessageBox.Show("输入的密码不合法！", "提示", MessageBoxButtons.OKCancel);

                    }
                }
            }
            get { return this._U_pwd; }
        }

        private string _U_Tel;
        public string U_Tel
        {
            set {
                if (value.Length == 11)
                    this._U_Tel = value;
                //else
                //    MessageBox.Show("电话号码位数不正确！","提示",MessageBoxButtons.OKCancel);
            }
            get { return this._U_Tel; }
        }
    }
}