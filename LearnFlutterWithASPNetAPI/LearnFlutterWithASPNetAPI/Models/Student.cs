using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace LearnFlutterWithASPNetAPI.Models
{
    [Table("student")]
    public class Student
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }
        [Column("firstName")]
        [StringLength(150)]
        public string FirstName { get; set; }
        [Column("lastName")]
        [StringLength(150)]
        public string LastName { get; set; }
        [Column("gender")]
        public int Gender { get; set; }


    }
}
