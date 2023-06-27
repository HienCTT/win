using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DAO
{
    public class CtpnDAO
    {
        private static CtpnDAO instance;

        public static CtpnDAO Instance
        {
            get { if (instance == null) instance = new CtpnDAO(); return CtpnDAO.instance; }
            private set { CtpnDAO.instance = value; }
        }
        private CtpnDAO() { }


        public DataTable Get_CTPN_List(int mapn) // Lấy tất cả thông tin phiếu nhập
        {
            return DataProvider.Instance.ExecuteQuery("exec USP_GetListCTPHPhieuNhap @mapn", new object[] { mapn });
        }

        public bool Delete_CTPN(int id)  // Xóa chi tiet phiếu nhập theo mã phiếu nhập
        {
            string query = string.Format("Delete Ctpn where Ma_PN = {0}", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool Insert_CT_PhieuNhap(int mapn ,int sp, int sl, string dvt, int dongia)  // thêm chi tiet phiếu nhập
        {
            string query = string.Format("INSERT Ctpn ( Ma_PN, Ma_SP ,SL , DVT , DonGia )VALUES  ( {0} , {1} , {2} , N'{3}' , {4})", mapn, sp, sl , dvt , dongia);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool UpdateCTHD(int mapn, int sp, int sl, string dvt, int dongia) // Cập nhật chi tiết phiếu nhập
        {
            string query = string.Format("UPDATE Ctpn SET Ma_PN = {0} , Ma_SP = {1} , SL = {2} , DVT = N'{3}' , DonGia = {4}", mapn , sp , sl , dvt , dongia);
            int result = DataProvider.Instance.ExecuteNonQuery(query);
            return result > 0;
        }
    }
}
