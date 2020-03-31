using Microsoft.AspNetCore.Mvc;
using StudentInformationManagementApplication.Domains;
using StudentInformationManagementApplication.Models;

namespace StudentInformationManagementApplication.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseController : ControllerBase
    {
        public CourseDomain CourseDomain { get; set; }
        // GET: api/Course
        public CourseController()
        {
            this.CourseDomain = new CourseDomain();
        }
        [HttpGet]
        public IActionResult Get()
        {
            var courseList = this.CourseDomain.Get();
            return Ok(courseList);
        }

        // GET: api/Course/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Course
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Course/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
