using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DTO
{
    public class Ctpn
    {
        public Ctpn(int mactpn, int mapn, int masp, int sl, string dvt, int dongia)
        {
            this.id = mactpn;
            this.Ma_PN = mapn;
            this.Ma_SP = masp;
            this.SL = sl;
            this.DVT = dvt;
            this.DonGia = dongia;
        }
        public Ctpn(DataRow row)
        {
            this.id = (int)row["mactpn"];
            this.Ma_PN = (int)row["mapn"];
            this.Ma_SP = (int)row["masp"];
            this.SL = (int)row["sl"];
            this.DVT = row["dvt"].ToString();
            this.DonGia = (int)row["dongia"];
        }

        private int id;
        private int Ma_PN;
        private int Ma_SP;
        private int SL;
        private string DVT;
        private int DonGia;

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public int Ma_PN1
        {
            get
            {
                return Ma_PN;
            }

            set
            {
                Ma_PN = value;
            }
        }

        public int Ma_SP1
        {
            get
            {
                return Ma_SP;
            }

            set
            {
                Ma_SP = value;
            }
        }

        public int SL1
        {
            get
            {
                return SL;
            }

            set
            {
                SL = value;
            }
        }

        public string DVT1
        {
            get
            {
                return DVT;
            }

            set
            {
                DVT = value;
            }
        }

        public int DonGia1
        {
            get
            {
                return DonGia;
            }

            set
            {
                DonGia = value;
            }
        }
    }
}
