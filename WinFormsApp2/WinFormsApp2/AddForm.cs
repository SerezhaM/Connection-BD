using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace WinFormsApp2
{
    public partial class AddForm : Form
    {
        DB db = new DB();

        public AddForm()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            db.openConnection();

            var content = textBox_name.Text;
            var sender1 = textBox_last.Text;
            var chat = textBox_middle.Text;

            var addQuary = $"insert into message (`message_content`, `message_sender_id`, `message_chat_id`) values ('{content}','{sender1}','{chat}')";

            var command = new MySqlCommand(addQuary, db.getConnection());
            command.ExecuteNonQuery();

            MessageBox.Show("Успех");

            db.closeConnection();

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }
    }
}
