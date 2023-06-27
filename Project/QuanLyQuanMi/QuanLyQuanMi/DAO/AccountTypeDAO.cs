using QuanLyQuanMi.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DAO
{
    public class AccountTypeDAO
    {
        private static AccountTypeDAO instance;

        public static AccountTypeDAO Instance
        {
            get { if (instance == null) instance = new AccountTypeDAO(); return AccountTypeDAO.instance; }
            private set { AccountTypeDAO.instance = value; }
        }

        private AccountTypeDAO() { }

        public List<AccountType> GetListType() // Lấy danh sách quyền
        {
            List<AccountType> list = new List<AccountType>();

            string query = "select * from AccountType";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                AccountType type = new AccountType(item);
                list.Add(type);
            }

            return list;
        }

        public AccountType GetAccountByType(int type) // lấy tài khoản theo quyền đăng nhập
        {
            AccountType acc = null;

            string query = "select * from AccountType where type = " + type;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                acc = new AccountType(item);
                return acc;
            }

            return acc;
        }
    }
}
