using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Text;
using System.Threading.Tasks;

namespace ActorMovies
{
     class Movie
    {
        string connectionString = "Data Source=DESKTOP-HQIELD6\\SQLEXPRESS;Initial Catalog=MoviesDb;Integrated Security=true;MultipleActiveResultSets=True;";

        public void Addmovies()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            Console.Write("Enter MovieName  :   ");
            string name = Console.ReadLine();
            Console.Write("Enter MovieType  :   ");
            string type = Console.ReadLine();

            string sql = $"insert into Movies (MovieName,MovieType)values('{name}','{type}')";
            SqlCommand command = new SqlCommand(sql, connection);

            command.ExecuteNonQuery();
            connection.Close();

            Console.WriteLine("Movies Successfull Added");

            Program program = new Program();
            program.Menu();
        }


        public void DeleteMovie()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            /*Console.WriteLine(connectionString);*/

            Console.Write("Enter MovieName  :   ");
            // int id = Convert.ToInt32(Console.ReadLine());

            string moviename = Console.ReadLine();

            string sql = "delete from Movies where MovieName =@name";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("name", moviename);


            command.ExecuteNonQuery();
            connection.Close();

            Console.WriteLine("Movie Deleted");
            Program program = new Program();
            program.Menu();

        }
    }
}
