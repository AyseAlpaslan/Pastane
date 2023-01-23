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
    public partial class Siparişler : Form
    {
        public Siparişler()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection("server =DESKTOP-E4509IB;Database=Pastane_Projesi;uid=sa;pwd=password1;");
        private void Siparişler_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("Select * from Urunler", con);
            SqlDataReader dr;
            dr = komut.ExecuteReader();
            while(dr.Read())
            {
                comboBox1.Items.Add(dr["UrunAdı"]);
                //comboBox2.Items.Add(dr["UrunFiyatı"]);
            }
            con.Close();
        }
        public void method(string scode)
        {
            SqlDataAdapter dp = new SqlDataAdapter(scode, con);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            method("select * from Siparisler");
        }
        private void textBox4_TextChanged(object sender, EventArgs e)
        {
            int fiyat = Convert.ToInt32(textBox5.Text);
            int adet = Convert.ToInt32(textBox4.Text);
            int tutar = fiyat * adet;
            textBox7.Text = tutar.ToString();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("insert into Siparisler(SiparisAdi,SiparisAdres,SiparisAdet,SiparisFiyat,Tutar) values (@SiparisAdi,@SiparisAdres,@SiparisAdet,@SiparisFiyat,@Tutar)", con);

            komut.Parameters.AddWithValue("SiparisAdi", comboBox1.Text);
            komut.Parameters.AddWithValue("SiparisAdres", textBox3.Text);
            komut.Parameters.AddWithValue("SiparisAdet", textBox4.Text);
            komut.Parameters.AddWithValue("SiparisFiyat", textBox5.Text);
            komut.Parameters.AddWithValue("Tutar", textBox7.Text);
            komut.ExecuteNonQuery();
            method("select * from Siparisler");
            
            textBox3.Clear();
            //textBox4.Clear();
            textBox7.Clear();
            con.Close();
         
        }

        private void button3_Click(object sender, EventArgs e)
        {
           
     



            con.Open();
            SqlCommand guncel = new SqlCommand("update Siparisler set SiparisAdi='" + comboBox1.Text.ToString() + "',SiparisAdres='" + textBox3.Text.ToString()+ "',SiparisFiyat='" + textBox5.Text.ToString() + "',SiparisAdet='" + textBox4.Text.ToString()+ "',Tutar='"+textBox7.Text.ToString()+ "'where SiparisNo='" + textBox1.Text.ToString() + "'", con);
            guncel.ExecuteNonQuery();
            method("select * from Siparisler");
            con.Close();
            
        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {
            Seçenekler go = new Seçenekler();
            go.Show();
            this.Hide();
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {
           
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("Select * from Urunler where UrunAdı=@UrunAdı", con);
            komut.Parameters.AddWithValue("UrunAdı",comboBox1.SelectedItem);
            SqlDataReader dr;
            dr = komut.ExecuteReader();
            while (dr.Read())
            {
                textBox5.Text = dr["UrunFiyatı"].ToString(); 
            }
            con.Close();

            

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {
            //textBox7.Text = (Convert.ToInt32(textBox5.Text) * Convert.ToInt32(textBox4.Text)).ToString();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["SiparisNo"].Value.ToString();
            comboBox1.Text = satir.Cells["SiparisAdi"].Value.ToString();
            textBox3.Text = satir.Cells["SiparisAdres"].Value.ToString();
            textBox4.Text = satir.Cells["SiparisAdet"].Value.ToString();
            textBox7.Text = satir.Cells["Tutar"].Value.ToString();
            textBox5.Text = satir.Cells["SiparisFiyat"].Value.ToString();
            textBox1.Text = satir.Cells["SiparisNo"].Value.ToString();



            //ÇALIŞMADI
        }

        private void textBox6_TextChanged(object sender, EventArgs e)
        {
            //con.Open();
            //SqlCommand komut = new SqlCommand("Select * from Urunler where UrunFiyat=@UrunFiyat", con);
            //SqlDataReader dr;
            //dr = komut.ExecuteReader();
            //int fiyat = 0;
            //fiyat.ToString();
            //while (dr.Read())
            //{
            //textBox6.Text=dr["UrunFiyat"].ToString();
            //  fiyat +=  
            //}
            //con.Close();

            //ÇALIŞMADI
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Rapor go = new Rapor();
            go.Show();
            this.Hide();
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
