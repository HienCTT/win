using QuanLyQuanMi.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DAO
{
    public class KhoDAO
    {
        private static KhoDAO instance;

        public static KhoDAO Instance
        {
            get { if (instance == null) instance = new KhoDAO(); return instance; }
            private set { instance = value; }
        }

        private KhoDAO() { }

        public List<Kho> GetList_Sp() // lấy danh sách sản phẩm từ DB
        {
            List<Kho> list = new List<Kho>();

            string query = "select *  from Kho";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Kho kho = new Kho(item);
                list.Add(kho);
            }

            return list;
        }

        public Kho GetTensp(int id) // lấy sản phẩm theo ID
        {
            Kho sp = null;

            string query = "select * from Kho where masp = " + id;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                sp = new Kho(item);
                return sp;
            }

            return sp;
        }

    }
}
