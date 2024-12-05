using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace B211200558_AuroraCo_Login
{
    public partial class Rapor : Form
    {
        public Rapor()
        {
            InitializeComponent();
        }


        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Rapor_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                // Create a connection to your SQL Server database
                string connectionString = @"Data Source=LAPTOP-7DH2ONM1;Initial Catalog=AuroraSkincare;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Define your SQL query
                    string selectQuery = "SELECT TOP 3\r\n    e.EmployeeID,\r\n    e.FirstName + ' ' + e.LastName AS EmployeeName,\r\n    SUM(s.SalePrice) AS TotalSalesAmount\r\nFROM\r\n    Employees e\r\nJOIN\r\n    Sales s ON e.EmployeeID = s.EmployeeID\r\nGROUP BY\r\n    e.EmployeeID, e.FirstName, e.LastName\r\nORDER BY\r\n    TotalSalesAmount DESC;\r\n"; // Corrected query

                    // Create a data adapter and fill a DataTable
                    SqlDataAdapter dataAdapter = new SqlDataAdapter(selectQuery, connection);
                    DataTable table = new DataTable();
                    dataAdapter.Fill(table);

                    // Bind the DataTable to the DataGridView
                    dataGridView1.DataSource = table;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                // Create a connection to your SQL Server database
                string connectionString = @"Data Source=LAPTOP-7DH2ONM1;Initial Catalog=AuroraSkincare;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Define your second SQL query
                    string selectQuery2 = "SELECT TOP 3\r\n    p.ProductID,\r\n    p.Name AS ProductName,\r\n    SUM(s.Quantity) AS TotalQuantitySold\r\nFROM\r\n    Products p\r\nJOIN\r\n    Sales s ON p.ProductID = s.ProductID\r\nGROUP BY\r\n    p.ProductID, p.Name\r\nORDER BY\r\n    TotalQuantitySold DESC;\r\n";

                    // Create a data adapter and fill a DataTable
                    SqlDataAdapter dataAdapter2 = new SqlDataAdapter(selectQuery2, connection);
                    DataTable table2 = new DataTable();
                    dataAdapter2.Fill(table2);

                    // Bind the DataTable to the DataGridView
                    dataGridView1.DataSource = table2;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                // Create a connection to your SQL Server database
                string connectionString = @"Data Source=LAPTOP-7DH2ONM1;Initial Catalog=AuroraSkincare;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Define your second SQL query
                    string selectQuery3 = "SELECT TOP 3\r\n    c.CountryName,\r\n    SUM(o.TotalAmount) AS TotalShippingAmount\r\nFROM\r\n    Countries c\r\nJOIN\r\n    Orders o ON c.CountryID = o.CountryID\r\nGROUP BY\r\n    c.CountryName\r\nORDER BY\r\n    TotalShippingAmount DESC;\r\n";

                    // Create a data adapter and fill a DataTable
                    SqlDataAdapter dataAdapter2 = new SqlDataAdapter(selectQuery3, connection);
                    DataTable table2 = new DataTable();
                    dataAdapter2.Fill(table2);

                    // Bind the DataTable to the DataGridView
                    dataGridView1.DataSource = table2;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }
    }
}
