using System;
using System.Collections.Generic;
using System.Text;
using MovieCastApplication.Domain;

namespace MovieCastApplication.Model
{
    class Movie : BaseDomain
    {
        public string MovieTitle { get; set; }
        public string MovieReleaseDate { get; set; }
        public string MovieDetail { get; set; }
        public int MovieTime { get; set; }

        public void GetData()
        {
            Console.WriteLine("Enter Movie Title");
            MovieTitle = Console.ReadLine();
            Console.WriteLine("Enter Release Date");
            MovieReleaseDate = Console.ReadLine();
            Console.WriteLine("Enter Movie Detail");
            MovieDetail = Console.ReadLine();
            Console.WriteLine("Enter Movie Time");
            MovieTime = Convert.ToInt32(Console.ReadLine());
        }
        public void Add()
        {
            this.GetData();
            this.ExecuteNonQuery($"insert into Movies(MovieTitle,MovieReleaseDate,MovieDetail,MovieTime) values('{MovieTitle}','{MovieReleaseDate}','{MovieDetail}',{MovieTime})");
        }

        public void Delete()
        {
            string name;
            Console.WriteLine("Enter Movie Name");
            name = Console.ReadLine();
            this.ExecuteNonQuery($"delete from movies where MovieTitle='{name}'");
            Console.WriteLine("Successfully Deleted");
        }
    }
}
