using QuanLyQuanMi.DAO;
using QuanLyQuanMi.DTO;
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
    public partial class fprofile : Form
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
                changeAccount(loginAccount);
            }
        }
        public fprofile(Account acc)
        {
            InitializeComponent();
            LoginAccount = acc;
        }
        void changeAccount(Account acc)
        {
            tb1.Text = loginAccount.UserName;
            tb2.Text = loginAccount.DisplayName;
        }
        private void fprofile_Load(object sender, EventArgs e)
        {

        }
        private event EventHandler<AccountEvent> updateAccount;
        public event EventHandler<AccountEvent> UpdateAccounT
        {
            add { updateAccount += value; }
            remove { updateAccount -= value; }
        }
        void UpdateAccount() // Cập nhật thông tin cá nhân
        {
            String userName = tb1.Text;
            String displayName = tb2.Text;
            String password = tb3.Text;
            String newPass = textBox1.Text;
            String repass = textBox2.Text;

            if (!newPass.Equals(repass))
            {
                MessageBox.Show("Vui lòng nhập lại mật khẩu giống mật khẩu mới!!");
            }
            else
            {
                if (AccountDAO.Instance.UpdateAccount(userName, displayName, password, newPass))
                {
                    MessageBox.Show("Cập nhật thành công");
                    if (updateAccount!= null)
                    {
                        updateAccount(this,new AccountEvent( AccountDAO.Instance.GetAccountByUserName(userName)));
                    }
                }
                else
                {
                    MessageBox.Show("Vui lòng điền đúng mật khẩu");
                }
            }
        }
        
        private void button1_Click(object sender, EventArgs e)
        {
            UpdateAccount();
        }
        public class AccountEvent:EventArgs
        {
            private Account acc;

            public Account Acc
            {
                get
                {
                    return acc;
                }

                set
                {
                    acc = value;
                }
            }

            public AccountEvent(Account acc)
            {
                this.acc = acc;
            }
        }
    }
}
