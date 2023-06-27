using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DTO
{
    public class Employees
    {
        public Employees(int id, string name, string gender, int position, string sdt, DateTime? dayin, int totaltime, int totalsalary)
        {
            this.id = id;
            this.name = name;
            this.gender = gender;
            this.position = position;
            this.sdt = sdt;
            this.dayin = dayin;
            this.totaltime = totaltime;
            this.totalsalary = totalsalary;
        }
        public Employees(DataRow row)
        {
            this.id = (int)row["id"];
            this.name = row["name"].ToString();
            this.gender = row["gender"].ToString();
            this.position =(int)row["position"];
            this.sdt = row["sdt"].ToString();
            var dayintemp = row["dayin"];
            if (dayintemp.ToString() != "")
                this.dayin = (DateTime?)dayintemp;

            this.totaltime = (int)row["totaltime"];
            this.totalsalary = (int)row["totalsalary"];
        }
        private int id;
        private string name;
        private string gender;
        private int position;
        private string sdt;
        private DateTime? dayin;
        private int totaltime;
        private int totalsalary;
        public string Name
        {
            get
            {
                return name;
            }

            set
            {
                name = value;
            }
        }

        public string Gender
        {
            get
            {
                return gender;
            }

            set
            {
                gender = value;
            }
        }

        public int Position
        {
            get
            {
                return position;
            }

            set
            {
                position = value;
            }
        }

        public string Sdt
        {
            get
            {
                return sdt;
            }

            set
            {
                sdt = value;
            }
        }

        public DateTime? Dayin
        {
            get
            {
                return dayin;
            }

            set
            {
                dayin = value;
            }
        }

        public int Totaltime
        {
            get
            {
                return totaltime;
            }

            set
            {
                totaltime = value;
            }
        }

        public int Totalsalary
        {
            get
            {
                return totalsalary;
            }

            set
            {
                totalsalary = value;
            }
        }

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
    }
}
