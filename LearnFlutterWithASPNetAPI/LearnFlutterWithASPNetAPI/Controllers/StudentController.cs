using LearnFlutterWithASPNetAPI.Models;
using LearnFlutterWithASPNetAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Threading.Tasks;

namespace LearnFlutterWithASPNetAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StudentController : ControllerBase
    {
        private readonly IStudentRepository _iStudent;

        public StudentController(IStudentRepository iStudent)
        {
            _iStudent = iStudent;
        }

        [HttpPost]
        public async Task<IActionResult> SaveStudent([FromBody] Student _data)
        {
            if (_data == null)
            {
                return BadRequest();
            }
            POJO model = await _iStudent.SaveStudent(_data); 
            return Ok(model);
        }

        [HttpGet("{Id}")]
        public async Task<IActionResult> GetStudentById(int? Id)
        {
            if (Id == null)
            {
                return BadRequest();
            }
            Student model = await _iStudent.GetStudent(Id);
            if (model == null)
            {
                return NotFound();
            }
            return Ok(model);
        }

        [HttpGet]
        public IActionResult GetListStudents()
        {
            IQueryable<Student> data = _iStudent.GetAllStudents;
            return Ok(data);
        }

        [HttpDelete]
        public async Task<IActionResult> DeleteStudentById(int? Id)
        {
            if (Id == null)
            {
                return BadRequest();
            }

            POJO model = await _iStudent.DeleteStudent(Id);
            if (model == null)
            {
                return NotFound();
            }

            return Ok(model);
        }

    }
}
