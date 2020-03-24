using System;
using MovieCastApplication.Model;

namespace MovieCastApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice = 0;
            Console.WriteLine("Hello World!");
            Console.WriteLine("1. Add Actor");
            Console.WriteLine("2. Add Movie");
            Console.WriteLine("3. Delete Actor");
            Console.WriteLine("4. Delete Movie");
            Console.Write("Enter Your Choice");
            choice = Convert.ToInt32(Console.ReadLine());
            Movie movie = new Movie();
            Actor ac = new Actor();
            do
            {
                switch (choice)
                {
                    case 1:
                        ac.Add();
                        break;
                    case 2:
                        movie.Add();
                        break;
                    case 3:
                        ac.Delete();
                        break;
                    case 4:
                        movie.Delete();
                        break;
                    case 5:

                        break;
                }
                Console.WriteLine("Enter Your Choice:");
                choice = Convert.ToInt32(Console.ReadLine());
            } while (choice != 0);
        }
    }
}
