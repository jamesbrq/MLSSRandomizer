using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
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
        public static string progVersion;
        private string filePath;
        private string seed = "";
        private Dictionary<string, int> config = new Dictionary<string, int>();
        public static int chuckle = 3;
        public static int bosses = 1;
        public static bool intro = true;
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
        public static bool pieces = true;
        public static bool minigame = false;
        public static bool mDisable = false;
        public static bool sounds = false;
        public static bool doors = false;
        public static bool castletown = false;
        public static bool visible = false;
        public static bool invisible = false;
        public static bool removeHidden = false;
        public static bool espressoKey = false;
        public static bool tattle = false;
        public static bool rSettings = false;
        public static bool items = true;
        public static bool coins = false;
        public static bool harhall = false;
        public static int seedType = 1;
        public static string mColor = "Red";
        public static string lColor = "Green";
        public static string mPants = "Vanilla";
        public static string lPants = "Vanilla";
        public static int r = 0;
        public static int g = 0;
        public static int b = 0;
        public static int mul = 1;
        public readonly string mlssHash = "4b1a5897d89d9e74ec7f630eefdfd435";
        public readonly string bisHash = "05072F0545BF4492D81FDFF6B595B9D20C816007";
        public static bool bItems = true;



        public Form1()
        {
            InitializeComponent();
            progVersion = FileVersionInfo.GetVersionInfo(Assembly.GetExecutingAssembly().Location).ProductVersion;
            Text += " " + progVersion; // show version in title
            Directory.SetCurrentDirectory(AppDomain.CurrentDomain.BaseDirectory);
            //ScriptRead();
        }



        public void ScriptRead()
        {
            byte[] arr = new byte[] { 0x0A, 0x51, 0x82, 0xB0, 0x74 };
            List<byte> bytes = new List<byte>();
            int temp = arr[1] & 0x10;
            byte b = (byte)(temp == 0x10 ? 1 : 0);
            arr[1] = (byte)(arr[1] - temp);
            temp = arr[1] & 1;
            arr[1] = (byte)(arr[1] - temp);
            temp <<= 3;
            b = (byte)(b + temp);
            b += arr[1];
            temp = arr[2] << 3;
            temp >>= 8;
            b = (byte)(b + temp); 
            bytes.Add(b);
            bytes.Add(arr[0]);
            bytes.Add(0);
            temp = arr[2] & 0x7F;
            temp <<= 4;
            int temp2 = arr[3] & 0xC0;
            temp2 >>= 4;
            temp += temp2;
            temp >>= 2;
            bytes.Add((byte)temp);
            temp = arr[3] & 0x3;
            temp <<= 0x8;
            temp += (arr[4] & 0xF8);
            temp >>= 3;
            bytes.Add((byte)temp);
            Console.WriteLine(bytes.ToString());
        }


        public string ComputeHash()
        {
            StreamReader sr = File.OpenText(filePath);
            string file = sr.ReadToEnd();
            byte[] temp = Encoding.Default.GetBytes(file);
            temp = new SHA1CryptoServiceProvider().ComputeHash(temp);
            return BitConverter.ToString(temp).Replace("-", "");
        }

        public string MD5Hash()
        {
            using (MD5 md5 = MD5.Create())
            {
                using (FileStream fileStream = File.OpenRead(filePath))
                {
                    byte[] hashBytes = md5.ComputeHash(fileStream);
                    return BitConverter.ToString(hashBytes).Replace("-", "").ToLower();
                }
            }
        }

        public void SetConfig()
        {
            int num;
            this.config.TryGetValue("chuckle", out num);
            chuckle = num;
            switch (num)
            {
                case 1:
                    this.radioButton1.Checked = true;
                    break;

                case 2:
                    this.radioButton2.Checked = true;
                    break;

                case 3:
                    this.radioButton3.Checked = true;
                    break;

                default:
                    this.radioButton3.Checked = true;
                    break;
            }
            this.config.TryGetValue("seedtype", out num);
            seedType = num;
            int num4 = num;
            if (num4 == 1)
            {
                this.radioButton4.Checked = true;
            }
            else if (num4 != 2)
            {
                this.radioButton4.Checked = true;
            }
            else
            {
                this.radioButton5.Checked = true;
            }
            this.config.TryGetValue("bosses", out num);
            bosses = num;
            switch (num)
            {
                case 1:
                    this.radioButton8.Checked = true;
                    break;

                case 2:
                    this.radioButton7.Checked = true;
                    break;

                case 3:
                    this.radioButton6.Checked = true;
                    break;

                default:
                    this.radioButton8.Checked = true;
                    break;
            }
            this.config.TryGetValue("visible", out num);
            visible = Convert.ToBoolean(num);
            this.checkBox44.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("invisible", out num);
            invisible = Convert.ToBoolean(num);
            this.checkBox45.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("removehidden", out num);
            removeHidden = Convert.ToBoolean(num);
            this.checkBox46.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("rose", out num);
            rose = Convert.ToBoolean(num);
            this.checkBox2.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("brooch", out num);
            brooch = Convert.ToBoolean(num);
            this.checkBox3.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("chuckola", out num);
            chuckola = Convert.ToBoolean(num);
            this.checkBox4.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("membership", out num);
            membership = Convert.ToBoolean(num);
            this.checkBox5.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("winkle", out num);
            winkle = Convert.ToBoolean(num);
            this.checkBox6.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("beanstar", out num);
            beanstar = Convert.ToBoolean(num);
            this.checkBox7.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("dress", out num);
            dress = Convert.ToBoolean(num);
            this.checkBox8.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("fruit", out num);
            fruit = Convert.ToBoolean(num);
            this.checkBox9.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("eggs", out num);
            eggs = Convert.ToBoolean(num);
            this.checkBox10.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("scrolls", out num);
            scrolls = Convert.ToBoolean(num);
            this.checkBox18.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("beanstone", out num);
            beanstone = Convert.ToBoolean(num);
            this.checkBox19.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("beanlet", out num);
            beanlet = Convert.ToBoolean(num);
            this.checkBox22.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("spangle", out num);
            spangle = Convert.ToBoolean(num);
            this.checkBox34.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("hammers", out num);
            hammers = Convert.ToBoolean(num);
            this.checkBox11.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("goblets", out num);
            goblets = Convert.ToBoolean(num);
            this.checkBox15.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("hands", out num);
            hands = Convert.ToBoolean(num);
            this.checkBox12.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("pearls", out num);
            pearls = Convert.ToBoolean(num);
            this.checkBox16.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("shops", out num);
            eggs = Convert.ToBoolean(num);
            this.checkBox21.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("pants", out num);
            pants = Convert.ToBoolean(num);
            this.checkBox14.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("badges", out num);
            badges = Convert.ToBoolean(num);
            this.checkBox13.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("espresso", out num);
            espresso = Convert.ToBoolean(num);
            this.checkBox17.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("espressokey", out num);
            espressoKey = Convert.ToBoolean(num);
            this.checkBox47.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("brosbp", out num);
            brosBp = Convert.ToBoolean(num);
            this.checkBox26.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("itemheal", out num);
            itemHeal = Convert.ToBoolean(num);
            this.checkBox27.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("coffeevalue", out num);
            coffeeValue = Convert.ToBoolean(num);
            this.checkBox28.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("doors", out num);
            doors = Convert.ToBoolean(num);
            this.checkBox39.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("castle", out num);
            castle = Convert.ToBoolean(num);
            this.checkBox24.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("minecart", out num);
            minecart = Convert.ToBoolean(num);
            this.checkBox32.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("surf", out num);
            surf = Convert.ToBoolean(num);
            this.checkBox23.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("mush", out num);
            mush = Convert.ToBoolean(num);
            this.checkBox20.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("enemy", out num);
            enemy = Convert.ToBoolean(num);
            this.checkBox25.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("scale", out num);
            scale = Convert.ToBoolean(num);
            this.checkBox31.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("minigame", out num);
            minigame = Convert.ToBoolean(num);
            this.checkBox36.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("pieces", out num);
            pieces = Convert.ToBoolean(num);
            this.checkBox33.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("mdisable", out num);
            mDisable = Convert.ToBoolean(num);
            this.checkBox37.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("castletown", out num);
            castletown = Convert.ToBoolean(num);
            this.checkBox43.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("tattle", out num);
            tattle = Convert.ToBoolean(num);
            this.checkBox48.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("coins", out num);
            coins = Convert.ToBoolean(num);
            this.checkBox51.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("items", out num);
            items = Convert.ToBoolean(num);
            this.checkBox50.Checked = Convert.ToBoolean(num);
            this.config.TryGetValue("harhall", out num);
            harhall = Convert.ToBoolean(num);
            this.checkBox52.Checked = Convert.ToBoolean(num);
        }


        public void SaveConfig()
        {
            List<string> contents = new List<string>();
            if (ReferenceEquals(this.seed, null))
            {
                contents.Add("seed,0,");
            }
            else
            {
                contents.Add("seed," + this.seed + ",");
            }
            contents.Add("seedtype," + seedType.ToString() + ",");
            contents.Add("pieces," + Convert.ToInt32(pieces).ToString() + ",");
            contents.Add("chuckle," + chuckle.ToString() + ",");
            contents.Add("visible," + Convert.ToInt32(visible).ToString() + ",");
            contents.Add("coins," + Convert.ToInt32(coins).ToString() + ",");
            contents.Add("items," + Convert.ToInt32(items).ToString() + ",");
            contents.Add("harhall," + Convert.ToInt32(harhall).ToString() + ",");
            contents.Add("invisible," + Convert.ToInt32(invisible).ToString() + ",");
            contents.Add("removehidden," + Convert.ToInt32(removeHidden).ToString() + ",");
            contents.Add("rose," + Convert.ToInt32(rose).ToString() + ",");
            contents.Add("brooch," + Convert.ToInt32(brooch).ToString() + ",");
            contents.Add("chuckola," + Convert.ToInt32(chuckola).ToString() + ",");
            contents.Add("membership," + Convert.ToInt32(membership).ToString() + ",");
            contents.Add("winkle," + Convert.ToInt32(winkle).ToString() + ",");
            contents.Add("dress," + Convert.ToInt32(dress).ToString() + ",");
            contents.Add("beanstar," + Convert.ToInt32(beanstar).ToString() + ",");
            contents.Add("scrolls," + Convert.ToInt32(scrolls).ToString() + ",");
            contents.Add("eggs," + Convert.ToInt32(eggs).ToString() + ",");
            contents.Add("beanstone," + Convert.ToInt32(beanstone).ToString() + ",");
            contents.Add("beanlet," + Convert.ToInt32(beanlet).ToString() + ",");
            contents.Add("fruit," + Convert.ToInt32(fruit).ToString() + ",");
            contents.Add("spangle," + Convert.ToInt32(spangle).ToString() + ",");
            contents.Add("hammers," + Convert.ToInt32(hammers).ToString() + ",");
            contents.Add("goblets," + Convert.ToInt32(goblets).ToString() + ",");
            contents.Add("hands," + Convert.ToInt32(hands).ToString() + ",");
            contents.Add("pearls," + Convert.ToInt32(pearls).ToString() + ",");
            contents.Add("shops," + Convert.ToInt32(shops).ToString() + ",");
            contents.Add("badges," + Convert.ToInt32(badges).ToString() + ",");
            contents.Add("pants," + Convert.ToInt32(pants).ToString() + ",");
            contents.Add("espresso," + Convert.ToInt32(espresso).ToString() + ",");
            contents.Add("espressokey," + Convert.ToInt32(espressoKey).ToString() + ",");
            contents.Add("brosbp," + Convert.ToInt32(brosBp).ToString() + ",");
            contents.Add("itemheal," + Convert.ToInt32(itemHeal).ToString() + ",");
            contents.Add("coffeevalue," + Convert.ToInt32(coffeeValue).ToString() + ",");
            contents.Add("intro," + Convert.ToInt32(intro).ToString() + ",");
            contents.Add("castle," + Convert.ToInt32(castle).ToString() + ",");
            contents.Add("minecart," + Convert.ToInt32(minecart).ToString() + ",");
            contents.Add("mush," + Convert.ToInt32(mush).ToString() + ",");
            contents.Add("surf," + Convert.ToInt32(surf).ToString() + ",");
            contents.Add("minigame," + Convert.ToInt32(minigame).ToString() + ",");
            contents.Add("doors," + Convert.ToInt32(doors).ToString() + ",");
            contents.Add("mdisable," + Convert.ToInt32(mDisable).ToString() + ",");
            contents.Add("castletown," + Convert.ToInt32(castletown).ToString() + ",");
            contents.Add("scale," + Convert.ToInt32(scale).ToString() + ",");
            contents.Add("tattle," + Convert.ToInt32(tattle).ToString() + ",");
            contents.Add("enemy," + Convert.ToInt32(enemy).ToString() + ",");
            contents.Add("bosses," + bosses.ToString());
            File.WriteAllLines(this.saveFileDialog3.FileName, contents);
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
                if (filePath == null)
                {
                    MessageBox.Show("Please select a ROM.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
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
                    if (File.Exists(saveFileDialog1.FileName) && File.Exists(newFile))
                        File.Delete(saveFileDialog1.FileName);
                    if (saveFileDialog1.FileName != "")
                    {
                        File.Copy(newFile, saveFileDialog1.FileName);
                        File.Delete(newFile);
                        Console.WriteLine("Seed: " + hash);
                        if (MessageBox.Show("Do you want to copy your seed?", "Done", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                            Clipboard.SetText(Convert.ToString(hash), TextDataFormat.Text);
                        if (File.Exists(Environment.CurrentDirectory + "/spoilers/" + Path.GetFileNameWithoutExtension(saveFileDialog1.FileName) + "-Spoiler.txt"))
                            File.Delete(Environment.CurrentDirectory + "/spoilers/" + Path.GetFileNameWithoutExtension(saveFileDialog1.FileName) + "-Spoiler.txt");
                        File.Move(Environment.CurrentDirectory + "/spoilers/" + hash + " Spoiler.txt", Environment.CurrentDirectory + "/spoilers/" + Path.GetFileNameWithoutExtension(saveFileDialog1.FileName) + "-Spoiler.txt");
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
            string hash = MD5Hash();
            if (hash == mlssHash)
            {
                gameId = 1;
                tabControl2.Visible = true;
                Colors.Visible = true;
            }
            else if (hash == bisHash)
            {
                gameId = 3;
                tabControl2.Visible = true;
                Colors.Visible = false;
            }
            else
            {
                gameId = 0;
                tabControl2.Visible = false;
                Colors.Visible = false;
                MessageBox.Show("Invalid ROM Selected.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
            panel1.BackColor = Color.FromArgb(r, g, b);
        }

        private void numericUpDown1_ValueChanged_1(object sender, EventArgs e)
        {
            g = (int)numericUpDown1.Value;
            panel1.BackColor = Color.FromArgb(r, g, b);
        }

        private void numericUpDown4_ValueChanged(object sender, EventArgs e)
        {
            b = (int)numericUpDown4.Value;
            panel1.BackColor = Color.FromArgb(r, g, b);
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
                {
                    if (str[i] == "seed")
                    {
                        if (str[i + 1] == "0")
                        {
                            seed = "";
                            SeedTextbox.Text = "";
                        }
                        else
                        {
                            seed = str[i + 1];
                            SeedTextbox.Text = seed;
                        }
                    }
                    else
                        config.Add(str[i], Convert.ToInt32(str[i + 1], 16));
                }
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

        private void radioButton6_CheckedChanged(object sender, EventArgs e)
        {
            bosses = 3;
        }

        private void radioButton7_CheckedChanged(object sender, EventArgs e)
        {
            bosses = 2;
        }

        private void radioButton8_CheckedChanged(object sender, EventArgs e)
        {
            bosses = 1;
        }

        private void checkBox33_CheckedChanged(object sender, EventArgs e)
        {
            pieces = checkBox33.Checked;
        }

        private void checkBox37_CheckedChanged(object sender, EventArgs e)
        {
            mDisable = checkBox37.Checked;
        }

        private void checkBox38_CheckedChanged(object sender, EventArgs e)
        {
            sounds = checkBox38.Checked;
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void checkBox39_CheckedChanged(object sender, EventArgs e)
        {
            doors = checkBox39.Checked;
        }

        private void checkBox43_CheckedChanged(object sender, EventArgs e)
        {
            castletown = checkBox43.Checked;
        }

        private void checkBox44_CheckedChanged(object sender, EventArgs e)
        {
            visible = checkBox44.Checked;
        }

        private void checkBox45_CheckedChanged(object sender, EventArgs e)
        {
            invisible = checkBox45.Checked;
        }

        private void checkBox46_CheckedChanged(object sender, EventArgs e)
        {
            removeHidden = checkBox46.Checked;
        }

        private void radioButton3_MouseHover(object sender, EventArgs e)
        {
         //   toolTip1.Show("All Chuckle Beans are added to the item pool", radioButton1);
        }

        private void radioButton2_MouseHover(object sender, EventArgs e)
        {
           // toolTip1.Show("Removes Invisible Chuckle Beans from the item pool", radioButton1);
        }

        private void radioButton1_MouseHover(object sender, EventArgs e)
        {
           // toolTip1.Show("Removes All Chuckle Beans from the item pool", radioButton1);
        }

        private void checkBox47_CheckedChanged(object sender, EventArgs e)
        {
            espressoKey = checkBox47.Checked;
        }

        private void checkBox48_CheckedChanged(object sender, EventArgs e)
        {
            tattle = checkBox48.Checked;
        }

        private void checkBox50_CheckedChanged(object sender, EventArgs e)
        {
            items = this.checkBox50.Checked;
        }

        private void checkBox51_CheckedChanged(object sender, EventArgs e)
        {
            coins = this.checkBox51.Checked;
        }

        private void checkBox52_CheckedChanged(object sender, EventArgs e)
        {
            harhall = this.checkBox52.Checked;
        }

        private void checkBox49_CheckedChanged(object sender, EventArgs e)
        {
            this.checkBox2.Enabled = !this.checkBox49.Checked;
            this.checkBox3.Enabled = !this.checkBox49.Checked;
            this.checkBox4.Enabled = !this.checkBox49.Checked;
            this.checkBox5.Enabled = !this.checkBox49.Checked;
            this.checkBox6.Enabled = !this.checkBox49.Checked;
            this.checkBox7.Enabled = !this.checkBox49.Checked;
            this.checkBox8.Enabled = !this.checkBox49.Checked;
            this.checkBox9.Enabled = !this.checkBox49.Checked;
            this.checkBox10.Enabled = !this.checkBox49.Checked;
            this.checkBox11.Enabled = !this.checkBox49.Checked;
            this.checkBox12.Enabled = !this.checkBox49.Checked;
            this.checkBox13.Enabled = !this.checkBox49.Checked;
            this.checkBox14.Enabled = !this.checkBox49.Checked;
            this.checkBox15.Enabled = !this.checkBox49.Checked;
            this.checkBox16.Enabled = !this.checkBox49.Checked;
            this.checkBox17.Enabled = !this.checkBox49.Checked;
            this.checkBox18.Enabled = !this.checkBox49.Checked;
            this.checkBox19.Enabled = !this.checkBox49.Checked;
            this.checkBox20.Enabled = !this.checkBox49.Checked;
            this.checkBox21.Enabled = !this.checkBox49.Checked;
            this.checkBox22.Enabled = !this.checkBox49.Checked;
            this.checkBox23.Enabled = !this.checkBox49.Checked;
            this.checkBox24.Enabled = !this.checkBox49.Checked;
            this.checkBox25.Enabled = !this.checkBox49.Checked;
            this.checkBox26.Enabled = !this.checkBox49.Checked;
            this.checkBox27.Enabled = !this.checkBox49.Checked;
            this.checkBox28.Enabled = !this.checkBox49.Checked;
            this.checkBox29.Enabled = !this.checkBox49.Checked;
            this.checkBox30.Enabled = !this.checkBox49.Checked;
            this.checkBox31.Enabled = !this.checkBox49.Checked;
            this.checkBox32.Enabled = !this.checkBox49.Checked;
            this.checkBox33.Enabled = !this.checkBox49.Checked;
            this.checkBox34.Enabled = !this.checkBox49.Checked;
            this.checkBox35.Enabled = !this.checkBox49.Checked;
            this.checkBox36.Enabled = !this.checkBox49.Checked;
            this.checkBox37.Enabled = !this.checkBox49.Checked;
            this.checkBox38.Enabled = !this.checkBox49.Checked;
            this.checkBox39.Enabled = !this.checkBox49.Checked;
            this.checkBox43.Enabled = !this.checkBox49.Checked;
            this.checkBox44.Enabled = !this.checkBox49.Checked;
            this.checkBox45.Enabled = !this.checkBox49.Checked;
            this.checkBox46.Enabled = !this.checkBox49.Checked;
            this.checkBox47.Enabled = !this.checkBox49.Checked;
            this.checkBox48.Enabled = !this.checkBox49.Checked;
            this.checkBox50.Enabled = !this.checkBox49.Checked;
            this.checkBox51.Enabled = !this.checkBox49.Checked;
            this.checkBox52.Enabled = !this.checkBox49.Checked;
            this.radioButton1.Enabled = !this.checkBox49.Checked;
            this.radioButton2.Enabled = !this.checkBox49.Checked;
            this.radioButton3.Enabled = !this.checkBox49.Checked;
            this.radioButton6.Enabled = !this.checkBox49.Checked;
            this.radioButton7.Enabled = !this.checkBox49.Checked;
            this.radioButton8.Enabled = !this.checkBox49.Checked;
            this.comboBox1.Enabled = !this.checkBox49.Checked;
            this.comboBox2.Enabled = !this.checkBox49.Checked;
            this.comboBox3.Enabled = !this.checkBox49.Checked;
            this.comboBox4.Enabled = !this.checkBox49.Checked;
            this.numericUpDown1.Enabled = !this.checkBox49.Checked;
            this.numericUpDown3.Enabled = !this.checkBox49.Checked;
            this.numericUpDown4.Enabled = !this.checkBox49.Checked;
            this.button1.Enabled = !this.checkBox49.Checked;
            this.button3.Enabled = !this.checkBox49.Checked;
            this.button4.Enabled = !this.checkBox49.Checked;
            this.button5.Enabled = !this.checkBox49.Checked;
            rSettings = this.checkBox49.Checked;
        }

        private void numericUpDown2_ValueChanged(object sender, EventArgs e)
        {
            mul = (int)numericUpDown2.Value;
        }
    }
}
