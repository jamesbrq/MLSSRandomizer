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

        Dictionary<string, int> config = new Dictionary<string, int>();
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

        public void SetConfig()
        {
            int temp;
            config.TryGetValue("chuckle", out temp);
            chuckle = temp;
            switch(temp)
            {
                case 1:
                    radioButton1.Checked = true;
                    break;

                case 2:
                    radioButton2.Checked = true;
                    break;

                case 3:
                    radioButton3.Checked = true;
                    break;

                default:
                    radioButton3.Checked = true;
                    break;
            }
            config.TryGetValue("seedtype", out temp);
            seedType = temp;
            switch (temp)
            {
                case 1:
                    radioButton4.Checked = true;
                    break;

                case 2:
                    radioButton5.Checked = true;
                    break;

                default:
                    radioButton4.Checked = true;
                    break;
            }
            config.TryGetValue("rose", out temp);
            rose = Convert.ToBoolean(temp);
            checkBox2.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("brooch", out temp);
            brooch = Convert.ToBoolean(temp);
            checkBox3.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("chuckola", out temp);
            chuckola = Convert.ToBoolean(temp);
            checkBox4.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("membership", out temp);
            membership = Convert.ToBoolean(temp);
            checkBox5.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("winkle", out temp);
            winkle = Convert.ToBoolean(temp);
            checkBox6.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("beanstar", out temp);
            beanstar = Convert.ToBoolean(temp);
            checkBox7.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("dress", out temp);
            dress = Convert.ToBoolean(temp);
            checkBox8.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("fruit", out temp);
            fruit = Convert.ToBoolean(temp);
            checkBox9.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("eggs", out temp);
            eggs = Convert.ToBoolean(temp);
            checkBox10.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("scrolls", out temp);
            scrolls = Convert.ToBoolean(temp);
            checkBox18.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("beanstone", out temp);
            beanstone = Convert.ToBoolean(temp);
            checkBox19.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("beanlet", out temp);
            beanlet = Convert.ToBoolean(temp);
            checkBox22.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("spangle", out temp);
            spangle = Convert.ToBoolean(temp);
            checkBox34.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("hammers", out temp);
            hammers = Convert.ToBoolean(temp);
            checkBox11.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("goblets", out temp);
            goblets = Convert.ToBoolean(temp);
            checkBox15.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("hands", out temp);
            hands = Convert.ToBoolean(temp);
            checkBox12.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("pearls", out temp);
            pearls = Convert.ToBoolean(temp);
            checkBox16.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("shops", out temp);
            eggs = Convert.ToBoolean(temp);
            checkBox21.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("pants", out temp);
            pants = Convert.ToBoolean(temp);
            checkBox14.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("badges", out temp);
            badges = Convert.ToBoolean(temp);
            checkBox13.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("espresso", out temp);
            espresso = Convert.ToBoolean(temp);
            checkBox17.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("brosbp", out temp);
            brosBp = Convert.ToBoolean(temp);
            checkBox26.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("itemheal", out temp);
            itemHeal = Convert.ToBoolean(temp);
            checkBox27.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("coffeevalue", out temp);
            coffeeValue = Convert.ToBoolean(temp);
            checkBox28.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("intro", out temp);
            intro = Convert.ToBoolean(temp);
            checkBox1.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("castle", out temp);
            castle = Convert.ToBoolean(temp);
            checkBox24.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("minecart", out temp);
            minecart = Convert.ToBoolean(temp);
            checkBox32.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("surf", out temp);
            surf = Convert.ToBoolean(temp);
            checkBox23.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("mush", out temp);
            mush = Convert.ToBoolean(temp);
            checkBox20.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("enemy", out temp);
            enemy = Convert.ToBoolean(temp);
            checkBox25.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("scale", out temp);
            scale = Convert.ToBoolean(temp);
            checkBox31.Checked = Convert.ToBoolean(temp);
            config.TryGetValue("minigame", out temp);
            minigame = Convert.ToBoolean(temp);
            checkBox36.Checked = Convert.ToBoolean(temp);
        }

        public void SaveConfig()
        {
            List<string> strings = new List<string>();
            strings.Add("seedtype," + seedType + ",");
            strings.Add("chuckle," + chuckle + ",");
            strings.Add("rose," + Convert.ToInt32(rose) + ",");
            strings.Add("brooch," + Convert.ToInt32(brooch) + ",");
            strings.Add("chuckola," + Convert.ToInt32(chuckola) + ",");
            strings.Add("membership," + Convert.ToInt32(membership) + ",");
            strings.Add("winkle," + Convert.ToInt32(winkle) + ",");
            strings.Add("dress," + Convert.ToInt32(dress) + ",");
            strings.Add("beanstar," + Convert.ToInt32(beanstar) + ",");
            strings.Add("scrolls," + Convert.ToInt32(scrolls) + ",");
            strings.Add("eggs," + Convert.ToInt32(eggs) + ",");
            strings.Add("beanstone," + Convert.ToInt32(beanstone) + ",");
            strings.Add("beanlet," + Convert.ToInt32(beanlet) + ",");
            strings.Add("fruit," + Convert.ToInt32(fruit) + ",");
            strings.Add("spangle," + Convert.ToInt32(spangle) + ",");
            strings.Add("hammers," + Convert.ToInt32(hammers) + ",");
            strings.Add("goblets," + Convert.ToInt32(goblets) + ",");
            strings.Add("hands," + Convert.ToInt32(hands)  + ",");
            strings.Add("pearls," + Convert.ToInt32(pearls) + ",");
            strings.Add("shops," + Convert.ToInt32(shops) + ",");
            strings.Add("badges," + Convert.ToInt32(badges) + ",");
            strings.Add("pants," + Convert.ToInt32(pants) + ",");
            strings.Add("espresso," + Convert.ToInt32(espresso) + ",");
            strings.Add("brosbp," + Convert.ToInt32(brosBp) + ",");
            strings.Add("itemheal," + Convert.ToInt32(itemHeal) + ",");
            strings.Add("coffeevalue," + Convert.ToInt32(coffeeValue) + ",");
            strings.Add("intro," + Convert.ToInt32(intro) + ",");
            strings.Add("castle," + Convert.ToInt32(castle) + ",");
            strings.Add("minecart," + Convert.ToInt32(minecart) + ",");
            strings.Add("mush," + Convert.ToInt32(mush) + ",");
            strings.Add("surf," + Convert.ToInt32(surf) + ",");
            strings.Add("minigame," + Convert.ToInt32(minigame) + ",");
            strings.Add("scale," + Convert.ToInt32(scale) + ",");
            strings.Add("enemy," + Convert.ToInt32(enemy));
            File.WriteAllLines(saveFileDialog3.FileName, strings);
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
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            lColor = comboBox2.Text;
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

        private void label13_Click(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {
            openFileDialog2.ShowDialog();
            int temp;
            string[] str = Rom.StreamInitialize(openFileDialog2.FileName);
            for (int i = 0; i < str.Length; i += 2)
            {
                if (config.TryGetValue(str[i], out temp))
                {
                    config[str[i]] = Convert.ToInt32(str[i + 1], 16);
                }
                else
                    config.Add(str[i], Convert.ToInt32(str[i + 1], 16));
            }
            SetConfig();
        }

        private void openFileDialog2_FileOk(object sender, System.ComponentModel.CancelEventArgs e)
        {

        }

        private void button6_Click(object sender, EventArgs e)
        {
            saveFileDialog3.FileName = "Config.txt";
            saveFileDialog3.ShowDialog();
            SaveConfig();
        }
    }
}
