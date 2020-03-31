using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentInformationManagementApplication.Models
{
    public class vEnrollmentDetail
    {
        public int StudentId { get; set; }
        public string StudentName { get; set; }
        public string CourseName { get; set; }
        public int CourseFee { get; set; }
        public int FeeStatus { get; set; }
    }
}
