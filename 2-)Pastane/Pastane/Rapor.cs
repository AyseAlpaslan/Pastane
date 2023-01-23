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
    public partial class Rapor : Form
    {
        public Rapor()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("server =DESKTOP-E4509IB;Database=Pastane_Projesi;uid=sa;pwd=password1;");

        private void label1_Click(object sender, EventArgs e)
        {
          
        }

        private void Rapor_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            string sorgu = "Select UrunFiyatı as 'Ürün Adı Pasta Olanların Fiyat Sıralaması' from Urunler where UrunAdı='Pasta'";
            SqlDataAdapter goruntule = new SqlDataAdapter(sorgu, con);
            DataSet doldur = new DataSet();
            goruntule.Fill(doldur);
            dataGridView1.DataSource = doldur.Tables[0];
            con.Close();
            dataGridView1.Visible = true;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            string sorgu = "Select sum(Tutar) as 'Alınan Ürünlerin Toplam Tutarı' from Siparisler";
            SqlDataAdapter goruntule = new SqlDataAdapter(sorgu, con);
            DataSet doldur = new DataSet();
            goruntule.Fill(doldur);
            dataGridView1.DataSource = doldur.Tables[0];
            con.Close();
            dataGridView1.Visible = true;
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            Seçenekler yeni = new Seçenekler();
            yeni.Show();
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            string sorgu = "select * from Saticilar where SatıcıIl='İstanbul'";


            SqlDataAdapter goruntule = new SqlDataAdapter(sorgu, con);
            DataSet doldur = new DataSet();
            goruntule.Fill(doldur);
            dataGridView1.DataSource = doldur.Tables[0];
            con.Close();
        }

        private void label4_Click(object sender, EventArgs e)
        {
           
        }

        private void button4_Click(object sender, EventArgs e)
        {
            con.Open();
            string sorgu = "select * from Urunler order by UrunFiyatı ";


            SqlDataAdapter goruntule = new SqlDataAdapter(sorgu, con);
            DataSet doldur = new DataSet();
            goruntule.Fill(doldur);
            dataGridView1.DataSource = doldur.Tables[0];
            con.Close();
        }
    }
}
