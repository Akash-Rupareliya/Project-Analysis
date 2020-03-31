using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using StudentInformationManagementApplication.Models;

namespace StudentInformationManagementApplication.Domains
{
    public class CourseDomain:BaseDomain
    {
        public List<Course> Get()
        {
            var reader = this.GetReader($"select * from Cources");
            var courseList = new List<Course>();
            while (reader.Read())
            {
                Course c = new Course();
                c.CourseId= reader.GetInt32(0);
                c.CourseName= reader.GetString(1);
                c.CourseFee= reader.GetInt32(2);
                courseList.Add(c);
            }
            return courseList;
        }
    }
}
