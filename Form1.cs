using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace MLSSRandomizerForm
{
    public partial class Form1 : Form
    {
        string filePath;
        string seed;
        public static int chuckle = 3;
        public static bool intro = false;
        public static bool mush = false;
        public static bool rose = true;
        public static bool brooch = true;
        public static bool chuckola = true;
        public static bool membership = true;
        public static bool winkle = true;
        public static bool beanstar = true;
        public static bool dress = true;
        public static bool fruit = true;
        public static bool eggs = true;
        public static bool scrolls = true;
        public static bool beanstone = true;
        public static bool beanlet = true;
        public static bool hammers = true;
        public static bool goblets = true;
        public static bool hands = true;
        public static bool pearls = true;
        public static bool shops = true;
        public static bool espresso = true;
        public static bool pants = true;
        public static bool badges = true;
        public static bool surf = false;
        public static bool castle = false;
        public static bool enemy = false;
        public static bool brosBp = false;
        public static bool itemHeal = false;
        public static bool coffeeValue = false;

        public Form1()
        {
            InitializeComponent();
        }

        public static bool Intro()
        {
            return intro;
        }

        public static bool Mush()
        {
            return mush;
        }

        public static bool Rose()
        {
            return rose;
        }

        public static bool Brooch()
        {
            return brooch;
        }

        public static bool Chuckola()
        {
            return chuckola;
        }

        public static bool Membership()
        {
            return membership;
        }

        public static bool Winkle()
        {
            return winkle;
        }

        public static bool Beanstar()
        {
            return beanstar;
        }

        public static bool Dress()
        {
            return dress;
        }

        public static bool Fruit()
        {
            return fruit;
        }

        public static bool Eggs()
        {
            return eggs;
        }

        public static bool Scrolls()
        {
            return scrolls;
        }

        public static bool Beanstone()
        {
            return beanstone;
        }

        public static bool Beanlet()
        {
            return beanlet;
        }

        public static bool Hammers()
        {
            return hammers;
        }

        public static bool Goblets()
        {
            return goblets;
        }

        public static bool Hands()
        {
            return hands;
        }

        public static bool Pearls()
        {
            return pearls;
        }

        public static bool Shops()
        {
            return shops;
        }

        public static bool Pants()
        {
            return pants;
        }

        public static bool Espresso()
        {
            return espresso;
        }

        public static bool Badges()
        {
            return badges;
        }

        private void SelectRomButton_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
            textBox1.Text = openFileDialog1.FileName;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string[] newFile = Randomize.Random(filePath, seed);
            saveFileDialog1.ShowDialog();
            if(File.Exists(saveFileDialog1.FileName))
                File.Delete(saveFileDialog1.FileName);
            if (saveFileDialog1.FileName == "")
                goto skipFile;
            File.Copy(newFile[0], saveFileDialog1.FileName);
            File.Delete(newFile[0]);
            if (MessageBox.Show("Do you want to copy your seed?", "Done", MessageBoxButtons.YesNo) == System.Windows.Forms.DialogResult.Yes)
                Clipboard.SetText(newFile[1], TextDataFormat.Text);
            skipFile:;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            filePath = textBox1.Text;
        }

        private void SeedTextbox_TextChanged(object sender, EventArgs e)
        {
            seed = SeedTextbox.Text;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            intro = checkBox1.Checked;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click_1(object sender, EventArgs e)
        {

        }

        private void checkBox15_CheckedChanged(object sender, EventArgs e)
        {
            goblets = checkBox15.Checked;
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            rose = checkBox2.Checked;
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            brooch = checkBox3.Checked;
        }

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {
            chuckola = checkBox4.Checked;
        }

        private void checkBox5_CheckedChanged(object sender, EventArgs e)
        {
            membership = checkBox5.Checked;
        }

        private void checkBox6_CheckedChanged(object sender, EventArgs e)
        {
            winkle = checkBox6.Checked;
        }

        private void checkBox7_CheckedChanged(object sender, EventArgs e)
        {
            beanstar = checkBox7.Checked;
        }

        private void checkBox8_CheckedChanged(object sender, EventArgs e)
        {
            dress = checkBox8.Checked;
        }

        private void checkBox9_CheckedChanged(object sender, EventArgs e)
        {
            fruit = checkBox9.Checked;
        }

        private void checkBox10_CheckedChanged(object sender, EventArgs e)
        {
            eggs = checkBox10.Checked;
        }

        private void checkBox18_CheckedChanged(object sender, EventArgs e)
        {
            scrolls = checkBox18.Checked;
        }

        private void checkBox19_CheckedChanged(object sender, EventArgs e)
        {
            beanstone = checkBox19.Checked;
        }

        private void checkBox21_CheckedChanged(object sender, EventArgs e)
        {
            shops = checkBox21.Checked;
        }

        private void checkBox11_CheckedChanged(object sender, EventArgs e)
        {
            hammers = checkBox11.Checked;
        }

        private void checkBox12_CheckedChanged(object sender, EventArgs e)
        {
            hands = checkBox12.Checked;
        }

        private void checkBox14_CheckedChanged(object sender, EventArgs e)
        {
            pants = checkBox14.Checked;
        }

        private void checkBox13_CheckedChanged(object sender, EventArgs e)
        {
            badges = checkBox13.Checked;
        }

        private void checkBox17_CheckedChanged(object sender, EventArgs e)
        {
            espresso = checkBox17.Checked;
        }

        private void checkBox16_CheckedChanged(object sender, EventArgs e)
        {
            pearls = checkBox16.Checked;
        }

        private void checkBox20_CheckedChanged(object sender, EventArgs e)
        {
            mush = checkBox20.Checked;
        }

        private void checkBox22_CheckedChanged(object sender, EventArgs e)
        {
            beanlet = checkBox22.Checked;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            chuckle = 1;
        }

        private void label3_Click_2(object sender, EventArgs e)
        {

        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            chuckle = 3;
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            chuckle = 2;
        }

        private void checkBox23_CheckedChanged(object sender, EventArgs e)
        {
            surf = checkBox23.Checked;
        }

        private void checkBox24_CheckedChanged(object sender, EventArgs e)
        {
            castle = checkBox24.Checked;
        }

        private void checkBox25_CheckedChanged(object sender, EventArgs e)
        {
            enemy = checkBox25.Checked;
        }

        private void checkBox26_CheckedChanged(object sender, EventArgs e)
        {
            brosBp = checkBox26.Checked;
        }

        private void checkBox27_CheckedChanged(object sender, EventArgs e)
        {
            itemHeal = checkBox27.Checked;
        }

        private void checkBox28_CheckedChanged(object sender, EventArgs e)
        {
            coffeeValue = checkBox28.Checked;
        }
    }
}
