using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DTO
{
    public class PhieuNhap
    {
        public PhieuNhap(int mapn, int idnv, DateTime? ngaynhap)
        {
            this.mapn = mapn;
            this.idnv = idnv;
            this.ngaynhap = ngaynhap;
        }
        public PhieuNhap(DataRow row)
        {
            this.mapn = (int)row["mapn"];
            this.idnv = (int)row["idnhanvien"];
            var ngayNhapTemp = row["ngaynhap"];
            if (ngayNhapTemp.ToString() != "")
                this.ngaynhap = (DateTime?)ngayNhapTemp;
        }
        private int mapn;
        private int idnv;
        private DateTime? ngaynhap;
        public int Idnv
        {
            get
            {
                return idnv;
            }

            set
            {
                idnv = value;
            }
        }

        public DateTime? Ngaynhap
        {
            get
            {
                return ngaynhap;
            }

            set
            {
                ngaynhap = value;
            }
        }

        public int Mapn
        {
            get
            {
                return mapn;
            }

            set
            {
                mapn = value;
            }
        }
    }
}
