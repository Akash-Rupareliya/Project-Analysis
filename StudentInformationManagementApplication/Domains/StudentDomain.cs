using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentInformationManagementApplication.Domains
{
    public class StudentDomain:BaseDomain
    {
        public void Add(Student s)
        {
            this.ExecuteNonQuery($"insert into Students (StudentName,StudentMobileNo,StudentEmailId) values('{s.StudentName}','{s.StudentMobileNo}','{s.StudentEmailId}')");
        }
        public void Update(Student s)
        {
            this.ExecuteNonQuery($"update Students set StudentName={s.StudentName},StudentMobileNo={s.StudentMobileNo},StudentEmailId={s.StudentEmailId} where StudentId={s.StudentId}");
        }
        public void Delete(int id)
        {
            this.ExecuteNonQuery($"delete from Students where StudentId = {id}");
        }
        public List<Student> Get(int id)
        {
            var reader = this.GetReader($"select * from Student where StudentId={id}");
            var studentList = new List<Student>();
            while (reader.Read())
            {
                Student s = new Student();
                s.StudentId = reader.GetInt32(0);
                s.StudentName = reader.GetString(1);
                s.StudentEmailId = reader.GetString(2);
                s.StudentMobileNo = reader.GetString(3);
                studentList.Add(s);
            }
                return studentList;
        }
    }
}
