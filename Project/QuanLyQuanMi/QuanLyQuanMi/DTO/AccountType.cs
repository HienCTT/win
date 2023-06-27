using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DTO
{
    public class AccountType
    {
        public AccountType(int type, string name)
        {
            this.type = type;
            this.name = name;
        }
        public AccountType(DataRow row)
        {
            this.type = (int)row["type"];
            this.name = row["name"].ToString(); 
        }

        private int type;
        private string name;
        public int Type
        {
            get
            {
                return type;
            }

            set
            {
                type = value;
            }
        }

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
    }
}
