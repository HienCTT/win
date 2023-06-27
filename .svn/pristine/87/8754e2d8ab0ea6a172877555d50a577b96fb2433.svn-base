using QuanLyQuanMi.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanMi.DAO
{
    public class EmployeesDAO
    {
        private static EmployeesDAO instance;

        public static EmployeesDAO Instance
        {
            get { if (instance == null) instance = new EmployeesDAO(); return instance; }
            private set { instance = value; }
        }

        private EmployeesDAO() { }

        public List<Employees> GetTotaltimeEmployeesById(int id) // Lấy tổng thời gian làm việc theo ID nhân viên
        {
            List<Employees> list = new List<Employees>();
            string query = "select * from Employees where id = " +id;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);
            foreach (DataRow item in data.Rows)
            {
                Employees emp = new Employees(item);
                list.Add(emp);
            }

            return list;
        }

        public Employees GetEmnployeesById(int id) // lấy nhân viên theo ID
        {
            Employees emp = null;

            string query = "select * from Employees where id = " + id;

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                emp = new Employees(item);
                return emp;
            }

            return emp;
        }

        public List<Employees> GetListEmployees() // lấy danh sách nhân viên từ DB
        {
            List<Employees> list = new List<Employees>();

            string query = "select *  from Employees";

            DataTable data = DataProvider.Instance.ExecuteQuery(query);

            foreach (DataRow item in data.Rows)
            {
                Employees emp = new Employees(item);
                list.Add(emp);
            }

            return list;
        }

        public bool ResetTotaltime(int id) // Hàm reset tổng thời gian nhân viên về 0 theo ID
        {
            string query = string.Format("update employees set totaltime = 0 where id = {0}", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool ResetTotalSalary(int id) // Hàm reset lương nhân viên về 0 theo ID
        {
            string query = string.Format("update employees set totalsalary = 0 where id = {0}", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool ResetAllTime() // Reset lương và giờ làm của tất cả nhân viên về 0
        {
            string query = string.Format("update employees set totalsalary = 0 , totaltime = 0");
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool InsertEmployee(string name, string gender, int position, string sdt, DateTime? dayin , int totaltime, int totalsalary) // Thêm thông tin nhân viên
        {
            string query = string.Format("INSERT Employees ( name, gender, position, sdt, dayin, totaltime, totalsalary )VALUES  ( N'{0}', N'{1}', {2} , '{3}' , '{4}' , {5} , {6} )", name, gender, position, sdt ,dayin, totaltime, totalsalary);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool DeleteEmployees(int id)  // Xóa nhân viên
        {
            string query = string.Format("Delete Employees where id = {0}", id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }

        public bool UpdateEmployees(int id, string name, string gender, int position, string sdt, DateTime? dayin, int totaltime, int totalsalary) // Cập nhật thông tin nhân viên
        {
            string query = string.Format("UPDATE Employees SET name = N'{0}' , gender = N'{1}' , position = {2} , sdt = N'{3}' , dayin = '{4}' , totaltime = {5} , totalsalary = {6} WHERE id = {7}", name, gender, position, sdt, dayin, totaltime, totalsalary, id);
            int result = DataProvider.Instance.ExecuteNonQuery(query);

            return result > 0;
        }
    }
}
