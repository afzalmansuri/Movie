using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ActorMovies
{
    class Program
    {


        public void Menu()
        {
            Movie movie = new Movie();
            Actor actor = new Actor();
            MoviesActor movieactor = new MoviesActor();
            Console.WriteLine("********* Actor Movies   *********** ");
            Console.WriteLine("1. Add Movie");
            Console.WriteLine("2. Add Actor");
            Console.WriteLine("3. Add Movie Cast");
            Console.WriteLine("4. View Movie details");
            
            Console.WriteLine("5. Delete Movie");
            Console.WriteLine("6. Delete Actor");
            Console.WriteLine("7. Exit ");
            Console.Write("Enter Your Choice : ");
            int Choice = Convert.ToInt32(Console.ReadLine());
            switch (Choice)
            {
                case 1:
                    movie.Addmovies();
                    break;
                case 2:
                    actor.AddActors();
                    break;
                case 3:
                    movieactor.AddCastActors();
                    break;
                case 4:
                    movieactor.ViewMovieDetails();
                    break;
                case 5:
                    movie.DeleteMovie();
                    break;

                case 6:
                    actor.DeleteActors();
                    break;
                case 7:
                    Environment.Exit(0);
                    break;
                default:
                    Console.WriteLine("Invalid Choice!!");
                    break;
            }
        }

        static void Main(string[] args)
        {
            Program program = new Program();
            program.Menu();
           

            
        }
    }
}
