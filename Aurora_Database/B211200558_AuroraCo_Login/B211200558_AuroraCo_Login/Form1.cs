using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace B211200558_AuroraCo_Login
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection(@"Data Source=LAPTOP-7DH2ONM1;Initial Catalog=AuroraSkincare;Integrated Security=True");
        

        private void button1_Click(object sender, EventArgs e)
        {
            string username, user_password;

            username = text_username.Text;
            user_password = text_password.Text;

            try
            {
                string querry = "SELECT * FROM Login_new WHERE Username = '" + text_username.Text + "' AND Password = '" + text_password.Text + "'";
                SqlDataAdapter sda = new SqlDataAdapter(querry, conn);

                DataTable dtable = new DataTable();
                sda.Fill(dtable);

                if (dtable.Rows.Count > 0)
                {
                    username = text_username.Text;
                    user_password = text_password.Text;
                    MessageBox.Show("Giris Yapildi");
                    Rapor form2 = new Rapor();
                    form2.Show();
                    this.Hide();
                }
                else
                {
                    MessageBox.Show("Invalid login details", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    text_username.Clear();
                    text_password.Clear();

                    //to focus username
                    text_username.Focus();
                }
            }
            catch
            {
                MessageBox.Show("Error");
            }
            finally
            {
                conn.Close();
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void text_username_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
