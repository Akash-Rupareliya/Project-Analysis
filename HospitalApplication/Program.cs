using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HospitalApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice = 0;
            var dbContext = new HospitalDbEntities();
            Console.WriteLine("Welcome To Hospital Management System");
            Console.WriteLine("1. Add Patient");
            Console.WriteLine("2. Add Doctor");
            Console.WriteLine("3. Add Healthcare Assistant");
            Console.WriteLine("4. Add Department");
            Console.WriteLine("5. Add Drugs");
            Console.WriteLine("6. Make Appointment");
            Console.WriteLine("7. View Patients");
            Console.WriteLine("8. View Doctors");
            Console.WriteLine("9. Prescribe");
            Console.WriteLine("0. Exit Application");

            Console.Write("Enter Your Choice : ");
            choice = Convert.ToInt32(Console.ReadLine());
            do
            {
                switch (choice)
                {
                    case 1:
                        Patients p = new Patients();
                        p.GetData();
                        dbContext.Patients.Add(p);
                        dbContext.SaveChanges();
                        break;
                    case 2:
                        
                        Doctors d = new Doctors();
                        d.GetData();
                        dbContext.Doctors.Add(d);
                        dbContext.SaveChanges();
                        break;
                    case 3:
                        HealthcareAssistants ha = new HealthcareAssistants();
                        ha.GetData();
                        dbContext.HealthcareAssistants.Add(ha);
                        dbContext.SaveChanges();
                        break;
                    case 4:
                        Departments departments = new Departments();
                        departments.GetData();
                        dbContext.Departments.Add(departments);
                        dbContext.SaveChanges();
                        break;
                    case 5:
                        Drugs drugs = new Drugs();
                        drugs.GetData();
                        dbContext.Drugs.Add(drugs);
                        dbContext.SaveChanges();
                        break;
                    case 6:
                        Diagnosises diagnosis = new Diagnosises();
                        diagnosis.GetData();
                        dbContext.Diagnosises.Add(diagnosis);
                        dbContext.SaveChanges();
                        break;

                    case 7:
                        Patients patients = new Patients();
                        patients.List();
                        break;
                    case 8:
                        Doctors doctors = new Doctors();
                        doctors.List();
                        break;
                    case 9:
                        Prescribes prescribes = new Prescribes();
                        prescribes.GetData();
                        dbContext.Prescribes.Add(prescribes);
                        dbContext.SaveChanges();
                        break;
                }
                Console.WriteLine("Enter Your Choice");
                choice = Convert.ToInt32(Console.ReadLine());
            } while (choice != 0);

        }
    }
}
