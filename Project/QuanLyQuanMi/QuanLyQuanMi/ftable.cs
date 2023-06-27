using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using QuanLyQuanMi.DAO;
using QuanLyQuanMi.DTO;
using System.Globalization;
using static QuanLyQuanMi.fprofile;

namespace QuanLyQuanMi
{
    public partial class ftable : Form
    {
        private Account loginAccount;

        public Account LoginAccount
        {
            get
            {
                return loginAccount;
            }

            set
            {
                loginAccount = value;
              
            }
        }

        public ftable(Account acc)
        {
            InitializeComponent();
            this.loginAccount = acc;
            ChangeAccount(loginAccount.Type);
            LoadTable();
            LoadCategory();
            LoadEmployeesIntoCombobox(comboBox3);
        }
        
        #region Void
        
        void LoadTable()
        {
         flowLayoutPanel1.Controls.Clear();
         List<Table> tableList = TableDAO.Instance.LoadTableList();
            foreach (Table item in tableList)
            {
                Button btn = new Button() { Width = TableDAO.TableWidth, Height = TableDAO.TableHeight };
                btn.Text = item.Name + Environment.NewLine + item.Status;
                btn.Click += Btn_Click;
                btn.Tag = item;
                switch (item.Status) {
                    case "Trống":
                        btn.BackColor = Color.White;
                        break;
                    default:
                        btn.BackColor = Color.Red;
                        break;
                }
                
                flowLayoutPanel1.Controls.Add(btn);
            }
            
        }

        void ChangeAccount(int type) // Phân quyền Admin và nhân viên
        {
            adminToolStripMenuItem.Enabled = type == 1; 
            thôngTinTàiKhoảnToolStripMenuItem.Text += "(" + loginAccount.DisplayName + ")";
        }

        void LoadCategory() // Load tất cả danh mục lên combobox
        {
            List<Category> listcategory = CategoryDAO.Instance.GetListCategory();
            comboBox1.DataSource = listcategory;
            comboBox1.DisplayMember = "name";
        }

        void LoadFoodList(int id) // Load danh sách món ăn lên combobox 
        {
            List<Food> listfood = FoodDAO.Instance.GetFoodByCategoryID(id);
            comboBox2.DataSource = listfood;
            comboBox2.DisplayMember = "name";
        }

        void ShowBill(int id) // Hiển thị Bill lên listView
        {
            listView1.Items.Clear();
            List<DTO.Menu> listBillInfo = MenuDAO.Instance.GetListMenuByTable(id);
            float totalprice = 0;
            foreach (DTO.Menu item in listBillInfo)
            {
                ListViewItem lsvItem = new ListViewItem(item.Foodname.ToString());
                lsvItem.SubItems.Add(item.Count.ToString());
                lsvItem.SubItems.Add(item.Price.ToString());
                lsvItem.SubItems.Add(item.TotalPrice1.ToString());
                totalprice += item.TotalPrice1;
                listView1.Items.Add(lsvItem);
            }
            CultureInfo culture = new CultureInfo("vi-VN");
            textBox1.Text = totalprice.ToString("c",culture);
            
        }

        void LoadEmployeesIntoCombobox(ComboBox cb) // Load tất cả nhân viên lên combobox
        {
            cb.DataSource = EmployeesDAO.Instance.GetListEmployees();
            cb.DisplayMember = "Name";
        }

        void f_UpdateAccount(object sender, AccountEvent e) // Hiện thông tin hiển thị khi đăng nhập
        {
            thôngTinTàiKhoảnToolStripMenuItem.Text = "Thông tin tài khoản (  " + e.Acc.DisplayName + " )";
        }
     
        void f_UpdateFood(object sender, EventArgs e) 
        {
            LoadFoodListByCategoryID((comboBox1.SelectedItem as Category).ID);
            if (listView1.Tag != null)
                ShowBill((listView1.Tag as Table).ID);
        }

        void f_DeleteFood(object sender, EventArgs e)
        {
            LoadFoodListByCategoryID((comboBox1.SelectedItem as Category).ID);
            if (listView1.Tag != null)
                ShowBill((listView1.Tag as Table).ID);
            LoadTable();
        }

        void f_InsertFood(object sender, EventArgs e)
        {
            LoadFoodListByCategoryID((comboBox1.SelectedItem as Category).ID);
            if (listView1.Tag != null)
                ShowBill((listView1.Tag as Table).ID);
        }

