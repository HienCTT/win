using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DAO
{
    public class PhieuNhapDAO
    {
        private static PhieuNhapDAO instance;

        public static PhieuNhapDAO Instance
        {
            get { if (instance == null) instance = new PhieuNhapDAO(); return PhieuNhapDAO.instance; }
            private set { PhieuNhapDAO.instance = value; }
        }
        private PhieuNhapDAO() { }


        public DataTable GetPhieuNhapList() // Lấy tất cả thông tin phiếu nhập
        {
            return DataProvider.Instance.ExecuteQuery("exec USP_GetListPhieuNhap");
        }

        public bool InsertPhieuNhap(int idnv, DateTime? ngaynhap)  // thêm phiếu nhập
        {
            string query = string.Format("INSERT PhieuNhap ( idnhanvien, ngaynhap )VALUES  ( {0} , '{1}')", idnv, ngaynhap);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool DeletePhieuNhap(int id)  // Xóa phiếu nhập
        {
            string query = string.Format("Delete PhieuNhap where mapn = {0}", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public int GetMaxId() // Lấy ID lớn nhất
        {
            try
            {
                return (int)DataProvider.Instance.ExecuteScalar("select max(mapn) from PhieuNhap");
            }
            catch
            {
                return 1;
            }
        }
    }
}
