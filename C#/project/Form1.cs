using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MTA_SDK; 

namespace project
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MTA server = new MTA("localhost", 22003, "username", "Passworld");
            MTA_LuaArgs luaArgs = new MTA_LuaArgs("" + textBox1.Text + "", "" + textBox2.Text + "", "" + textBox3.Text + "","" + textBox4.Text + "");
            string returned = server.CallFunction("send", "outputmsgs", luaArgs);
        }
    }
}
