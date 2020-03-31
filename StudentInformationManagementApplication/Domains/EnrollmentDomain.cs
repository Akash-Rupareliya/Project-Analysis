using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using StudentInformationManagementApplication.Models;

namespace StudentInformationManagementApplication.Domains
{
    public class EnrollmentDomain:BaseDomain
    {
        public void Add(Enrollment e)
        {
            this.ExecuteNonQuery($"insert into Enrollments (StudentId,CourseId,FeeStatus) values({e.StudentId},{e.CourseId},'{e.FeeStatus}')");
        }

        public List<vEnrollmentDetail> Get(int sid)
        {
            var reader = this.GetReader($"select  from vEnrollmentDetails where StudentId={sid}");
            var enrollmentList = new List<vEnrollmentDetail>();
            while (reader.Read())
            {
                vEnrollmentDetail v = new vEnrollmentDetail();
                v.StudentId= reader.GetInt32(3);
                v.StudentName = reader.GetString(1);
                v.CourseName= reader.GetString(0);
                v.CourseFee = reader.GetInt32(4);
                v.FeeStatus = reader.GetInt32(2);
                enrollmentList.Add(v);
            }
            return enrollmentList;
        }

        public void Delete(int id)
        {
            this.ExecuteNonQuery($"delete from Enrollments where EnrollmentId={id}");
        }
    }
}
