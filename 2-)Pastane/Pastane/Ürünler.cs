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
    public partial class Ürünler : Form
    {
        public Ürünler()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection("server =DESKTOP-E4509IB;Database=Pastane_Projesi;uid=sa;pwd=password1;");
        public void method(string scode)
        {
            SqlDataAdapter dp = new SqlDataAdapter(scode,con);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }
        private void Ürünler_Load(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            method("select * from Urunler");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("insert into Urunler (UrunAdı,UrunFiyatı,KullanımTarihi,UretimTarihi) values (@UrunAdı,@UrunFiyatı,@KullanımTarihi,@UretimTarihi)", con);

            komut.Parameters.AddWithValue("UrunAdı", textBox2.Text);
            komut.Parameters.AddWithValue("UrunFiyatı", textBox3.Text);
            komut.Parameters.AddWithValue("KullanımTarihi", textBox4.Text);
            komut.Parameters.AddWithValue("UretimTarihi", textBox5.Text);
            komut.ExecuteNonQuery();
            method("select * from Urunler");
            con.Close();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
            textBox5.Clear();
         
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand guncel = new SqlCommand("update Urunler set UrunAdı='" + textBox2.Text.ToString() + "',UrunFiyatı='" + textBox3.Text.ToString() + "',KullanımTarihi='" + textBox4.Text.ToString() + "',UretimTarihi='" + textBox5.Text.ToString() + "'where UrunNo='" + textBox1.Text.ToString() + "'", con);
            guncel.ExecuteNonQuery();
            method("select * from Urunler");
            con.Close();
            
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            Seçenekler go = new Seçenekler();
            go.Show();
            this.Hide();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["UrunNo"].Value.ToString();
            textBox2.Text = satir.Cells["UrunAdı"].Value.ToString();
            textBox3.Text = satir.Cells["UrunFiyatı"].Value.ToString();
            textBox4.Text = satir.Cells["KullanımTarihi"].Value.ToString();
            textBox5.Text = satir.Cells["UretimTarihi"].Value.ToString();
        }
    }
}
