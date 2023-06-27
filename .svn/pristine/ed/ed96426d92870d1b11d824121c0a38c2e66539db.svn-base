using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyQuanMi
{
    public partial class freport : Form
    {
        public freport(DateTime In, DateTime Out)
        {
            InitializeComponent();
            this.Date1 = In;
            this.Date2 = Out;
        }
        private DateTime Date1;
        private DateTime Date2;

        public DateTime Date11
        {
            get
            {
                return Date1;
            }

            set
            {
                Date1 = value;
            }
        }

        public DateTime Date21
        {
            get
            {
                return Date2;
            }

            set
            {
                Date2 = value;
            }
        }

        private void freport_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'QuanLyMiKhoDataSet1.USP_GetListBillDateForReport' table. You can move, or remove it, as needed.
            this.USP_GetListBillDateForReportTableAdapter.Fill(this.QuanLyMiKhoDataSet1.USP_GetListBillDateForReport,Date11, Date21);
            this.reportViewer1.RefreshReport();

        }

        private void reportViewer1_Load(object sender, EventArgs e)
        {

        }
    }
}
