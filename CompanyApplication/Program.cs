using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CompanyApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice = 0 ;
            Console.WriteLine("Welcome To Company Management System");
            var dbContext = new CompanyDbEntities();
            Console.WriteLine("1. Show Business Unit");
            Console.WriteLine("2. Allocate Projects");
            Console.Write("Enter Your Choice :");
            choice = Convert.ToInt32(Console.ReadLine());
            do
            {
                switch (choice)
                {
                    case 1:
                        showBusinessUnits();
                        break;
                    case 2:
                        showProjects();
                        break;
                }
                Console.Write("Enter Your Choice :");
                choice = Convert.ToInt32(Console.ReadLine());
            } while (choice != 0);
            
            void showBusinessUnits()
            {
                var businessUnits = new BusinessUnit();
                Console.Write("Enter Unit Name to view Employee in this unit : ");
                businessUnits.BusinessUnitName = Console.ReadLine();

                var unit = dbContext.BusinessUnits.Where(t => t.BusinessUnitName == businessUnits.BusinessUnitName).FirstOrDefault();
                try { 
                    showEmployee(unit.BusinessUnitId);
                }
                catch(Exception e)
                {
                    Console.WriteLine("Department invalid");
                }
            }
            void showEmployee(int unitid)
            {
                //     var employee = new Employee();
                var employeeList = dbContext.Employees.Where(t => t.BusinessUnitId == unitid);
                Console.WriteLine("EmpId\tEmpName\tEmp Email Id\tPhone Number\tStatus");
                foreach (var emp in employeeList)
                {
                    Console.WriteLine(emp.EmployeeId+"       "  + emp.EmployeeName +"  "+ emp.EmployeeEmailId +"  "+ emp.EmployeePhoneNumber +" "+emp.EmployeeStatus);
                }
            }
            void showProjects()
            {
                var projectList = dbContext.Projects;
                Console.WriteLine("ProjectId\tProjectName\tProjectDetails ");
                foreach (var project in projectList)
                {
                    Console.WriteLine(project.ProjectId + "\t     " + project.ProjectName + "  " + project.ProjectDetail);
                }

                Console.WriteLine("Enter Project Id to assign employees:");
                var projectId = Convert.ToInt32(Console.ReadLine());

                var employeeList = dbContext.Employees;
                Console.WriteLine("EmpId\tEmpName\tEmp Email Id\tPhone Number\tStatus");
                foreach (var emp in employeeList)
                {
                    Console.WriteLine(emp.EmployeeId + "       " + emp.EmployeeName + "  " + emp.EmployeeEmailId + "  " + emp.EmployeePhoneNumber + " " + emp.EmployeeStatus);
                }
                Console.Write("Enter EmployeeId");
                var empId = Convert.ToInt32(Console.ReadLine());
                allocateEmployee(projectId, empId);
            }

            void allocateEmployee(int projectId,int empId)
            {
                var allocateProject = new AllocateProject();
              //  allocateProject.AllocateProjectId = 1;
                allocateProject.EmployeeId = 1;
                allocateProject.ProjectId = 1;
                Console.Write("Enter Employee Designation for This Project :");
                allocateProject.Designation = Console.ReadLine();
                using (dbContext)
                {
                    try
                    {
                        dbContext.AllocateProjects.Add(allocateProject);
                        dbContext.SaveChanges();
                        Console.WriteLine("Employee Allocated Successfully");
                    }
                    catch(Exception e)
                    {
                        Console.WriteLine(e);
                    }
                }
            }
        }
    }
}
