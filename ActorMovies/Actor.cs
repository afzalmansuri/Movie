using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ActorMovies
{
     class Actor
    {
     
        string connectionString = "Data Source=DESKTOP-HQIELD6\\SQLEXPRESS;Initial Catalog=MoviesDb;Integrated Security=true;MultipleActiveResultSets=True;";
        public void AddActors()
        {
            
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();


            Console.Write("Enter ActorName:");
            string name = Console.ReadLine();
            
            Console.Write("Enter Citizenship :");
            string citizenship = Console.ReadLine();
            



            string sql = $"insert into Actors (ActorName,Citizenship)values('{name}','{citizenship}')";
            SqlCommand command = new SqlCommand(sql, connection);

            command.ExecuteNonQuery();
            connection.Close();
            Console.WriteLine("Actor Successfully Added");

            Program program = new Program();
            program.Menu();
            
          
        }
        public void DeleteActors()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            Console.WriteLine(connectionString);

            Console.Write("Enter ActorName:");
            // int id = Convert.ToInt32(Console.ReadLine());

            string actorname = Console.ReadLine();

            string sql = "delete from Actors where ActorName =@name";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("name", actorname);


            command.ExecuteNonQuery();
            connection.Close();

          

            Console.WriteLine("Actor Deleted..");
            Program program = new Program();
            program.Menu();
        }
    }
}
