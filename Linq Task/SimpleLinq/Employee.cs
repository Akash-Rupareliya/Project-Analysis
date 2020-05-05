using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpleLinq
{
    class Employee
    {
        public int EmployeeId { get; set; }
        public string First_Name { get; set; }
        public string Last_Name { get; set; }
        public Nullable<decimal> Salary { get; set; }
        public Nullable<System.DateTime> Joining_Date { get; set; }
        public string Department { get; set; }
    }
}
