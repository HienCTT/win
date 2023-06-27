using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DTO
{
    public class Kho
    {
        public Kho(int masp, string tensp, string dvt, int sl)
        {
            this.masp = masp;
            this.tensp = tensp;
            this.dvt = dvt;
            this.sl = sl;
        }
        public Kho(DataRow row)
        {
            this.masp = (int)row["masp"];
            this.tensp = row["tensp"].ToString();
            this.dvt = row["dvt"].ToString();
            this.sl = (int)row["sl"];
        }

        private int masp;
        private string tensp;
        private string dvt;
        private int sl;

        public int Masp
        {
            get
            {
                return masp;
            }

            set
            {
                masp = value;
            }
        }

        public string Tensp
        {
            get
            {
                return tensp;
            }

            set
            {
                tensp = value;
            }
        }

        public string Dvt
        {
            get
            {
                return dvt;
            }

            set
            {
                dvt = value;
            }
        }

        public int Sl
        {
            get
            {
                return sl;
            }

            set
            {
                sl = value;
            }
        }
    }
}
