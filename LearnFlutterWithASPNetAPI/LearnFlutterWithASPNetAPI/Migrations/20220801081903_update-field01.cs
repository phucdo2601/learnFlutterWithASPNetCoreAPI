using Microsoft.EntityFrameworkCore.Migrations;

namespace LearnFlutterWithASPNetAPI.Migrations
{
    public partial class updatefield01 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Password",
                table: "student",
                type: "nvarchar(150)",
                maxLength: 150,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Username",
                table: "student",
                type: "nvarchar(150)",
                maxLength: 150,
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Password",
                table: "student");

            migrationBuilder.DropColumn(
                name: "Username",
                table: "student");
        }
    }
}
