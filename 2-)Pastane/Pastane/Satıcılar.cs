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
    public partial class Satıcılar : Form
    {
        public Satıcılar()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("server =DESKTOP-E4509IB;Database=Pastane_Projesi;uid=sa;pwd=password1;");
        private void Satıcılar_Load(object sender, EventArgs e)
        {

        }

        public void method(string scode)
        {
            SqlDataAdapter dp = new SqlDataAdapter(scode, con);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }



        private void pictureBox2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "Satıcıarama";
            komut.Parameters.AddWithValue("SatıcıNo",textBox1);
            SqlDataAdapter dr = new SqlDataAdapter(komut);
            DataTable doldur = new DataTable();
            dr.Fill(doldur);
            dataGridView1.DataSource = doldur;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            method("select * from Saticilar");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand("insert into Saticilar (SatıcıAdSoyad,SatıcıAdres,SatıcıIl) values (@SatıcıAdSoyad,@SatıcıAdres,@SatıcıIl)", con);

            komut.Parameters.AddWithValue("SatıcıAdSoyad", textBox2.Text);
            komut.Parameters.AddWithValue("SatıcıAdres", textBox3.Text);
            komut.Parameters.AddWithValue("SatıcıIl", textBox4.Text);       
            komut.ExecuteNonQuery();
            method("select * from Saticilar");
            con.Close();
            textBox2.Clear();
            textBox3.Clear();
            textBox4.Clear();
         
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand guncel = new SqlCommand("update Saticilar set SatıcıAdSoyad='" + textBox2.Text.ToString() + "',SatıcıAdres='" + textBox3.Text.ToString() + "',SatıcıIl='" + textBox4.Text.ToString() + "'where SatıcıNo='" + textBox1.Text.ToString() + "'", con);
            guncel.ExecuteNonQuery();
            method("select * from Saticilar");
            con.Close();
            
           
        }

        private void pictureBox3_Click(object sender, EventArgs e)
        {
            Seçenekler go = new Seçenekler();
            go.Show();
            this.Hide();

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            DataGridViewRow satir = dataGridView1.CurrentRow;
            textBox1.Text = satir.Cells["SatıcıNo"].Value.ToString();          
            textBox2.Text = satir.Cells["SatıcıAdSoyad"].Value.ToString();
            textBox3.Text = satir.Cells["SatıcıAdres"].Value.ToString();
            textBox4.Text = satir.Cells["SatıcıIl"].Value.ToString();
          
        }
    }
}
