using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpleLinq
{
    class Program
    {

        static List<Employee> employees = new List<Employee>
        {
            new Employee{EmployeeId=1,First_Name="John",Last_Name="Abraham",Joining_Date=new DateTime(2013, 1, 1),Salary=1000000,Department="Banking"},
            new Employee{EmployeeId=2,First_Name="Michael",Last_Name="Clarke",Salary=800000,Joining_Date=new DateTime(2013, 1, 1, 0, 0, 0),Department="Insurance"},
            new Employee{EmployeeId=3,First_Name="Roy",Last_Name="Thomas",Joining_Date=new DateTime(2013, 2, 1, 0, 0, 0),Salary=700000,Department="Banking"},
            new Employee{EmployeeId=4,First_Name="Tom",Last_Name="Josh",Joining_Date=new DateTime(2013, 2, 1, 0, 0, 0),Salary=600000,Department="Insurance"},
            new Employee{EmployeeId=5,First_Name="Jerry",Last_Name="Pinto",Joining_Date=new DateTime(2013, 2, 1, 0, 0, 0),Salary=650000,Department="Insurance"},
            new Employee{EmployeeId=6,First_Name="Philip",Last_Name="Mathew",Joining_Date=new DateTime(2013, 1, 1, 0, 0, 0),Salary=750000,Department="Services"},
            new Employee{EmployeeId=7,First_Name="TestName1",Last_Name="123",Joining_Date=new DateTime(2013, 1, 1, 0, 0, 0),Salary=650000,Department="Services"},
            new Employee{EmployeeId=8,First_Name="TestName2",Last_Name="Lname%",Joining_Date=new DateTime(2013, 2, 1, 0, 0, 0),Salary=600000,Department="Insurance"}
        };

        static void Main(string[] args)
        {
            
            IEnumerable<Employee> employeeQuery =
                from employee in employees
                select employee;
            foreach (Employee employee in employeeQuery)
            {
                
                Console.WriteLine("{0}, {1}, {2}, {3}, {4}", employee.First_Name, employee.Last_Name,employee.Salary,employee.Department,employee.Joining_Date);
            }


            Console.WriteLine("------------FirstName and Lastname ---------------");
            IEnumerable<Employee> employeeFirstLastNameQuery =from employee in employees select employee;
            foreach (Employee employee in employeeFirstLastNameQuery)
            {
                Console.WriteLine("{0}, {1}", employee.First_Name, employee.Last_Name);
            }

            Console.WriteLine("--------FirstName Upper and Lower only-------------");
            var empFirst = employeeQuery.Select(e => e.First_Name);

            foreach (var str in empFirst)
                Console.WriteLine(str.ToUpper());

            foreach (var str in empFirst)
                Console.WriteLine(str.ToLower());



            Console.WriteLine("------------Distinct Department From Employee---------------");
            var dep = employeeQuery.Select(e => e.Department).Distinct();

            foreach (var str in dep)
                Console.WriteLine(str);

            Console.WriteLine("-----------------");
            //var first = employeeQuery.Select(e => e.First_Name).Where(emp=>emp.Contains("m")).ElementAt(3);
            //foreach (var str in first)
            //    Console.WriteLine(str);

            var empDetail = employeeQuery.Where(name => name.Last_Name.Contains("%"));
            foreach (var str in empDetail)
                Console.WriteLine(str.First_Name);

            var firstName = employees.OrderBy(fName => fName.First_Name);
            foreach (var str in firstName)
                Console.WriteLine(str.First_Name);

            var empDetails = employees.Where(name => name.First_Name == "John" || name.First_Name == "Roy");
            foreach (var str in empDetails)
            {
                Console.WriteLine(str.First_Name);
                Console.WriteLine(str.Last_Name);
                Console.WriteLine(str.Salary);
                Console.WriteLine(str.Joining_Date);
            }

            var empDetailStartWithJ = employees.Where(name => name.First_Name.StartsWith("J"));
            foreach (var str in empDetailStartWithJ)
            {
                Console.WriteLine(str.First_Name);
                Console.WriteLine(str.Last_Name);
                Console.WriteLine(str.Salary);
                Console.WriteLine(str.Joining_Date);
            }

            Console.WriteLine("Hello");
            Console.ReadKey();
        }
    }
}
