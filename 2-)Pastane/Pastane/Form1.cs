using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;


namespace Pastane
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("server =DESKTOP-E4509IB;Database=Pastane_Projesi;uid=sa;pwd=password1;");
        private void pictureBox2_Click(object sender, EventArgs e)
        {  
            con.Open();
            SqlCommand komut = new SqlCommand("select * from Giris where KullanıcıAdı='" + textBox1.Text.ToString() + "' and Sifre='" + textBox2.Text.ToString() + "'", con);
            SqlDataReader dr;
            dr = komut.ExecuteReader();
            if (dr.Read())
            {
                MessageBox.Show("Tebrikler Başarılı Bir Şekilde Giriş Yaptınız");
                Seçenekler git = new Seçenekler();
                git.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Kullanıcı Adınız ve Şifreniz Hatalı. Kontrol Ediniz.");
                textBox1.Clear();
                textBox2.Clear();
            }
            con.Close();

        }
    }
}
