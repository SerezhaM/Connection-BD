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
    enum RowState
    {
        Existed,
        New,
        Modified,
        ModifiedNew,
        Deleted
    }

    public partial class DataForm : Form
    {
        DB db = new DB();

        public DataForm()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("message_id", "id");
            dataGridView1.Columns.Add("flag", "Флаг на удаление");
            dataGridView1.Columns.Add("date", "Дата");
            dataGridView1.Columns.Add("content", "Сообщение");
            dataGridView1.Columns.Add("sender", "Отправитель");
            dataGridView1.Columns.Add("chat", "ID чата");
            dataGridView1.Columns.Add("IsNew", String.Empty);
        }

       public void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {
            dgw.Rows.Add(record.GetInt32(0), record.GetString(1), record.GetString(2), record.GetString(3), record.GetString(4), record.GetString(5), RowState.ModifiedNew);
        }

        public void RefreshDataGrid(DataGridView dgw)
        {

            string queryString = $"select distinct * from message";

            MySqlCommand command = new MySqlCommand(queryString, db.getConnection());

            db.openConnection();
            MySqlDataReader reader = command.ExecuteReader();

            while(reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }    
            reader.Close();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Update1();
        }

        private void DataForm_Load(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);

        }

        private void newbtn_Click(object sender, EventArgs e)
        {
            AddForm addForm = new AddForm();
            addForm.Show();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            RefreshDataGrid(dataGridView1);
        }

        private void deleteRow()
        {
            int index = dataGridView1.CurrentCell.RowIndex;

            dataGridView1.Rows[index].Visible = false;

            if (dataGridView1.Rows[index].Cells[0].Value.ToString() == string.Empty)
            {
                dataGridView1.Rows[index].Cells[5].Value = RowState.Deleted;
            }
        }

        private void Update1()
        {
            db.openConnection();

            for (int index = 0; index < dataGridView1.Rows.Count; index++)
            {
                var temp = (RowState)dataGridView1.Rows[index].Cells[0].Value;

                if (temp == RowState.Existed)
                    continue;

                if (temp == RowState.Deleted)
                {
                    var id = Convert.ToInt32(dataGridView1.Rows[index].Cells[0].Value);
                    var deleteq = $"delete from message where message_id = {id}";

                    var command = new MySqlCommand(deleteq, db.getConnection());
                    command.ExecuteNonQuery();
                }
            }
            db.closeConnection();
        }

        private void delbtn_Click(object sender, EventArgs e)
        {
            deleteRow();
        }
    }
}
