using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace MLSSRandomizerForm
{
    public partial class Form1 : Form
    {
        public int gameId;
        readonly string progVersion; // ProductVersion on AssemblyInfo.cs, [AssemblyInformationalVersion(...)]
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
        public static bool music = false;
        public static bool background = false;
        public static bool scale = false;
        public static bool minecart = false;
        public static bool trueChaos = false;
        public static bool spangle = true;
        public static bool minigame = false;
        public static int seedType = 1;
        public static string mColor = "Red";
        public static string lColor = "Green";
        public static string mPants = "Vanilla";
        public static string lPants = "Vanilla";
        public static int r = 0;
        public static int g = 0;
        public static int b = 0;

        //BiS Variables
        public readonly string bisHash = "05072F0545BF4492D81FDFF6B595B9D20C816007";
        public static bool bItems = true;

        

        public Form1()
        {
            InitializeComponent();
            progVersion = FileVersionInfo.GetVersionInfo(Assembly.GetExecutingAssembly().Location).ProductVersion;
            Text += " " + progVersion; // show version in title
        }

        public string ComputeHash()
        {
            StreamReader sr = File.OpenText(filePath);
            string file = sr.ReadToEnd();
            byte[] temp = Encoding.Default.GetBytes(file);
            temp = new SHA1CryptoServiceProvider().ComputeHash(temp);
            return BitConverter.ToString(temp).Replace("-", "");
            
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
            try
            {
                Console.WriteLine(ComputeHash());
                (string newFile, int hash) = Randomize.Random(filePath, seed, gameId);
                // Hexadecimal ConfigHash is constant regardless of seed, and helps to identify equal settings.
                var list = new List<string>();
                Rom.ConfigInfo(list);
                uint configHash = (uint)string.Join("\n", list).GetHashCode();
                // Identical ROMs generated on same progVersion will have the same (seed, configHash) tuple
                // Default file name when saving contains this info for convenience
                if (gameId == 1)
                {
                    saveFileDialog1.FileName = $"MLSSRandomizer-{progVersion} Seed={hash} ConfigHash={configHash:X}.gba";
                    saveFileDialog1.ShowDialog();
                    if (File.Exists(saveFileDialog1.FileName))
                        File.Delete(saveFileDialog1.FileName);
                    if (saveFileDialog1.FileName != "")
                    {
                        File.Copy(newFile, saveFileDialog1.FileName);
                        File.Delete(newFile);
                        Console.WriteLine("Seed: " + hash);
                        if (MessageBox.Show("Do you want to copy your seed?", "Done", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                            Clipboard.SetText(Convert.ToString(hash), TextDataFormat.Text);
                    }
                }
                else if (gameId == 3)
                {
                    saveFileDialog2.FileName = $"BISRandomizer-{progVersion} Seed={hash} ConfigHash={configHash:X}.nds";
                    saveFileDialog2.ShowDialog();

                    if (File.Exists(saveFileDialog2.FileName))
                        File.Delete(saveFileDialog2.FileName);
                    if (saveFileDialog2.FileName != "")
                    {
                        File.Copy(newFile, saveFileDialog2.FileName);
                        File.Delete(newFile);
                        Console.WriteLine("Seed: " + hash);
                        if (MessageBox.Show("Do you want to copy your seed?", "Done", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                            Clipboard.SetText(Convert.ToString(hash), TextDataFormat.Text);
                    }
                }
            }
            catch (Exception err)
            {
                // Log and display any errors instead of crashing; e.g. when filename is empty.
                Console.Error.WriteLine(err);
                StackTrace trace = new StackTrace(err, true);
                var frames = trace.GetFrames();
                var frame = frames[frames.Length - 1];
                var linenumber = frame.GetFileLineNumber();
                var filename = frame.GetFileName();
                MessageBox.Show(err.Message + " " + filename + " " + linenumber, err.GetType().FullName, MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            filePath = textBox1.Text;
            //string hash = ComputeHash();
            if (filePath.Contains(".nds"))
            {
                tabControl2.Visible = true;
                gameId = 3;
            }
            else if(filePath.Contains(".gba"))
            {
                gameId = 1;
                Colors.Visible = true;
                tabControl2.Visible = false;
            }
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
            if (enemy)
                checkBox31.Enabled = true;
            else
                checkBox31.Enabled = false;

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

        private void checkBox29_CheckedChanged(object sender, EventArgs e)
        {
            music = checkBox29.Checked;
        }

        private void checkBox30_CheckedChanged(object sender, EventArgs e)
        {
            background = checkBox30.Checked;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            mColor = comboBox1.Text;
            if (mColor == "Chaos" || lColor == "Chaos")
                checkBox33.Enabled = true;
            else
                checkBox33.Enabled = false;
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            lColor = comboBox2.Text;
            if (mColor == "Chaos" || lColor == "Chaos")
                checkBox33.Enabled = true;
            else
                checkBox33.Enabled = false;
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void checkBox30_CheckedChanged_1(object sender, EventArgs e)
        {
            background = checkBox30.Checked;
        }

        private void radioButton4_CheckedChanged(object sender, EventArgs e)
        {
            seedType = 1;
        }

        private void radioButton5_CheckedChanged(object sender, EventArgs e)
        {
            seedType = 2;
        }

        private void checkBox31_CheckedChanged(object sender, EventArgs e)
        {
            scale = checkBox31.Checked;
        }

        private void checkBox32_CheckedChanged(object sender, EventArgs e)
        {
            minecart = checkBox32.Checked;
        }

        private void checkBox33_CheckedChanged(object sender, EventArgs e)
        {
            trueChaos = checkBox33.Checked;
        }

        private void checkBox34_CheckedChanged(object sender, EventArgs e)
        {
            spangle = checkBox34.Checked;
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            mPants = comboBox3.Text;
        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            lPants = comboBox4.Text;
        }

        private void checkBox35_CheckedChanged(object sender, EventArgs e)
        {
            bItems = checkBox35.Checked;
        }

        private void saveFileDialog2_FileOk(object sender, System.ComponentModel.CancelEventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void checkBox36_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void numericUpDown3_ValueChanged(object sender, EventArgs e)
        {
            r = (int)numericUpDown3.Value;
            panel1.BackColor = System.Drawing.Color.FromArgb(r, g, b);
        }

        private void numericUpDown1_ValueChanged_1(object sender, EventArgs e)
        {
            g = (int)numericUpDown1.Value;
            panel1.BackColor = System.Drawing.Color.FromArgb(r, g, b);
        }

        private void numericUpDown4_ValueChanged(object sender, EventArgs e)
        {
            b = (int)numericUpDown4.Value;
            panel1.BackColor = System.Drawing.Color.FromArgb(r, g, b);
        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        //Mario Colors
        private void button3_Click(object sender, EventArgs e)
        {
            mColor = Convert.ToString(r, 16) + ',' + Convert.ToString(g, 16) + ',' + Convert.ToString(b, 16);
            comboBox1.Items[12] = mColor;
            comboBox1.SelectedIndex = 12;
        }

        //Mario Trousers
        private void button1_Click(object sender, EventArgs e)
        {
            mPants = Convert.ToString(r, 16) + ',' + Convert.ToString(g, 16) + ',' + Convert.ToString(b, 16);
            comboBox3.Items[13] = mPants;
            comboBox3.SelectedIndex = 13;
        }

        //Luigi Colors
        private void button4_Click(object sender, EventArgs e)
        {
            lColor = Convert.ToString(r, 16) + ',' + Convert.ToString(g, 16) + ',' + Convert.ToString(b, 16);
            comboBox2.Items[12] = lColor;
            comboBox2.SelectedIndex = 12;
        }

        //Luigi Trousers
        private void button5_Click(object sender, EventArgs e)
        {
            lPants = Convert.ToString(r, 16) + ',' + Convert.ToString(g, 16) + ',' + Convert.ToString(b, 16);
            comboBox4.Items[13] = lPants;
            comboBox4.SelectedIndex = 13;
        }

        private void checkBox36_CheckedChanged_1(object sender, EventArgs e)
        {
            minigame = checkBox36.Checked;
        }
    }
}
