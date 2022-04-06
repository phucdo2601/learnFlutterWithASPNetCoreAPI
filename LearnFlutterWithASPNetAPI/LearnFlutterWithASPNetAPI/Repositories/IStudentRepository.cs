using LearnFlutterWithASPNetAPI.Models;
using System.Linq;
using System.Threading.Tasks;

namespace LearnFlutterWithASPNetAPI.Services
{
    public interface IStudentRepository
    {
        Task<Student> GetStudent(int? id);

        IQueryable<Student> GetAllStudents { get; }

        Task<POJO> SaveStudent (Student student);

        Task<POJO> DeleteStudent (int? id);
    }
}
