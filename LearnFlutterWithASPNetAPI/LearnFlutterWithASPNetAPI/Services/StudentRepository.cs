using LearnFlutterWithASPNetAPI.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace LearnFlutterWithASPNetAPI.Services
{
    public class StudentRepository : IStudentRepository
    {
        private readonly DatabaseContext _db;
        public StudentRepository(DatabaseContext db)
        {
            _db = db;
        }

        public IQueryable<Student> GetAllStudents => _db.Students;

        public async Task<POJO> DeleteStudent(int? id)
        {
            POJO model = new POJO();
            Student student = await GetStudent(id);
            if (student != null)
            {
                try
                {
                    _db.Students.Remove(student);
                    await _db.SaveChangesAsync();   

                    //Msq
                    model.Flag = true;
                    model.Message = "Has Been Deleted";
                }
                catch (Exception ex)
                {
                    model.Flag = false; 
                    model.Message = ex.ToString();  
                    
                }
            } 
            else
            {
                model.Flag = false;
                model.Message = "Student does not exist.";
            }
            return model;
        }

        public async Task<IEnumerable<Student>> GetListAllStudentAsync()
        {
            return await _db.Students.ToListAsync();
        }

        public async Task<Student> GetStudent(int? id)
        {
            Student student = new Student();
            if (id != null)         
            {
                student = await _db.Students.FindAsync(id);
            }
            return student;
        }

        public async Task<POJO> SaveStudent(Student student)
        {
            POJO model = new POJO();
            if (student.Id == 0)
            {
                try
                {
                    await _db.AddAsync(student);
                    await _db.SaveChangesAsync();

                    //Create response
                    model.Id = student.Id;
                    model.Flag = true;
                    model.Message = "Has Been Added.";
                }
                catch (Exception ex)
                {
                    model.Flag = false;
                    model.Message = ex.ToString();
                }
            }
            else if (student.Id != 0)
            {
                Student entity = await GetStudent(student.Id);  
                entity.Id = student.Id; 
                entity.FirstName = student.FirstName;
                entity.Username = student.Username;
                entity.Password = student.Password;
                entity.LastName = student.LastName;
                entity.Gender = student.Gender;

                try
                {
                    await _db.SaveChangesAsync();
                    model.Id = student.Id;
                    model.Flag = true;
                    model.Message = "Has Been Updated.";
                }
                catch (Exception ex)
                {
                    model.Flag = false;
                    model.Message = ex.ToString();
                }
            }

            return model;   
        }
    }
}
