using Microsoft.EntityFrameworkCore;

namespace LearnFlutterWithASPNetAPI.Models
{
    public class DatabaseContext: DbContext
    {
        public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
        {

        }

        public DbSet<Student> Students { get; set; }

    }
}
