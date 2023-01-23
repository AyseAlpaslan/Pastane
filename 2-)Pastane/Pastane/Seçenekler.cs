using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Pastane
{
    public partial class Seçenekler : Form
    {
        public Seçenekler()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {
            Satıcılar go = new Satıcılar();
            go.Show();
            this.Hide();
        }

        private void label2_Click(object sender, EventArgs e)
        {
            Ürünler go = new Ürünler();
            go.Show();
            this.Hide();
        }

        private void label4_Click(object sender, EventArgs e)
        {
            Siparişler go = new Siparişler();
            go.Show();
            this.Hide();
        }

        private void pictureBox5_Click(object sender, EventArgs e)
        {
            Rapor yeni = new Rapor();
            yeni.Show();
            this.Hide();
        }

        private void Seçenekler_Load(object sender, EventArgs e)
        {

        }
    }
}
