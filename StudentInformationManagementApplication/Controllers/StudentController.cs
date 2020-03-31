using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StudentInformationManagementApplication.Domains;

namespace StudentInformationManagementApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        public StudentDomain StudentDomain { get; set; }
     
        public StudentController()
        {
            this.StudentDomain = new StudentDomain();
        }
        // GET: api/Student
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Student/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var studentData = this.StudentDomain.Get(id);

            return Ok(studentData);
        }

        // POST: api/Student
        [HttpPost]
        public IActionResult Post(Student s)
        {
            this.StudentDomain.Add(s);
            return Ok();
        }

        // PUT: api/Student/5
        [HttpPut("{id}")]
        public IActionResult Put(Student s)
        {
            this.StudentDomain.Update(s);
            return Ok();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            this.StudentDomain.Delete(id);
        }
    }
}
