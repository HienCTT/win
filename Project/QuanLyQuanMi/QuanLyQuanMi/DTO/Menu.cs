using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DTO
{
    public class Menu
    {
        public Menu(string foodname, int count, float price, float totalprice = 0)
        {
            this.Foodname = foodname;
            this.count = count;
            this.Price = price;
            this.TotalPrice = totalprice;
        }
        public Menu(DataRow row)
        {
            this.Foodname = row["name"].ToString();
            this.count = (int)row["count"];
            this.Price = (float)Convert.ToDouble(row["price"].ToString());
            this.TotalPrice = (float)Convert.ToDouble(row["totalprice"].ToString());
        }
        private float TotalPrice;
        private float price;
        private int count;
        private string foodname;

        

        public string Foodname
        {
            get
            {
                return foodname;
            }

            set
            {
                foodname = value;
            }
        }

        public float Price
        {
            get
            {
                return price;
            }

            set
            {
                price = value;
            }
        }

        public float TotalPrice1
        {
            get
            {
                return TotalPrice;
            }

            set
            {
                TotalPrice = value;
            }
        }

        public int Count
        {
            get
            {
                return count;
            }

            set
            {
                count = value;
            }
        }
    }
}
