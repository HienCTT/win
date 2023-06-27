using QuanLyQuanMi.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DAO
{
    public class BillDAO
    {
        private static BillDAO instance;

        public static BillDAO Instance
        {
            get { if (instance == null) instance = new BillDAO(); return BillDAO.instance; }
            private set { BillDAO.instance = value; }
        }
        private BillDAO() { }
        /// <summary>
        /// Thành công: bill ID
        /// thất bại: -1
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int GetUncheckBillIDByTableID(int id)
        {
            DataTable data = DataProvider.Instance.ExecuteQuery("SELECT * FROM dbo.Bill WHERE idTable = " + id + " AND status = 0");

            if (data.Rows.Count > 0)
            {
                Bill bill = new Bill(data.Rows[0]);
                return bill.ID;
            }
            return -1;
        }

        public void InsertBill(int id, int idemp) // Thêm Bill
        {
            DataProvider.Instance.ExecuteNonQuery("USP_InsertBill @idTable , @idEmployees", new object[]{id , idemp});
        }

        public int GetMaxBill() // Lấy ID bill lớn nhất
        {
            try
            {
                return (int)DataProvider.Instance.ExecuteScalar("select max(id) from Bill");
            }
            catch
            {
                return 1;
            }  
        }

        public void CheckOut(int id, int discount, float totalPrice) // cập nhật thông tin đã checkout trong bill
        {
            string query = "update Bill set DateCheckOut = getDate(), status = 1, " + "discount = " + discount + ", totalPrice = " +totalPrice+ " where id ="+id;
            DataProvider.Instance.ExecuteNonQuery(query);
        }

        public DataTable GetBillListByDate(DateTime checkIn, DateTime checkOut) // Lấy thông tin bill theo ngày
        {
            return DataProvider.Instance.ExecuteQuery("exec USP_GetListBillDate @checkIn , @checkOut", new object[]{checkIn, checkOut });
        }
    }
}
