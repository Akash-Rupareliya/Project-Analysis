using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StudentInformationManagementApplication.Domains;
using StudentInformationManagementApplication.Models;

namespace StudentInformationManagementApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EnrollmentController : ControllerBase
    {
        public EnrollmentDomain EnrollmentDomain { get; set; }
        public EnrollmentController()
        {
            this.EnrollmentDomain = new EnrollmentDomain();
        }
        // GET: api/Enrollment
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/Enrollment/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var enrollList = this.EnrollmentDomain.Get(id);
            return Ok(enrollList);
        }

        // POST: api/Enrollment
        [HttpPost]
        public IActionResult Post(Enrollment e)
        {
            this.EnrollmentDomain.Add(e);
            return Ok();
        }

        // PUT: api/Enrollment/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value)
        {
            return Ok();
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            this.EnrollmentDomain.Delete(id);
            return Ok();
        }
    }
}
