
using System.ComponentModel;
using System;
using System.DirectoryServices;
using System.Drawing;
using System.Windows.Forms;

namespace MLSSRandomizerForm
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.SelectRomButton = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.button2 = new System.Windows.Forms.Button();
            this.directorySearcher1 = new System.DirectoryServices.DirectorySearcher();
            this.folderBrowserDialog1 = new System.Windows.Forms.FolderBrowserDialog();
            this.openFileDialog1 = new System.Windows.Forms.OpenFileDialog();
            this.SeedTextbox = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.saveFileDialog1 = new System.Windows.Forms.SaveFileDialog();
            this.Colors = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.checkBox52 = new System.Windows.Forms.CheckBox();
            this.checkBox51 = new System.Windows.Forms.CheckBox();
            this.checkBox50 = new System.Windows.Forms.CheckBox();
            this.checkBox46 = new System.Windows.Forms.CheckBox();
            this.checkBox45 = new System.Windows.Forms.CheckBox();
            this.checkBox44 = new System.Windows.Forms.CheckBox();
            this.label3 = new System.Windows.Forms.Label();
            this.radioButton3 = new System.Windows.Forms.RadioButton();
            this.radioButton2 = new System.Windows.Forms.RadioButton();
            this.radioButton1 = new System.Windows.Forms.RadioButton();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.checkBox33 = new System.Windows.Forms.CheckBox();
            this.checkBox34 = new System.Windows.Forms.CheckBox();
            this.checkBox4 = new System.Windows.Forms.CheckBox();
            this.checkBox2 = new System.Windows.Forms.CheckBox();
            this.checkBox3 = new System.Windows.Forms.CheckBox();
            this.checkBox22 = new System.Windows.Forms.CheckBox();
            this.checkBox5 = new System.Windows.Forms.CheckBox();
            this.checkBox6 = new System.Windows.Forms.CheckBox();
            this.checkBox8 = new System.Windows.Forms.CheckBox();
            this.checkBox7 = new System.Windows.Forms.CheckBox();
            this.checkBox18 = new System.Windows.Forms.CheckBox();
            this.checkBox9 = new System.Windows.Forms.CheckBox();
            this.checkBox19 = new System.Windows.Forms.CheckBox();
            this.checkBox10 = new System.Windows.Forms.CheckBox();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.checkBox11 = new System.Windows.Forms.CheckBox();
            this.checkBox15 = new System.Windows.Forms.CheckBox();
            this.checkBox12 = new System.Windows.Forms.CheckBox();
            this.checkBox16 = new System.Windows.Forms.CheckBox();
            this.tabPage4 = new System.Windows.Forms.TabPage();
            this.checkBox47 = new System.Windows.Forms.CheckBox();
            this.checkBox21 = new System.Windows.Forms.CheckBox();
            this.checkBox13 = new System.Windows.Forms.CheckBox();
            this.checkBox17 = new System.Windows.Forms.CheckBox();
            this.checkBox14 = new System.Windows.Forms.CheckBox();
            this.tabPage6 = new System.Windows.Forms.TabPage();
            this.checkBox28 = new System.Windows.Forms.CheckBox();
            this.checkBox27 = new System.Windows.Forms.CheckBox();
            this.checkBox26 = new System.Windows.Forms.CheckBox();
            this.tabPage5 = new System.Windows.Forms.TabPage();
            this.checkBox43 = new System.Windows.Forms.CheckBox();
            this.checkBox39 = new System.Windows.Forms.CheckBox();
            this.checkBox38 = new System.Windows.Forms.CheckBox();
            this.checkBox37 = new System.Windows.Forms.CheckBox();
            this.checkBox36 = new System.Windows.Forms.CheckBox();
            this.checkBox32 = new System.Windows.Forms.CheckBox();
            this.checkBox30 = new System.Windows.Forms.CheckBox();
            this.checkBox29 = new System.Windows.Forms.CheckBox();
            this.checkBox24 = new System.Windows.Forms.CheckBox();
            this.checkBox23 = new System.Windows.Forms.CheckBox();
            this.checkBox20 = new System.Windows.Forms.CheckBox();
            this.tabPage7 = new System.Windows.Forms.TabPage();
            this.button5 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.numericUpDown4 = new System.Windows.Forms.NumericUpDown();
            this.numericUpDown1 = new System.Windows.Forms.NumericUpDown();
            this.numericUpDown3 = new System.Windows.Forms.NumericUpDown();
            this.label13 = new System.Windows.Forms.Label();
            this.label12 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label10 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.label8 = new System.Windows.Forms.Label();
            this.comboBox4 = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.comboBox3 = new System.Windows.Forms.ComboBox();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.label7 = new System.Windows.Forms.Label();
            this.tabPage9 = new System.Windows.Forms.TabPage();
            this.label15 = new System.Windows.Forms.Label();
            this.numericUpDown2 = new System.Windows.Forms.NumericUpDown();
            this.checkBox48 = new System.Windows.Forms.CheckBox();
            this.label14 = new System.Windows.Forms.Label();
            this.radioButton6 = new System.Windows.Forms.RadioButton();
            this.radioButton7 = new System.Windows.Forms.RadioButton();
            this.radioButton8 = new System.Windows.Forms.RadioButton();
            this.checkBox25 = new System.Windows.Forms.CheckBox();
            this.checkBox31 = new System.Windows.Forms.CheckBox();
            this.label6 = new System.Windows.Forms.Label();
            this.radioButton5 = new System.Windows.Forms.RadioButton();
            this.radioButton4 = new System.Windows.Forms.RadioButton();
            this.statCountBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tabControl2 = new System.Windows.Forms.TabControl();
            this.tabPage8 = new System.Windows.Forms.TabPage();
            this.checkBox35 = new System.Windows.Forms.CheckBox();
            this.saveFileDialog2 = new System.Windows.Forms.SaveFileDialog();
            this.button6 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.openFileDialog2 = new System.Windows.Forms.OpenFileDialog();
            this.saveFileDialog3 = new System.Windows.Forms.SaveFileDialog();
            this.toolTip1 = new System.Windows.Forms.ToolTip(this.components);
            this.checkBox49 = new System.Windows.Forms.CheckBox();
            this.form1BindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.form1BindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.romBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.Colors.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.tabPage4.SuspendLayout();
            this.tabPage6.SuspendLayout();
            this.tabPage5.SuspendLayout();
            this.tabPage7.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown3)).BeginInit();
            this.tabPage9.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.statCountBindingSource)).BeginInit();
            this.tabControl2.SuspendLayout();
            this.tabPage8.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.form1BindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.form1BindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.romBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // SelectRomButton
            // 
            this.SelectRomButton.Location = new System.Drawing.Point(385, 6);
            this.SelectRomButton.Name = "SelectRomButton";
            this.SelectRomButton.Size = new System.Drawing.Size(26, 23);
            this.SelectRomButton.TabIndex = 1;
            this.SelectRomButton.Text = "...";
            this.toolTip1.SetToolTip(this.SelectRomButton, "Select a Valid US ROM.");
            this.SelectRomButton.UseVisualStyleBackColor = true;
            this.SelectRomButton.Click += new System.EventHandler(this.SelectRomButton_Click);
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(196, 8);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(183, 20);
            this.textBox1.TabIndex = 2;
            this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(128, 11);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(65, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Select Rom:";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(336, 284);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(75, 23);
            this.button2.TabIndex = 4;
            this.button2.Text = "Randomize";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // directorySearcher1
            // 
            this.directorySearcher1.ClientTimeout = System.TimeSpan.Parse("-00:00:01");
            this.directorySearcher1.ServerPageTimeLimit = System.TimeSpan.Parse("-00:00:01");
            this.directorySearcher1.ServerTimeLimit = System.TimeSpan.Parse("-00:00:01");
            // 
            // openFileDialog1
            // 
            this.openFileDialog1.FileName = "openFileDialog1";
            // 
            // SeedTextbox
            // 
            this.SeedTextbox.Location = new System.Drawing.Point(264, 261);
            this.SeedTextbox.Name = "SeedTextbox";
            this.SeedTextbox.Size = new System.Drawing.Size(147, 20);
            this.SeedTextbox.TabIndex = 5;
            this.SeedTextbox.TextChanged += new System.EventHandler(this.SeedTextbox_TextChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(223, 264);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(35, 13);
            this.label2.TabIndex = 6;
            this.label2.Text = "Seed:";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // saveFileDialog1
            // 
            this.saveFileDialog1.DefaultExt = "gba";
            this.saveFileDialog1.Filter = "Gameboy Advance Rom (*.gba)|*.gba|All files (*.*)|*.*";
            // 
            // Colors
            // 
            this.Colors.Controls.Add(this.tabPage1);
            this.Colors.Controls.Add(this.tabPage2);
            this.Colors.Controls.Add(this.tabPage3);
            this.Colors.Controls.Add(this.tabPage4);
            this.Colors.Controls.Add(this.tabPage6);
            this.Colors.Controls.Add(this.tabPage5);
            this.Colors.Controls.Add(this.tabPage7);
            this.Colors.Controls.Add(this.tabPage9);
            this.Colors.Location = new System.Drawing.Point(25, 32);
            this.Colors.Name = "Colors";
            this.Colors.SelectedIndex = 0;
            this.Colors.Size = new System.Drawing.Size(386, 218);
            this.Colors.TabIndex = 9;
            this.Colors.Visible = false;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.checkBox52);
            this.tabPage1.Controls.Add(this.checkBox51);
            this.tabPage1.Controls.Add(this.checkBox50);
            this.tabPage1.Controls.Add(this.checkBox46);
            this.tabPage1.Controls.Add(this.checkBox45);
            this.tabPage1.Controls.Add(this.checkBox44);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Controls.Add(this.radioButton3);
            this.tabPage1.Controls.Add(this.radioButton2);
            this.tabPage1.Controls.Add(this.radioButton1);
            this.tabPage1.ImeMode = System.Windows.Forms.ImeMode.On;
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(378, 192);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Items";
            this.tabPage1.UseVisualStyleBackColor = true;
            this.tabPage1.Click += new System.EventHandler(this.tabPage1_Click);
            // 
            // checkBox52
            // 
            this.checkBox52.AutoSize = true;
            this.checkBox52.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox52.Location = new System.Drawing.Point(156, 88);
            this.checkBox52.Name = "checkBox52";
            this.checkBox52.Size = new System.Drawing.Size(183, 17);
            this.checkBox52.TabIndex = 29;
            this.checkBox52.Text = "Add Harhall\'s Pants to Item Pool?";
            this.toolTip1.SetToolTip(this.checkBox52, "Checking this will add harhall\'s pants to the item pool.");
            this.checkBox52.UseVisualStyleBackColor = true;
            this.checkBox52.CheckedChanged += new System.EventHandler(this.checkBox52_CheckedChanged);
            // 
            // checkBox51
            // 
            this.checkBox51.AutoSize = true;
            this.checkBox51.Location = new System.Drawing.Point(23, 129);
            this.checkBox51.Name = "checkBox51";
            this.checkBox51.Size = new System.Drawing.Size(85, 17);
            this.checkBox51.TabIndex = 28;
            this.checkBox51.Text = "Coin Boxes?";
            this.toolTip1.SetToolTip(this.checkBox51, "Checking this will add all coin boxes to the item pool.");
            this.checkBox51.UseVisualStyleBackColor = true;
            this.checkBox51.CheckedChanged += new System.EventHandler(this.checkBox51_CheckedChanged);
            // 
            // checkBox50
            // 
            this.checkBox50.AutoSize = true;
            this.checkBox50.Checked = true;
            this.checkBox50.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox50.Location = new System.Drawing.Point(23, 106);
            this.checkBox50.Name = "checkBox50";
            this.checkBox50.Size = new System.Drawing.Size(136, 17);
            this.checkBox50.TabIndex = 27;
            this.checkBox50.Text = "Item Boxes and Moles?";
            this.toolTip1.SetToolTip(this.checkBox50, "Checking this will add all item boxes and Monty Mole rewards to the item pool.");
            this.checkBox50.UseVisualStyleBackColor = true;
            this.checkBox50.CheckedChanged += new System.EventHandler(this.checkBox50_CheckedChanged);
            // 
            // checkBox46
            // 
            this.checkBox46.AutoSize = true;
            this.checkBox46.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox46.Location = new System.Drawing.Point(125, 65);
            this.checkBox46.Name = "checkBox46";
            this.checkBox46.Size = new System.Drawing.Size(214, 17);
            this.checkBox46.TabIndex = 26;
            this.checkBox46.Text = "Remove Hidden Blocks from Item Pool?";
            this.toolTip1.SetToolTip(this.checkBox46, "Checking this will remove any hidden blocks from the item pool.");
            this.checkBox46.UseVisualStyleBackColor = true;
            this.checkBox46.CheckedChanged += new System.EventHandler(this.checkBox46_CheckedChanged);
            // 
            // checkBox45
            // 
            this.checkBox45.AutoSize = true;
            this.checkBox45.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox45.Location = new System.Drawing.Point(122, 42);
            this.checkBox45.Name = "checkBox45";
            this.checkBox45.Size = new System.Drawing.Size(217, 17);
            this.checkBox45.TabIndex = 25;
            this.checkBox45.Text = "Turn all Item Blocks into Hidden Blocks?";
            this.toolTip1.SetToolTip(this.checkBox45, "Checking this will turn all Item blocks into Hidden blocks.");
            this.checkBox45.UseVisualStyleBackColor = true;
            this.checkBox45.CheckedChanged += new System.EventHandler(this.checkBox45_CheckedChanged);
            // 
            // checkBox44
            // 
            this.checkBox44.AutoSize = true;
            this.checkBox44.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox44.Location = new System.Drawing.Point(167, 18);
            this.checkBox44.Name = "checkBox44";
            this.checkBox44.Size = new System.Drawing.Size(172, 17);
            this.checkBox44.TabIndex = 24;
            this.checkBox44.Text = "Turn all Hidden Blocks Visible?";
            this.toolTip1.SetToolTip(this.checkBox44, "Checking this will turn all hidden blocks into regular ones.");
            this.checkBox44.UseVisualStyleBackColor = true;
            this.checkBox44.CheckedChanged += new System.EventHandler(this.checkBox44_CheckedChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(20, 19);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(85, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Chuckle Beans?";
            this.label3.Click += new System.EventHandler(this.label3_Click_2);
            // 
            // radioButton3
            // 
            this.radioButton3.AutoSize = true;
            this.radioButton3.Checked = true;
            this.radioButton3.Location = new System.Drawing.Point(23, 83);
            this.radioButton3.Name = "radioButton3";
            this.radioButton3.Size = new System.Drawing.Size(36, 17);
            this.radioButton3.TabIndex = 2;
            this.radioButton3.TabStop = true;
            this.radioButton3.Text = "All";
            this.toolTip1.SetToolTip(this.radioButton3, "All chuckle beans will be added to the item pool.");
            this.radioButton3.UseVisualStyleBackColor = true;
            this.radioButton3.CheckedChanged += new System.EventHandler(this.radioButton3_CheckedChanged);
            this.radioButton3.MouseHover += new System.EventHandler(this.radioButton3_MouseHover);
            // 
            // radioButton2
            // 
            this.radioButton2.AutoSize = true;
            this.radioButton2.Location = new System.Drawing.Point(23, 60);
            this.radioButton2.Name = "radioButton2";
            this.radioButton2.Size = new System.Drawing.Size(79, 17);
            this.radioButton2.TabIndex = 1;
            this.radioButton2.Text = "Only Visible";
            this.toolTip1.SetToolTip(this.radioButton2, "Only chuckle beans clearly marked with an X will be added to the item pool.");
            this.radioButton2.UseVisualStyleBackColor = true;
            this.radioButton2.CheckedChanged += new System.EventHandler(this.radioButton2_CheckedChanged);
            this.radioButton2.MouseHover += new System.EventHandler(this.radioButton2_MouseHover);
            // 
            // radioButton1
            // 
            this.radioButton1.AutoSize = true;
            this.radioButton1.Location = new System.Drawing.Point(23, 37);
            this.radioButton1.Name = "radioButton1";
            this.radioButton1.Size = new System.Drawing.Size(51, 17);
            this.radioButton1.TabIndex = 0;
            this.radioButton1.Text = "None";
            this.toolTip1.SetToolTip(this.radioButton1, "No Chuckle Beans will be added to the item pool.");
            this.radioButton1.UseVisualStyleBackColor = true;
            this.radioButton1.CheckedChanged += new System.EventHandler(this.radioButton1_CheckedChanged);
            this.radioButton1.MouseHover += new System.EventHandler(this.radioButton1_MouseHover);
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.checkBox33);
            this.tabPage2.Controls.Add(this.checkBox34);
            this.tabPage2.Controls.Add(this.checkBox4);
            this.tabPage2.Controls.Add(this.checkBox2);
            this.tabPage2.Controls.Add(this.checkBox3);
            this.tabPage2.Controls.Add(this.checkBox22);
            this.tabPage2.Controls.Add(this.checkBox5);
            this.tabPage2.Controls.Add(this.checkBox6);
            this.tabPage2.Controls.Add(this.checkBox8);
            this.tabPage2.Controls.Add(this.checkBox7);
            this.tabPage2.Controls.Add(this.checkBox18);
            this.tabPage2.Controls.Add(this.checkBox9);
            this.tabPage2.Controls.Add(this.checkBox19);
            this.tabPage2.Controls.Add(this.checkBox10);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(378, 192);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Key Items";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // checkBox33
            // 
            this.checkBox33.AutoSize = true;
            this.checkBox33.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox33.Checked = true;
            this.checkBox33.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox33.Location = new System.Drawing.Point(192, 157);
            this.checkBox33.Name = "checkBox33";
            this.checkBox33.Size = new System.Drawing.Size(109, 17);
            this.checkBox33.TabIndex = 23;
            this.checkBox33.Text = "Beanstar Pieces?";
            this.toolTip1.SetToolTip(this.checkBox33, "Checking this will add the Beanstar Pieces to the item pool.\r\nYou must gather all" +
        " 4 pieces and reassemble the beanstar as an extra requirement to beat the game.");
            this.checkBox33.UseVisualStyleBackColor = true;
            this.checkBox33.CheckedChanged += new System.EventHandler(this.checkBox33_CheckedChanged);
            // 
            // checkBox34
            // 
            this.checkBox34.AutoSize = true;
            this.checkBox34.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox34.Checked = true;
            this.checkBox34.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox34.Location = new System.Drawing.Point(80, 157);
            this.checkBox34.Name = "checkBox34";
            this.checkBox34.Size = new System.Drawing.Size(71, 17);
            this.checkBox34.TabIndex = 22;
            this.checkBox34.Text = "Spangle?";
            this.toolTip1.SetToolTip(this.checkBox34, "Checking this will add Spangle to the item pool.\r\nGive Spangle to Hermie in Gwaha" +
        "r lagoon for a reward.");
            this.checkBox34.UseVisualStyleBackColor = true;
            this.checkBox34.CheckedChanged += new System.EventHandler(this.checkBox34_CheckedChanged);
            // 
            // checkBox4
            // 
            this.checkBox4.AutoSize = true;
            this.checkBox4.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox4.Checked = true;
            this.checkBox4.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox4.Location = new System.Drawing.Point(51, 42);
            this.checkBox4.Name = "checkBox4";
            this.checkBox4.Size = new System.Drawing.Size(100, 17);
            this.checkBox4.TabIndex = 12;
            this.checkBox4.Text = "Chuckola Fruit?";
            this.toolTip1.SetToolTip(this.checkBox4, "Checking this will add all 3 Chuckola Fruits to the item pool.\r\nUse all 3 fruits " +
        "to progress past Chuckleroot in Chucklehuck woods");
            this.checkBox4.UseVisualStyleBackColor = true;
            this.checkBox4.CheckedChanged += new System.EventHandler(this.checkBox4_CheckedChanged);
            // 
            // checkBox2
            // 
            this.checkBox2.AutoSize = true;
            this.checkBox2.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox2.Checked = true;
            this.checkBox2.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox2.Location = new System.Drawing.Point(47, 19);
            this.checkBox2.Name = "checkBox2";
            this.checkBox2.Size = new System.Drawing.Size(104, 17);
            this.checkBox2.TabIndex = 10;
            this.checkBox2.Text = "Peasley\'s Rose?";
            this.toolTip1.SetToolTip(this.checkBox2, "Checking this will add Peasley\'s Rose to the item pool.\r\nYou can use Peasley\'s Ro" +
        "se to enter Beanbean Castle.");
            this.checkBox2.UseVisualStyleBackColor = true;
            this.checkBox2.CheckedChanged += new System.EventHandler(this.checkBox2_CheckedChanged);
            // 
            // checkBox3
            // 
            this.checkBox3.AutoSize = true;
            this.checkBox3.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox3.Checked = true;
            this.checkBox3.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox3.Location = new System.Drawing.Point(183, 19);
            this.checkBox3.Name = "checkBox3";
            this.checkBox3.Size = new System.Drawing.Size(118, 17);
            this.checkBox3.TabIndex = 11;
            this.checkBox3.Text = "Beanbean Brooch?";
            this.toolTip1.SetToolTip(this.checkBox3, "Checking this will add the beanbean Brooch to the item pool.\r\nThe Beanbean Brooch" +
        " will let you enter ChuckleHuck Woods.");
            this.checkBox3.UseVisualStyleBackColor = true;
            this.checkBox3.CheckedChanged += new System.EventHandler(this.checkBox3_CheckedChanged);
            // 
            // checkBox22
            // 
            this.checkBox22.AutoSize = true;
            this.checkBox22.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox22.Checked = true;
            this.checkBox22.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox22.Location = new System.Drawing.Point(228, 134);
            this.checkBox22.Name = "checkBox22";
            this.checkBox22.Size = new System.Drawing.Size(73, 17);
            this.checkBox22.TabIndex = 21;
            this.checkBox22.Text = "Beanlets?";
            this.toolTip1.SetToolTip(this.checkBox22, "Checking this will add all 5 Beanlets to the item pool. These serve no purpose.");
            this.checkBox22.UseVisualStyleBackColor = true;
            this.checkBox22.CheckedChanged += new System.EventHandler(this.checkBox22_CheckedChanged);
            // 
            // checkBox5
            // 
            this.checkBox5.AutoSize = true;
            this.checkBox5.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox5.Checked = true;
            this.checkBox5.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox5.Location = new System.Drawing.Point(187, 42);
            this.checkBox5.Name = "checkBox5";
            this.checkBox5.Size = new System.Drawing.Size(114, 17);
            this.checkBox5.TabIndex = 13;
            this.checkBox5.Text = "Membership Card?";
            this.toolTip1.SetToolTip(this.checkBox5, "Checking this will add the Membership card to the item pool.\r\nUse this to sink th" +
        "e S.S Chuckola.");
            this.checkBox5.UseVisualStyleBackColor = true;
            this.checkBox5.CheckedChanged += new System.EventHandler(this.checkBox5_CheckedChanged);
            // 
            // checkBox6
            // 
            this.checkBox6.AutoSize = true;
            this.checkBox6.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox6.Checked = true;
            this.checkBox6.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox6.Location = new System.Drawing.Point(61, 65);
            this.checkBox6.Name = "checkBox6";
            this.checkBox6.Size = new System.Drawing.Size(90, 17);
            this.checkBox6.TabIndex = 14;
            this.checkBox6.Text = "Winkle Card?";
            this.toolTip1.SetToolTip(this.checkBox6, "Checking this will add the Winkle Card to the pool.\r\nUse this to enter the Winkle" +
        " area in ChuckleHuck woods.");
            this.checkBox6.UseVisualStyleBackColor = true;
            this.checkBox6.CheckedChanged += new System.EventHandler(this.checkBox6_CheckedChanged);
            // 
            // checkBox8
            // 
            this.checkBox8.AutoSize = true;
            this.checkBox8.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox8.Checked = true;
            this.checkBox8.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox8.Location = new System.Drawing.Point(215, 65);
            this.checkBox8.Name = "checkBox8";
            this.checkBox8.Size = new System.Drawing.Size(86, 17);
            this.checkBox8.TabIndex = 16;
            this.checkBox8.Text = "Extra Dress?";
            this.toolTip1.SetToolTip(this.checkBox8, "Checking this will add Peach\'s Extra Dress to the itme pool.\r\nYou will need the d" +
        "ress to progress past Joke\'s End.");
            this.checkBox8.UseVisualStyleBackColor = true;
            this.checkBox8.CheckedChanged += new System.EventHandler(this.checkBox8_CheckedChanged);
            // 
            // checkBox7
            // 
            this.checkBox7.AutoSize = true;
            this.checkBox7.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox7.Checked = true;
            this.checkBox7.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox7.Location = new System.Drawing.Point(50, 88);
            this.checkBox7.Name = "checkBox7";
            this.checkBox7.Size = new System.Drawing.Size(101, 17);
            this.checkBox7.TabIndex = 15;
            this.checkBox7.Text = "Fake Beanstar?";
            this.toolTip1.SetToolTip(this.checkBox7, "Checking this will add the Fake Beanstar to the itme pool.\r\nYou will need the fak" +
        "e beanstar to progress past Joke\'s End.");
            this.checkBox7.UseVisualStyleBackColor = true;
            this.checkBox7.CheckedChanged += new System.EventHandler(this.checkBox7_CheckedChanged);
            // 
            // checkBox18
            // 
            this.checkBox18.AutoSize = true;
            this.checkBox18.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox18.Checked = true;
            this.checkBox18.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox18.Location = new System.Drawing.Point(204, 111);
            this.checkBox18.Name = "checkBox18";
            this.checkBox18.Size = new System.Drawing.Size(97, 17);
            this.checkBox18.TabIndex = 19;
            this.checkBox18.Text = "Secret Scrolls?";
            this.toolTip1.SetToolTip(this.checkBox18, "Checking this will add the secret scrolls to the item pool.\r\nUse these to unlock " +
        "new Bros. Attacks in combat.");
            this.checkBox18.UseVisualStyleBackColor = true;
            this.checkBox18.CheckedChanged += new System.EventHandler(this.checkBox18_CheckedChanged);
            // 
            // checkBox9
            // 
            this.checkBox9.AutoSize = true;
            this.checkBox9.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox9.Checked = true;
            this.checkBox9.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox9.Location = new System.Drawing.Point(227, 88);
            this.checkBox9.Name = "checkBox9";
            this.checkBox9.Size = new System.Drawing.Size(74, 17);
            this.checkBox9.TabIndex = 17;
            this.checkBox9.Text = "Beanfruit?";
            this.toolTip1.SetToolTip(this.checkBox9, "Checking this will add all 7 Beanfruit to the item pool.\r\nUse these to feed the y" +
        "oshi in Yoshi\'s Theater for rewards.");
            this.checkBox9.UseVisualStyleBackColor = true;
            this.checkBox9.CheckedChanged += new System.EventHandler(this.checkBox9_CheckedChanged);
            // 
            // checkBox19
            // 
            this.checkBox19.AutoSize = true;
            this.checkBox19.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox19.Checked = true;
            this.checkBox19.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox19.Location = new System.Drawing.Point(63, 134);
            this.checkBox19.Name = "checkBox19";
            this.checkBox19.Size = new System.Drawing.Size(88, 17);
            this.checkBox19.TabIndex = 20;
            this.checkBox19.Text = "Beanstones?";
            this.toolTip1.SetToolTip(this.checkBox19, "Checking this will add all 10 Beanstones to the item pool. These do not serve a p" +
        "urpose.");
            this.checkBox19.UseVisualStyleBackColor = true;
            this.checkBox19.CheckedChanged += new System.EventHandler(this.checkBox19_CheckedChanged);
            // 
            // checkBox10
            // 
            this.checkBox10.AutoSize = true;
            this.checkBox10.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox10.Checked = true;
            this.checkBox10.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox10.Location = new System.Drawing.Point(66, 111);
            this.checkBox10.Name = "checkBox10";
            this.checkBox10.Size = new System.Drawing.Size(85, 17);
            this.checkBox10.TabIndex = 18;
            this.checkBox10.Text = "Neon Eggs?";
            this.toolTip1.SetToolTip(this.checkBox10, "Checking this will add all 7 Neon Eggs to the Item Pool.\r\nCollect all 7 to the th" +
        "e beanstar piece in Yoshi\'s Theater");
            this.checkBox10.UseVisualStyleBackColor = true;
            this.checkBox10.CheckedChanged += new System.EventHandler(this.checkBox10_CheckedChanged);
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.checkBox11);
            this.tabPage3.Controls.Add(this.checkBox15);
            this.tabPage3.Controls.Add(this.checkBox12);
            this.tabPage3.Controls.Add(this.checkBox16);
            this.tabPage3.Location = new System.Drawing.Point(4, 22);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(378, 192);
            this.tabPage3.TabIndex = 2;
            this.tabPage3.Text = "Bros Items";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // checkBox11
            // 
            this.checkBox11.AutoSize = true;
            this.checkBox11.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox11.Checked = true;
            this.checkBox11.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox11.Location = new System.Drawing.Point(75, 18);
            this.checkBox11.Name = "checkBox11";
            this.checkBox11.Size = new System.Drawing.Size(76, 17);
            this.checkBox11.TabIndex = 18;
            this.checkBox11.Text = "Hammers?";
            this.toolTip1.SetToolTip(this.checkBox11, "Checking this will add all 3 Hammers to the item pool.");
            this.checkBox11.UseVisualStyleBackColor = true;
            this.checkBox11.CheckedChanged += new System.EventHandler(this.checkBox11_CheckedChanged);
            // 
            // checkBox15
            // 
            this.checkBox15.AutoSize = true;
            this.checkBox15.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox15.Checked = true;
            this.checkBox15.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox15.Location = new System.Drawing.Point(182, 18);
            this.checkBox15.Name = "checkBox15";
            this.checkBox15.Size = new System.Drawing.Size(105, 17);
            this.checkBox15.TabIndex = 22;
            this.checkBox15.Text = "Hammer moves?";
            this.toolTip1.SetToolTip(this.checkBox15, "Checking this will add the Red and Green Goblet to the item pool.\r\nThese will giv" +
        "e you the ability to dig and make mario small.");
            this.checkBox15.UseVisualStyleBackColor = true;
            this.checkBox15.CheckedChanged += new System.EventHandler(this.checkBox15_CheckedChanged);
            // 
            // checkBox12
            // 
            this.checkBox12.AutoSize = true;
            this.checkBox12.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox12.Checked = true;
            this.checkBox12.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox12.Location = new System.Drawing.Point(88, 52);
            this.checkBox12.Name = "checkBox12";
            this.checkBox12.Size = new System.Drawing.Size(63, 17);
            this.checkBox12.TabIndex = 19;
            this.checkBox12.Text = "Hands?";
            this.toolTip1.SetToolTip(this.checkBox12, "Checking this will add Fire and Thunder Hand to the item pool.");
            this.checkBox12.UseVisualStyleBackColor = true;
            this.checkBox12.CheckedChanged += new System.EventHandler(this.checkBox12_CheckedChanged);
            // 
            // checkBox16
            // 
            this.checkBox16.AutoSize = true;
            this.checkBox16.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox16.Checked = true;
            this.checkBox16.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox16.Location = new System.Drawing.Point(194, 52);
            this.checkBox16.Name = "checkBox16";
            this.checkBox16.Size = new System.Drawing.Size(93, 17);
            this.checkBox16.TabIndex = 23;
            this.checkBox16.Text = "Hand Moves?";
            this.toolTip1.SetToolTip(this.checkBox16, "Checking this will and the Red and Green Pearl Beans to the item pool.\r\nGetting t" +
        "hese will give you the fire Dash and Thunder Crash abilities.");
            this.checkBox16.UseVisualStyleBackColor = true;
            this.checkBox16.CheckedChanged += new System.EventHandler(this.checkBox16_CheckedChanged);
            // 
            // tabPage4
            // 
            this.tabPage4.Controls.Add(this.checkBox47);
            this.tabPage4.Controls.Add(this.checkBox21);
            this.tabPage4.Controls.Add(this.checkBox13);
            this.tabPage4.Controls.Add(this.checkBox17);
            this.tabPage4.Controls.Add(this.checkBox14);
            this.tabPage4.Location = new System.Drawing.Point(4, 22);
            this.tabPage4.Name = "tabPage4";
            this.tabPage4.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage4.Size = new System.Drawing.Size(378, 192);
            this.tabPage4.TabIndex = 3;
            this.tabPage4.Text = "Shops";
            this.tabPage4.UseVisualStyleBackColor = true;
            // 
            // checkBox47
            // 
            this.checkBox47.AutoSize = true;
            this.checkBox47.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox47.Location = new System.Drawing.Point(186, 42);
            this.checkBox47.Name = "checkBox47";
            this.checkBox47.Size = new System.Drawing.Size(163, 17);
            this.checkBox47.TabIndex = 27;
            this.checkBox47.Text = "No key items in coffee shop?";
            this.toolTip1.SetToolTip(this.checkBox47, "Checking this will make it so no Key Items can be placed in the Esprsoo shop when" +
        " generating a seed.");
            this.checkBox47.UseVisualStyleBackColor = true;
            this.checkBox47.CheckedChanged += new System.EventHandler(this.checkBox47_CheckedChanged);
            // 
            // checkBox21
            // 
            this.checkBox21.AutoSize = true;
            this.checkBox21.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox21.Checked = true;
            this.checkBox21.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox21.Location = new System.Drawing.Point(66, 18);
            this.checkBox21.Name = "checkBox21";
            this.checkBox21.Size = new System.Drawing.Size(85, 17);
            this.checkBox21.TabIndex = 25;
            this.checkBox21.Text = "Item Shops?";
            this.toolTip1.SetToolTip(this.checkBox21, "Checking this will add all Items in the Item shop into the item pool.");
            this.checkBox21.UseVisualStyleBackColor = true;
            this.checkBox21.CheckedChanged += new System.EventHandler(this.checkBox21_CheckedChanged);
            // 
            // checkBox13
            // 
            this.checkBox13.AutoSize = true;
            this.checkBox13.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox13.Checked = true;
            this.checkBox13.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox13.Location = new System.Drawing.Point(83, 84);
            this.checkBox13.Name = "checkBox13";
            this.checkBox13.Size = new System.Drawing.Size(68, 17);
            this.checkBox13.TabIndex = 20;
            this.checkBox13.Text = "Badges?";
            this.toolTip1.SetToolTip(this.checkBox13, "Checking this will add all Items from the Badge Shop to the Item pool.");
            this.checkBox13.UseVisualStyleBackColor = true;
            this.checkBox13.CheckedChanged += new System.EventHandler(this.checkBox13_CheckedChanged);
            // 
            // checkBox17
            // 
            this.checkBox17.AutoSize = true;
            this.checkBox17.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox17.Checked = true;
            this.checkBox17.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox17.Location = new System.Drawing.Point(275, 19);
            this.checkBox17.Name = "checkBox17";
            this.checkBox17.Size = new System.Drawing.Size(75, 17);
            this.checkBox17.TabIndex = 24;
            this.checkBox17.Text = "Espresso?";
            this.toolTip1.SetToolTip(this.checkBox17, "Checking this will add all 7 Espressos and all 7 E. Gadd rewards to the Item pool" +
        ".");
            this.checkBox17.UseVisualStyleBackColor = true;
            this.checkBox17.CheckedChanged += new System.EventHandler(this.checkBox17_CheckedChanged);
            // 
            // checkBox14
            // 
            this.checkBox14.AutoSize = true;
            this.checkBox14.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox14.Checked = true;
            this.checkBox14.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox14.Location = new System.Drawing.Point(92, 52);
            this.checkBox14.Name = "checkBox14";
            this.checkBox14.Size = new System.Drawing.Size(59, 17);
            this.checkBox14.TabIndex = 21;
            this.checkBox14.Text = "Pants?";
            this.toolTip1.SetToolTip(this.checkBox14, "Checking this will add all Items form the Pants Shop to the Item pool.");
            this.checkBox14.UseVisualStyleBackColor = true;
            this.checkBox14.CheckedChanged += new System.EventHandler(this.checkBox14_CheckedChanged);
            // 
            // tabPage6
            // 
            this.tabPage6.Controls.Add(this.checkBox28);
            this.tabPage6.Controls.Add(this.checkBox27);
            this.tabPage6.Controls.Add(this.checkBox26);
            this.tabPage6.Location = new System.Drawing.Point(4, 22);
            this.tabPage6.Name = "tabPage6";
            this.tabPage6.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage6.Size = new System.Drawing.Size(378, 192);
            this.tabPage6.TabIndex = 5;
            this.tabPage6.Text = "Stats";
            this.tabPage6.UseVisualStyleBackColor = true;
            // 
            // checkBox28
            // 
            this.checkBox28.AutoSize = true;
            this.checkBox28.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox28.Location = new System.Drawing.Point(19, 65);
            this.checkBox28.Name = "checkBox28";
            this.checkBox28.Size = new System.Drawing.Size(132, 17);
            this.checkBox28.TabIndex = 32;
            this.checkBox28.Text = "Espresso Stat Values?";
            this.toolTip1.SetToolTip(this.checkBox28, "Checking this will rnadomize the stat increase values of all 7 Espressos.");
            this.checkBox28.UseVisualStyleBackColor = true;
            this.checkBox28.CheckedChanged += new System.EventHandler(this.checkBox28_CheckedChanged);
            // 
            // checkBox27
            // 
            this.checkBox27.AutoSize = true;
            this.checkBox27.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox27.Location = new System.Drawing.Point(39, 42);
            this.checkBox27.Name = "checkBox27";
            this.checkBox27.Size = new System.Drawing.Size(112, 17);
            this.checkBox27.TabIndex = 31;
            this.checkBox27.Text = "Item Heal Values?";
            this.toolTip1.SetToolTip(this.checkBox27, "Checking this will randomize the Heal Values of all Mushrooms, Syrups, and Nuts.");
            this.checkBox27.UseVisualStyleBackColor = true;
            this.checkBox27.CheckedChanged += new System.EventHandler(this.checkBox27_CheckedChanged);
            // 
            // checkBox26
            // 
            this.checkBox26.AutoSize = true;
            this.checkBox26.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox26.Location = new System.Drawing.Point(19, 19);
            this.checkBox26.Name = "checkBox26";
            this.checkBox26.Size = new System.Drawing.Size(132, 17);
            this.checkBox26.TabIndex = 30;
            this.checkBox26.Text = "Bros. Move BP Costs?";
            this.toolTip1.SetToolTip(this.checkBox26, "Checking this will randomize the BP costs of all Bros. Moves.");
            this.checkBox26.UseVisualStyleBackColor = true;
            this.checkBox26.CheckedChanged += new System.EventHandler(this.checkBox26_CheckedChanged);
            // 
            // tabPage5
            // 
            this.tabPage5.Controls.Add(this.checkBox43);
            this.tabPage5.Controls.Add(this.checkBox39);
            this.tabPage5.Controls.Add(this.checkBox38);
            this.tabPage5.Controls.Add(this.checkBox37);
            this.tabPage5.Controls.Add(this.checkBox36);
            this.tabPage5.Controls.Add(this.checkBox32);
            this.tabPage5.Controls.Add(this.checkBox30);
            this.tabPage5.Controls.Add(this.checkBox29);
            this.tabPage5.Controls.Add(this.checkBox24);
            this.tabPage5.Controls.Add(this.checkBox23);
            this.tabPage5.Controls.Add(this.checkBox20);
            this.tabPage5.Location = new System.Drawing.Point(4, 22);
            this.tabPage5.Name = "tabPage5";
            this.tabPage5.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage5.Size = new System.Drawing.Size(378, 192);
            this.tabPage5.TabIndex = 4;
            this.tabPage5.Text = "Misc.";
            this.tabPage5.UseVisualStyleBackColor = true;
            // 
            // checkBox43
            // 
            this.checkBox43.AutoSize = true;
            this.checkBox43.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox43.Location = new System.Drawing.Point(92, 123);
            this.checkBox43.Name = "checkBox43";
            this.checkBox43.Size = new System.Drawing.Size(85, 17);
            this.checkBox43.TabIndex = 46;
            this.checkBox43.Text = "Extra Pipes?";
            this.toolTip1.SetToolTip(this.checkBox43, "CHecking this will give you access to pipes 3, 4, and 6 from the start of the gam" +
        "e.");
            this.checkBox43.UseVisualStyleBackColor = true;
            this.checkBox43.CheckedChanged += new System.EventHandler(this.checkBox43_CheckedChanged);
            // 
            // checkBox39
            // 
            this.checkBox39.AutoSize = true;
            this.checkBox39.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox39.Enabled = false;
            this.checkBox39.Location = new System.Drawing.Point(251, 31);
            this.checkBox39.Name = "checkBox39";
            this.checkBox39.Size = new System.Drawing.Size(116, 17);
            this.checkBox39.TabIndex = 43;
            this.checkBox39.Text = "Randomize Doors?";
            this.toolTip1.SetToolTip(this.checkBox39, "Checking this will randomize All Entrances in the game. Entering a door will take" +
        " you to a random location in the game.");
            this.checkBox39.UseVisualStyleBackColor = true;
            this.checkBox39.Visible = false;
            this.checkBox39.CheckedChanged += new System.EventHandler(this.checkBox39_CheckedChanged);
            // 
            // checkBox38
            // 
            this.checkBox38.AutoSize = true;
            this.checkBox38.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox38.Location = new System.Drawing.Point(243, 100);
            this.checkBox38.Name = "checkBox38";
            this.checkBox38.Size = new System.Drawing.Size(124, 17);
            this.checkBox38.TabIndex = 42;
            this.checkBox38.Text = "Randomize Sounds?";
            this.toolTip1.SetToolTip(this.checkBox38, "Checking this will randomize all sounds in the game.");
            this.checkBox38.UseVisualStyleBackColor = true;
            this.checkBox38.CheckedChanged += new System.EventHandler(this.checkBox38_CheckedChanged);
            // 
            // checkBox37
            // 
            this.checkBox37.AutoSize = true;
            this.checkBox37.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox37.Location = new System.Drawing.Point(269, 146);
            this.checkBox37.Name = "checkBox37";
            this.checkBox37.Size = new System.Drawing.Size(98, 17);
            this.checkBox37.TabIndex = 41;
            this.checkBox37.Text = "Disable Music?";
            this.toolTip1.SetToolTip(this.checkBox37, "Checking this will mute all music in the game. You can still hear all other sound" +
        "s.");
            this.checkBox37.UseVisualStyleBackColor = true;
            this.checkBox37.CheckedChanged += new System.EventHandler(this.checkBox37_CheckedChanged);
            // 
            // checkBox36
            // 
            this.checkBox36.AutoSize = true;
            this.checkBox36.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox36.Location = new System.Drawing.Point(214, 77);
            this.checkBox36.Name = "checkBox36";
            this.checkBox36.Size = new System.Drawing.Size(153, 17);
            this.checkBox36.TabIndex = 40;
            this.checkBox36.Text = "Enable Minigame Spoilers?";
            this.toolTip1.SetToolTip(this.checkBox36, "Checking this will give you ingame spoilers on certain items that are behind mini" +
        "games. Stand in fronr of the specific NPC/Sign to see what item is behind the mi" +
        "nigame.");
            this.checkBox36.UseVisualStyleBackColor = true;
            this.checkBox36.CheckedChanged += new System.EventHandler(this.checkBox36_CheckedChanged_1);
            // 
            // checkBox32
            // 
            this.checkBox32.AutoSize = true;
            this.checkBox32.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox32.Location = new System.Drawing.Point(18, 77);
            this.checkBox32.Name = "checkBox32";
            this.checkBox32.Size = new System.Drawing.Size(159, 17);
            this.checkBox32.TabIndex = 39;
            this.checkBox32.Text = "Disable Minecart Minigame?";
            this.toolTip1.SetToolTip(this.checkBox32, "Checking this will remove the minecart minigame from the game, making passage fro" +
        "m hoohoo mountain to beanbean outskirts much smoother.");
            this.checkBox32.UseVisualStyleBackColor = true;
            this.checkBox32.CheckedChanged += new System.EventHandler(this.checkBox32_CheckedChanged);
            // 
            // checkBox30
            // 
            this.checkBox30.AutoSize = true;
            this.checkBox30.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox30.Location = new System.Drawing.Point(186, 54);
            this.checkBox30.Name = "checkBox30";
            this.checkBox30.Size = new System.Drawing.Size(181, 17);
            this.checkBox30.TabIndex = 31;
            this.checkBox30.Text = "Randomize Battle Backgrounds?";
            this.toolTip1.SetToolTip(this.checkBox30, "Checking this will randomize the background image of all battles.");
            this.checkBox30.UseVisualStyleBackColor = true;
            this.checkBox30.CheckedChanged += new System.EventHandler(this.checkBox30_CheckedChanged_1);
            // 
            // checkBox29
            // 
            this.checkBox29.AutoSize = true;
            this.checkBox29.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox29.Location = new System.Drawing.Point(251, 123);
            this.checkBox29.Name = "checkBox29";
            this.checkBox29.Size = new System.Drawing.Size(116, 17);
            this.checkBox29.TabIndex = 30;
            this.checkBox29.Text = "Randomize Music?";
            this.toolTip1.SetToolTip(this.checkBox29, "Checking this will randomize all music in the game.");
            this.checkBox29.UseVisualStyleBackColor = true;
            this.checkBox29.CheckedChanged += new System.EventHandler(this.checkBox29_CheckedChanged);
            // 
            // checkBox24
            // 
            this.checkBox24.AutoSize = true;
            this.checkBox24.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox24.Location = new System.Drawing.Point(47, 100);
            this.checkBox24.Name = "checkBox24";
            this.checkBox24.Size = new System.Drawing.Size(130, 17);
            this.checkBox24.TabIndex = 28;
            this.checkBox24.Text = "Skip Bowser\'s Castle?";
            this.toolTip1.SetToolTip(this.checkBox24, "Checking this will remove all items from bowser\'s castle from the item pool, and " +
        "let you skip stright to the final boss once you enter the castle.\r\n");
            this.checkBox24.UseVisualStyleBackColor = true;
            this.checkBox24.CheckedChanged += new System.EventHandler(this.checkBox24_CheckedChanged);
            // 
            // checkBox23
            // 
            this.checkBox23.AutoSize = true;
            this.checkBox23.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox23.Location = new System.Drawing.Point(40, 54);
            this.checkBox23.Name = "checkBox23";
            this.checkBox23.Size = new System.Drawing.Size(137, 17);
            this.checkBox23.TabIndex = 27;
            this.checkBox23.Text = "Disable Surf Minigame?";
            this.toolTip1.SetToolTip(this.checkBox23, "Checking this will remove the reward from the surf minigame from the item pool.");
            this.checkBox23.UseVisualStyleBackColor = true;
            this.checkBox23.CheckedChanged += new System.EventHandler(this.checkBox23_CheckedChanged);
            // 
            // checkBox20
            // 
            this.checkBox20.AutoSize = true;
            this.checkBox20.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox20.Location = new System.Drawing.Point(47, 31);
            this.checkBox20.Name = "checkBox20";
            this.checkBox20.Size = new System.Drawing.Size(130, 17);
            this.checkBox20.TabIndex = 26;
            this.checkBox20.Text = "Disable Mush Badge?";
            this.toolTip1.SetToolTip(this.checkBox20, "Checking this will remove all 3 Mush Badges from the Game, including in the vanil" +
        "la locations.");
            this.checkBox20.UseVisualStyleBackColor = true;
            this.checkBox20.CheckedChanged += new System.EventHandler(this.checkBox20_CheckedChanged);
            // 
            // tabPage7
            // 
            this.tabPage7.Controls.Add(this.button5);
            this.tabPage7.Controls.Add(this.button4);
            this.tabPage7.Controls.Add(this.button3);
            this.tabPage7.Controls.Add(this.button1);
            this.tabPage7.Controls.Add(this.numericUpDown4);
            this.tabPage7.Controls.Add(this.numericUpDown1);
            this.tabPage7.Controls.Add(this.numericUpDown3);
            this.tabPage7.Controls.Add(this.label13);
            this.tabPage7.Controls.Add(this.label12);
            this.tabPage7.Controls.Add(this.label11);
            this.tabPage7.Controls.Add(this.label10);
            this.tabPage7.Controls.Add(this.label9);
            this.tabPage7.Controls.Add(this.panel1);
            this.tabPage7.Controls.Add(this.label8);
            this.tabPage7.Controls.Add(this.comboBox4);
            this.tabPage7.Controls.Add(this.label4);
            this.tabPage7.Controls.Add(this.label5);
            this.tabPage7.Controls.Add(this.comboBox3);
            this.tabPage7.Controls.Add(this.comboBox1);
            this.tabPage7.Controls.Add(this.comboBox2);
            this.tabPage7.Controls.Add(this.label7);
            this.tabPage7.Location = new System.Drawing.Point(4, 22);
            this.tabPage7.Name = "tabPage7";
            this.tabPage7.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage7.Size = new System.Drawing.Size(378, 192);
            this.tabPage7.TabIndex = 6;
            this.tabPage7.Text = "Colors";
            this.tabPage7.UseVisualStyleBackColor = true;
            // 
            // button5
            // 
            this.button5.Location = new System.Drawing.Point(110, 158);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(101, 23);
            this.button5.TabIndex = 62;
            this.button5.Text = "Luigi Trousers";
            this.button5.UseVisualStyleBackColor = true;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // button4
            // 
            this.button4.Location = new System.Drawing.Point(6, 158);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(101, 23);
            this.button4.TabIndex = 61;
            this.button4.Text = "Luigi Colors";
            this.button4.UseVisualStyleBackColor = true;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(9, 124);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(101, 23);
            this.button3.TabIndex = 60;
            this.button3.Text = "Mario Colors";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(110, 124);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(101, 23);
            this.button1.TabIndex = 59;
            this.button1.Text = "Mario Trousers";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // numericUpDown4
            // 
            this.numericUpDown4.Hexadecimal = true;
            this.numericUpDown4.Location = new System.Drawing.Point(231, 166);
            this.numericUpDown4.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.numericUpDown4.Name = "numericUpDown4";
            this.numericUpDown4.Size = new System.Drawing.Size(43, 20);
            this.numericUpDown4.TabIndex = 58;
            this.numericUpDown4.ValueChanged += new System.EventHandler(this.numericUpDown4_ValueChanged);
            // 
            // numericUpDown1
            // 
            this.numericUpDown1.Hexadecimal = true;
            this.numericUpDown1.Location = new System.Drawing.Point(231, 137);
            this.numericUpDown1.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.numericUpDown1.Name = "numericUpDown1";
            this.numericUpDown1.Size = new System.Drawing.Size(43, 20);
            this.numericUpDown1.TabIndex = 57;
            this.numericUpDown1.ValueChanged += new System.EventHandler(this.numericUpDown1_ValueChanged_1);
            // 
            // numericUpDown3
            // 
            this.numericUpDown3.Hexadecimal = true;
            this.numericUpDown3.Location = new System.Drawing.Point(231, 106);
            this.numericUpDown3.Maximum = new decimal(new int[] {
            255,
            0,
            0,
            0});
            this.numericUpDown3.Name = "numericUpDown3";
            this.numericUpDown3.Size = new System.Drawing.Size(43, 20);
            this.numericUpDown3.TabIndex = 56;
            this.numericUpDown3.ValueChanged += new System.EventHandler(this.numericUpDown3_ValueChanged);
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(63, 98);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(101, 13);
            this.label13.TabIndex = 53;
            this.label13.Text = "Apply Custom Color:";
            this.label13.Click += new System.EventHandler(this.label13_Click);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(290, 82);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(69, 13);
            this.label12.TabIndex = 49;
            this.label12.Text = "Custom Color";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(213, 168);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(17, 13);
            this.label11.TabIndex = 48;
            this.label11.Text = "B:";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(213, 108);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(18, 13);
            this.label10.TabIndex = 47;
            this.label10.Text = "R:";
            this.label10.Click += new System.EventHandler(this.label10_Click);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(213, 139);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(18, 13);
            this.label9.TabIndex = 10;
            this.label9.Text = "G:";
            this.label9.Click += new System.EventHandler(this.label9_Click);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.Black;
            this.panel1.Location = new System.Drawing.Point(280, 98);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(92, 88);
            this.panel1.TabIndex = 4;
            this.panel1.Paint += new System.Windows.Forms.PaintEventHandler(this.panel1_Paint);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(184, 54);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(76, 13);
            this.label8.TabIndex = 44;
            this.label8.Text = "Luigi Trousers:";
            this.toolTip1.SetToolTip(this.label8, "This will change the color of Luigi\'s Trousers.");
            this.label8.Click += new System.EventHandler(this.label8_Click);
            // 
            // comboBox4
            // 
            this.comboBox4.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox4.FormattingEnabled = true;
            this.comboBox4.Items.AddRange(new object[] {
            "Vanilla",
            "Green",
            "Red",
            "Purple",
            "Yellow",
            "Cyan",
            "Blue",
            "Pink",
            "Orange",
            "Black",
            "White",
            "Random",
            "Chaos",
            "Custom"});
            this.comboBox4.Location = new System.Drawing.Point(266, 51);
            this.comboBox4.Name = "comboBox4";
            this.comboBox4.Size = new System.Drawing.Size(93, 21);
            this.comboBox4.TabIndex = 43;
            this.comboBox4.SelectedIndexChanged += new System.EventHandler(this.comboBox4_SelectedIndexChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 23);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(68, 13);
            this.label4.TabIndex = 33;
            this.label4.Text = "Mario Colors:";
            this.toolTip1.SetToolTip(this.label4, "This will change the color of Mario\'s hat. This will also change the colors of ot" +
        "her things including UI etc.");
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(10, 54);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(64, 13);
            this.label5.TabIndex = 34;
            this.label5.Text = "Luigi Colors:";
            this.toolTip1.SetToolTip(this.label5, "This will change the color of Luigi\'s hat. This will also change the colors of ot" +
        "her things including UI etc.");
            this.label5.Click += new System.EventHandler(this.label5_Click);
            // 
            // comboBox3
            // 
            this.comboBox3.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox3.FormattingEnabled = true;
            this.comboBox3.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.comboBox3.Items.AddRange(new object[] {
            "Vanilla",
            "Red",
            "Green",
            "Purple",
            "Yellow",
            "Cyan",
            "Blue",
            "Pink",
            "Orange",
            "Black",
            "White",
            "Random",
            "Chaos",
            "Custom"});
            this.comboBox3.Location = new System.Drawing.Point(266, 20);
            this.comboBox3.Name = "comboBox3";
            this.comboBox3.Size = new System.Drawing.Size(93, 21);
            this.comboBox3.TabIndex = 42;
            this.comboBox3.SelectedIndexChanged += new System.EventHandler(this.comboBox3_SelectedIndexChanged);
            // 
            // comboBox1
            // 
            this.comboBox1.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.ImeMode = System.Windows.Forms.ImeMode.NoControl;
            this.comboBox1.Items.AddRange(new object[] {
            "Red",
            "Green",
            "Purple",
            "Yellow",
            "Cyan",
            "Blue",
            "Pink",
            "Orange",
            "Black",
            "White",
            "Random",
            "Chaos",
            "TrueChaos",
            "Silhouette",
            "Custom"});
            this.comboBox1.Location = new System.Drawing.Point(80, 20);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(93, 21);
            this.comboBox1.TabIndex = 10;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // comboBox2
            // 
            this.comboBox2.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Items.AddRange(new object[] {
            "Green",
            "Red",
            "Purple",
            "Yellow",
            "Cyan",
            "Blue",
            "Pink",
            "Orange",
            "Black",
            "White",
            "Random",
            "Chaos",
            "TrueChaos",
            "Silhouette",
            "Custom"});
            this.comboBox2.Location = new System.Drawing.Point(80, 51);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(93, 21);
            this.comboBox2.TabIndex = 32;
            this.comboBox2.SelectedIndexChanged += new System.EventHandler(this.comboBox2_SelectedIndexChanged);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(184, 23);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(80, 13);
            this.label7.TabIndex = 41;
            this.label7.Text = "Mario Trousers:";
            this.toolTip1.SetToolTip(this.label7, "This will change the color of Mario\'s Trousers.");
            // 
            // tabPage9
            // 
            this.tabPage9.Controls.Add(this.label15);
            this.tabPage9.Controls.Add(this.numericUpDown2);
            this.tabPage9.Controls.Add(this.checkBox48);
            this.tabPage9.Controls.Add(this.label14);
            this.tabPage9.Controls.Add(this.radioButton6);
            this.tabPage9.Controls.Add(this.radioButton7);
            this.tabPage9.Controls.Add(this.radioButton8);
            this.tabPage9.Controls.Add(this.checkBox25);
            this.tabPage9.Controls.Add(this.checkBox31);
            this.tabPage9.Location = new System.Drawing.Point(4, 22);
            this.tabPage9.Name = "tabPage9";
            this.tabPage9.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage9.Size = new System.Drawing.Size(378, 192);
            this.tabPage9.TabIndex = 7;
            this.tabPage9.Text = "Enemies";
            this.tabPage9.UseVisualStyleBackColor = true;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Location = new System.Drawing.Point(54, 106);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(68, 13);
            this.label15.TabIndex = 46;
            this.label15.Text = "XP Multiplier:";
            // 
            // numericUpDown2
            // 
            this.numericUpDown2.Location = new System.Drawing.Point(128, 104);
            this.numericUpDown2.Maximum = new decimal(new int[] {
            4,
            0,
            0,
            0});
            this.numericUpDown2.Name = "numericUpDown2";
            this.numericUpDown2.Size = new System.Drawing.Size(36, 20);
            this.numericUpDown2.TabIndex = 45;
            this.numericUpDown2.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            this.numericUpDown2.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.numericUpDown2.ValueChanged += new System.EventHandler(this.numericUpDown2_ValueChanged);
            // 
            // checkBox48
            // 
            this.checkBox48.AutoSize = true;
            this.checkBox48.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox48.Location = new System.Drawing.Point(52, 81);
            this.checkBox48.Name = "checkBox48";
            this.checkBox48.Size = new System.Drawing.Size(112, 17);
            this.checkBox48.TabIndex = 44;
            this.checkBox48.Text = "Tattle Enemy HP?";
            this.toolTip1.SetToolTip(this.checkBox48, "This will show you the current and max HP of all enemies and bosses.\r\nYou can see" +
        " it while you are hovering over the enemy to attack in the top left corner of th" +
        "e screen.");
            this.checkBox48.UseVisualStyleBackColor = true;
            this.checkBox48.CheckedChanged += new System.EventHandler(this.checkBox48_CheckedChanged);
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Location = new System.Drawing.Point(207, 19);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(103, 13);
            this.label14.TabIndex = 42;
            this.label14.Text = "Randomize Bosses?";
            // 
            // radioButton6
            // 
            this.radioButton6.AutoSize = true;
            this.radioButton6.Location = new System.Drawing.Point(209, 81);
            this.radioButton6.Name = "radioButton6";
            this.radioButton6.Size = new System.Drawing.Size(65, 17);
            this.radioButton6.TabIndex = 41;
            this.radioButton6.Text = "Random";
            this.toolTip1.SetToolTip(this.radioButton6, "Bosses can appear anywhere in the game including in normal fights.");
            this.radioButton6.UseVisualStyleBackColor = true;
            this.radioButton6.CheckedChanged += new System.EventHandler(this.radioButton6_CheckedChanged);
            // 
            // radioButton7
            // 
            this.radioButton7.AutoSize = true;
            this.radioButton7.Location = new System.Drawing.Point(209, 58);
            this.radioButton7.Name = "radioButton7";
            this.radioButton7.Size = new System.Drawing.Size(98, 17);
            this.radioButton7.TabIndex = 40;
            this.radioButton7.Text = "Boss < - > Boss";
            this.toolTip1.SetToolTip(this.radioButton7, "Bosses will only be randomized with other bosses.");
            this.radioButton7.UseVisualStyleBackColor = true;
            this.radioButton7.CheckedChanged += new System.EventHandler(this.radioButton7_CheckedChanged);
            // 
            // radioButton8
            // 
            this.radioButton8.AutoSize = true;
            this.radioButton8.Checked = true;
            this.radioButton8.Location = new System.Drawing.Point(209, 35);
            this.radioButton8.Name = "radioButton8";
            this.radioButton8.Size = new System.Drawing.Size(85, 17);
            this.radioButton8.TabIndex = 39;
            this.radioButton8.TabStop = true;
            this.radioButton8.Text = "Not Random";
            this.toolTip1.SetToolTip(this.radioButton8, "Bosses will not be randomized.");
            this.radioButton8.UseVisualStyleBackColor = true;
            this.radioButton8.CheckedChanged += new System.EventHandler(this.radioButton8_CheckedChanged);
            // 
            // checkBox25
            // 
            this.checkBox25.AutoSize = true;
            this.checkBox25.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox25.Location = new System.Drawing.Point(36, 35);
            this.checkBox25.Name = "checkBox25";
            this.checkBox25.Size = new System.Drawing.Size(128, 17);
            this.checkBox25.TabIndex = 29;
            this.checkBox25.Text = "Randomize Enemies?";
            this.toolTip1.SetToolTip(this.checkBox25, "Checking this will randomize all Enemies in the game.\r\nIt is recommended to use t" +
        "he stat scaling options as well, the game is very difficult without them.");
            this.checkBox25.UseVisualStyleBackColor = true;
            this.checkBox25.CheckedChanged += new System.EventHandler(this.checkBox25_CheckedChanged);
            // 
            // checkBox31
            // 
            this.checkBox31.AutoSize = true;
            this.checkBox31.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox31.Location = new System.Drawing.Point(43, 58);
            this.checkBox31.Name = "checkBox31";
            this.checkBox31.Size = new System.Drawing.Size(121, 17);
            this.checkBox31.TabIndex = 38;
            this.checkBox31.Text = "Scale Enemy Stats?";
            this.toolTip1.SetToolTip(this.checkBox31, "This will scale the HP, POW, DEF, and XP of all enemies and bosses to vanilla val" +
        "ues.");
            this.checkBox31.UseVisualStyleBackColor = true;
            this.checkBox31.CheckedChanged += new System.EventHandler(this.checkBox31_CheckedChanged);
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(158, 289);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(62, 13);
            this.label6.TabIndex = 37;
            this.label6.Text = "Seed Type:";
            this.label6.Click += new System.EventHandler(this.label6_Click);
            // 
            // radioButton5
            // 
            this.radioButton5.AutoSize = true;
            this.radioButton5.Location = new System.Drawing.Point(279, 288);
            this.radioButton5.Name = "radioButton5";
            this.radioButton5.Size = new System.Drawing.Size(51, 17);
            this.radioButton5.TabIndex = 36;
            this.radioButton5.TabStop = true;
            this.radioButton5.Text = "100%";
            this.toolTip1.SetToolTip(this.radioButton5, "This will make sure that the game is beatable and that every item in the game is " +
        "obtainable.");
            this.radioButton5.UseVisualStyleBackColor = true;
            this.radioButton5.CheckedChanged += new System.EventHandler(this.radioButton5_CheckedChanged);
            // 
            // radioButton4
            // 
            this.radioButton4.AutoSize = true;
            this.radioButton4.Checked = true;
            this.radioButton4.Location = new System.Drawing.Point(226, 288);
            this.radioButton4.Name = "radioButton4";
            this.radioButton4.Size = new System.Drawing.Size(51, 17);
            this.radioButton4.TabIndex = 35;
            this.radioButton4.TabStop = true;
            this.radioButton4.Text = "Any%";
            this.toolTip1.SetToolTip(this.radioButton4, "The game will check only that the game can be beaten. Some items may be unobtaina" +
        "ble.");
            this.radioButton4.UseVisualStyleBackColor = true;
            this.radioButton4.CheckedChanged += new System.EventHandler(this.radioButton4_CheckedChanged);
            // 
            // tabControl2
            // 
            this.tabControl2.Controls.Add(this.tabPage8);
            this.tabControl2.Location = new System.Drawing.Point(25, 34);
            this.tabControl2.Name = "tabControl2";
            this.tabControl2.SelectedIndex = 0;
            this.tabControl2.Size = new System.Drawing.Size(386, 216);
            this.tabControl2.TabIndex = 4;
            this.tabControl2.Visible = false;
            // 
            // tabPage8
            // 
            this.tabPage8.Controls.Add(this.checkBox35);
            this.tabPage8.Location = new System.Drawing.Point(4, 22);
            this.tabPage8.Name = "tabPage8";
            this.tabPage8.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage8.Size = new System.Drawing.Size(378, 190);
            this.tabPage8.TabIndex = 1;
            this.tabPage8.Text = "Items";
            this.tabPage8.UseVisualStyleBackColor = true;
            // 
            // checkBox35
            // 
            this.checkBox35.AutoSize = true;
            this.checkBox35.CheckAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.checkBox35.Checked = true;
            this.checkBox35.CheckState = System.Windows.Forms.CheckState.Checked;
            this.checkBox35.Location = new System.Drawing.Point(9, 17);
            this.checkBox35.Name = "checkBox35";
            this.checkBox35.Size = new System.Drawing.Size(76, 17);
            this.checkBox35.TabIndex = 0;
            this.checkBox35.Text = "Everything";
            this.checkBox35.UseVisualStyleBackColor = true;
            this.checkBox35.CheckedChanged += new System.EventHandler(this.checkBox35_CheckedChanged);
            // 
            // saveFileDialog2
            // 
            this.saveFileDialog2.DefaultExt = "nds";
            this.saveFileDialog2.Filter = "Nintendo DS Rom (*.nds)|*.nds|All files (*.*)|*.*";
            this.saveFileDialog2.FileOk += new System.ComponentModel.CancelEventHandler(this.saveFileDialog2_FileOk);
            // 
            // button6
            // 
            this.button6.Location = new System.Drawing.Point(109, 259);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(97, 23);
            this.button6.TabIndex = 10;
            this.button6.Text = "Save Settings...";
            this.toolTip1.SetToolTip(this.button6, "Save a settings config.");
            this.button6.UseVisualStyleBackColor = true;
            this.button6.Click += new System.EventHandler(this.button6_Click);
            // 
            // button7
            // 
            this.button7.Location = new System.Drawing.Point(12, 259);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(91, 23);
            this.button7.TabIndex = 11;
            this.button7.Text = "Load Settings...";
            this.toolTip1.SetToolTip(this.button7, "Load a settings config.");
            this.button7.UseVisualStyleBackColor = true;
            this.button7.Click += new System.EventHandler(this.button7_Click);
            // 
            // openFileDialog2
            // 
            this.openFileDialog2.FileName = "openFileDialog2";
            this.openFileDialog2.FileOk += new System.ComponentModel.CancelEventHandler(this.openFileDialog2_FileOk);
            // 
            // saveFileDialog3
            // 
            this.saveFileDialog3.DefaultExt = "txt";
            this.saveFileDialog3.Filter = "Text File (*.txt)|*.txt|All files (*.*)|*.*";
            this.saveFileDialog3.FileOk += new System.ComponentModel.CancelEventHandler(this.saveFileDialog2_FileOk);
            // 
            // checkBox49
            // 
            this.checkBox49.AutoSize = true;
            this.checkBox49.Location = new System.Drawing.Point(12, 288);
            this.checkBox49.Name = "checkBox49";
            this.checkBox49.Size = new System.Drawing.Size(140, 17);
            this.checkBox49.TabIndex = 12;
            this.checkBox49.Text = "Randomize All Settings?";
            this.toolTip1.SetToolTip(this.checkBox49, "Checking this will randomize all settings when you click Rnandomize.");
            this.checkBox49.UseVisualStyleBackColor = true;
            this.checkBox49.CheckedChanged += new System.EventHandler(this.checkBox49_CheckedChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(430, 314);
            this.Controls.Add(this.checkBox49);
            this.Controls.Add(this.button7);
            this.Controls.Add(this.button6);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.SeedTextbox);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.radioButton5);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.radioButton4);
            this.Controls.Add(this.SelectRomButton);
            this.Controls.Add(this.Colors);
            this.Controls.Add(this.tabControl2);
            this.Name = "Form1";
            this.Text = "MLSS Randomizer";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.Colors.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.tabPage4.ResumeLayout(false);
            this.tabPage4.PerformLayout();
            this.tabPage6.ResumeLayout(false);
            this.tabPage6.PerformLayout();
            this.tabPage5.ResumeLayout(false);
            this.tabPage5.PerformLayout();
            this.tabPage7.ResumeLayout(false);
            this.tabPage7.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown3)).EndInit();
            this.tabPage9.ResumeLayout(false);
            this.tabPage9.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.statCountBindingSource)).EndInit();
            this.tabControl2.ResumeLayout(false);
            this.tabPage8.ResumeLayout(false);
            this.tabPage8.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.form1BindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.form1BindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.romBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private Button SelectRomButton;
        private TextBox textBox1;
        private Label label1;
        private Button button2;
        private DirectorySearcher directorySearcher1;
        private FolderBrowserDialog folderBrowserDialog1;
        private OpenFileDialog openFileDialog1;
        private TextBox SeedTextbox;
        private Label label2;
        private SaveFileDialog saveFileDialog1;
        private TabControl Colors;
        private TabPage tabPage1;
        private TabPage tabPage2;
        private CheckBox checkBox18;
        private CheckBox checkBox10;
        private CheckBox checkBox9;
        private CheckBox checkBox8;
        private CheckBox checkBox7;
        private CheckBox checkBox6;
        private CheckBox checkBox5;
        private CheckBox checkBox4;
        private CheckBox checkBox3;
        private CheckBox checkBox2;
        private CheckBox checkBox17;
        private CheckBox checkBox16;
        private CheckBox checkBox15;
        private CheckBox checkBox14;
        private CheckBox checkBox13;
        private CheckBox checkBox12;
        private CheckBox checkBox11;
        private CheckBox checkBox19;
        private CheckBox checkBox21;
        private CheckBox checkBox20;
        private TabPage tabPage3;
        private CheckBox checkBox22;
        private RadioButton radioButton1;
        private Label label3;
        private RadioButton radioButton3;
        private RadioButton radioButton2;
        private TabPage tabPage4;
        private TabPage tabPage5;
        private CheckBox checkBox23;
        private CheckBox checkBox24;
        private CheckBox checkBox25;
        private TabPage tabPage6;
        private CheckBox checkBox26;
        private CheckBox checkBox28;
        private CheckBox checkBox27;
        private CheckBox checkBox29;
        private CheckBox checkBox30;
        private ComboBox comboBox2;
        private ComboBox comboBox1;
        private BindingSource form1BindingSource;
        private BindingSource form1BindingSource1;
        private BindingSource romBindingSource;
        private BindingSource statCountBindingSource;
        private Label label5;
        private Label label4;
        private RadioButton radioButton5;
        private RadioButton radioButton4;
        private Label label6;
        private CheckBox checkBox31;
        private CheckBox checkBox32;
        private CheckBox checkBox34;
        private ComboBox comboBox3;
        private Label label7;
        private Label label8;
        private ComboBox comboBox4;
        private TabControl tabControl2;
        private TabPage tabPage8;
        private CheckBox checkBox35;
        private SaveFileDialog saveFileDialog2;
        private Panel panel1;
        private TabPage tabPage7;
        private Label label9;
        private Label label11;
        private Label label10;
        private Label label12;
        private Label label13;
        private NumericUpDown numericUpDown4;
        private NumericUpDown numericUpDown1;
        private NumericUpDown numericUpDown3;
        private Button button5;
        private Button button4;
        private Button button3;
        private Button button1;
        private CheckBox checkBox36;
        private Button button6;
        private Button button7;
        private OpenFileDialog openFileDialog2;
        private SaveFileDialog saveFileDialog3;
        private TabPage tabPage9;
        private Label label14;
        private RadioButton radioButton6;
        private RadioButton radioButton7;
        private RadioButton radioButton8;
        private CheckBox checkBox33;
        private CheckBox checkBox37;
        private CheckBox checkBox38;
        private CheckBox checkBox39;
        private CheckBox checkBox43;
        private CheckBox checkBox45;
        private CheckBox checkBox44;
        private CheckBox checkBox46;
        private ToolTip toolTip1;
        private CheckBox checkBox47;
        private CheckBox checkBox48;
        private CheckBox checkBox49;
        private CheckBox checkBox50;
        private CheckBox checkBox51;
        private CheckBox checkBox52;
        private NumericUpDown numericUpDown2;
        private Label label15;
    }
}