        void LoadFoodListByCategoryID(int id)  //  Load danh sách món ăn lên combobox theo danh mục
        {
            List<Food> listFood = FoodDAO.Instance.GetFoodByCategoryID(id);
            comboBox2.DataSource = listFood;
            comboBox2.DisplayMember = "Name";
        }
        #endregion

        #region Private

        private void ftable_Load(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e) // Lấy ID danh mục trên combobox
        {
            int id = 0;
            ComboBox cb = sender as ComboBox;
            if (cb.SelectedItem == null)
                return;
            Category selected = cb.SelectedItem as Category;
            id = selected.ID;
            LoadFoodList(id);
        }

        private void thanhToánToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BtThanhToan_Click(this, new EventArgs());

        }

        private void thêmMónToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ThemMon_Click(this, new EventArgs());
        }

        private void Btn_Click(object sender, EventArgs e)
        {
            int tableID = ((sender as Button).Tag as Table).ID;
            listView1.Tag = (sender as Button).Tag;
            ShowBill(tableID);
        }

        private void ThemMon_Click(object sender, EventArgs e) // Button thêm món vào hóa đơn
        {
            Table table = listView1.Tag as Table;
            if (table == null)
            {
                MessageBox.Show("Hãy chọn bàn");
                return;
            }
            int idBill = BillDAO.Instance.GetUncheckBillIDByTableID(table.ID);
            int foodID = (comboBox2.SelectedItem as Food).ID;
            int count = (int)UDFoodcount.Value;
            int idemployees = (comboBox3.SelectedItem as Employees).Id;

            if (idBill == -1)
            {
                BillDAO.Instance.InsertBill(table.ID, idemployees);
                BillInfoDAO.Instance.InsertBillInfo(BillDAO.Instance.GetMaxBill(), foodID, count);
            }
            else
            {
                BillInfoDAO.Instance.InsertBillInfo(idBill, foodID, count);
            }
            ShowBill(table.ID);
            LoadTable();
        }

        private void BtThanhToan_Click(object sender, EventArgs e) // Button thanh toán
        {
            Table table = listView1.Tag as Table;
            int idBill = BillDAO.Instance.GetUncheckBillIDByTableID(table.ID);
            int discount = (int)UDGiamGia.Value;

            double receive = Convert.ToDouble(textBox2.Text);


            //double totalPrice = Convert.ToDouble(textBox1.Text.Split(',')[0].Replace(".", ""));
            double finalTotalPrice = Convert.ToDouble(textBox1.Text.Split(',')[0].Replace(".", ""));
            double change = receive - finalTotalPrice;
            if (receive < finalTotalPrice)
            {
                MessageBox.Show("Số tiền nhận không đủ!");
            }
            else
            {
                if (idBill != -1)
                {
                    if (MessageBox.Show(string.Format("Bạn muốn thực hiện thanh toán cho bàn {0}? \n Tiền nhận: {1} \n Tổng tiền: {2} \n Giảm giá: {3} % \n Tiền thừa: {4}", table.Name, receive, finalTotalPrice, discount, change), "Thông báo", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
                    {
                        BillDAO.Instance.CheckOut(idBill, discount, (float)finalTotalPrice);
                        ShowBill(table.ID);
                        LoadTable();
                        textBox2.Text = 0.ToString();
                    }
                }
            }
        }

        private void BtGiamGia_Click(object sender, EventArgs e) // Button giảm giá
        {
            int giamgia = (int)UDGiamGia.Value;
            int totalprice = Convert.ToInt32(textBox1.Text.Split(',')[0].Replace(".", ""));
            int temp = totalprice;
            CultureInfo culture = new CultureInfo("vi-VN");
            textBox1.Text = (totalprice - ((totalprice / 100) * giamgia)).ToString("c", culture);
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            flogin f = new flogin();
            f.Show();

        } // Đăng xuất

        private void thôngTinCáNhânToolStripMenuItem_Click(object sender, EventArgs e) // Thông tin cá nhân
        {
            fprofile f = new fprofile(loginAccount);
            f.UpdateAccounT += f_UpdateAccount;
            f.ShowDialog();
        }

        private void adminToolStripMenuItem_Click(object sender, EventArgs e) // Open Form Quản lý
        {
            fquanly f = new fquanly();
            f.InsertFood += f_InsertFood;
            f.UpdateFood += f_UpdateFood;
            f.DeleteFood += f_DeleteFood;
            f.ShowDialog();
        }

        private void nhậpHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            fnhaphang f = new fnhaphang();
            f.ShowDialog();
        }
        #endregion


    }
}

