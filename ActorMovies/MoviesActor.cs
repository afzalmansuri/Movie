using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

using System.Threading.Tasks;

namespace ActorMovies
{
    class MoviesActor
    {
        string connectionString = "Data Source=DESKTOP-HQIELD6\\SQLEXPRESS;Initial Catalog=MoviesDb;Integrated Security=true;MultipleActiveResultSets=True;";
        int movieid, actorid;


        public void AddCastActors()
        {

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            Console.Write("Enter MovieName  :   ");
            string moviename = Console.ReadLine();
            Console.Write("Enter ActorName  :   ");
            String actorname = Console.ReadLine();
            string sql = "select MovieId from Movies where MovieName=@name";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("name", moviename);
            SqlDataReader dataReader = command.ExecuteReader();

            while (dataReader.Read())
            {

                /*Console.WriteLine("MovieId:" + dataReader[0].ToString());*/
                movieid = Convert.ToInt32(dataReader[0].ToString());
            }
            dataReader.Close();

            string sql2 = "select ActorId from Actors where ActorName=@name";
            SqlCommand command2 = new SqlCommand(sql2, connection);
            command2.Parameters.AddWithValue("name", actorname);

            SqlDataReader dataReader2 = command2.ExecuteReader();

            while (dataReader2.Read())
            {

               /* Console.WriteLine("ActorId:" + dataReader2[0].ToString());*/
                actorid = Convert.ToInt32(dataReader2[0].ToString());
            }
            dataReader2.Close();

            try
            {

                string sql3 = $"insert into ActorMovies (MovieId,ActorId)values({movieid},{actorid})";
                SqlCommand command3 = new SqlCommand(sql3, connection);

                command3.ExecuteNonQuery();

                Console.WriteLine("Movie Cast Added");

                Program program = new Program();
                program.Menu();
            }
            catch (Exception e)
            {
                throw new ArgumentException("ActorName or MovieName doesn't exist");
            }
            connection.Close();
        }




        public void ViewMovieDetails()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            Console.Write("Enter MovieName  :   ");
            string movie = Console.ReadLine();
            string sql = "select Moviename,ActorName,Citizenship from vActorMovies where MovieName=@moviename";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("moviename", movie);
            SqlDataReader dataReader = command.ExecuteReader();
            while (dataReader.Read())
            {
                Console.WriteLine("     MovieName           :   " + dataReader[0].ToString());
                Console.WriteLine("     ActorName           :   " + dataReader[1].ToString());
                Console.WriteLine("     Actor Citizenship   :   " + dataReader[2].ToString());
            }
            dataReader.Close();
            connection.Close();

            Program program = new Program();
            program.Menu();
        }
    }
}
