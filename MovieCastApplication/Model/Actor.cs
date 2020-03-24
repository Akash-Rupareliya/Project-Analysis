using System;
using System.Collections.Generic;
using System.Text;
using MovieCastApplication.Domain;

namespace MovieCastApplication.Model
{
    class Actor : BaseDomain
    {
        public int ActorId { get; set; }
        public string ActorName { get; set; }
        public string ActorDetail { get; set; }
        public string ActorGender { get; set; }
    
        public void GetData()
        {
            Console.WriteLine("Enter Actor Name :");
            ActorName = Console.ReadLine();

            Console.WriteLine("Enter Actor Detail : ");
            ActorDetail = Console.ReadLine();

            Console.WriteLine("Enter Actor Gender : ");
            ActorGender = Console.ReadLine();
        }

        public void Add()
        {
            this.GetData();
            this.ExecuteNonQuery($"insert into Actors(ActorName,ActorDetail,ActorGender) values('{ActorName}','{ActorDetail}','{ActorGender}')");
        }

        public void Delete()
        {
            string name;
            Console.WriteLine("Enter Name");
            name = Console.ReadLine();
            this.ExecuteNonQuery($"delete from actors where ActorName ='{name}'");
            Console.WriteLine("Successfully Deleted");
        }

    }
}
