using System;
using System.IO;
namespace FileOperationApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice = 0;
         
            Console.WriteLine("Hello World!");
            Console.WriteLine("Welcome to File Operation Application");
            Console.WriteLine("1. Create a file ");
            Console.WriteLine("2. Copy File");
            Console.WriteLine("3. Rename a file ");
            Console.WriteLine("4. Display contents of a file ");
            Console.WriteLine("5. Concate File");

            Console.Write("Enter Your Choice : ");
            choice = Convert.ToInt32(Console.ReadLine());
            do
            {
                switch (choice)
                {
                    case 1:
                        Console.WriteLine("Enter File Name : ");
                        string file= Console.ReadLine();
                        Console.WriteLine("Enter Path : ");
                        string sourcePath = Console.ReadLine();

                        string pathString = Path.Combine(sourcePath, file);
                        if (!File.Exists(pathString))
                        {
                            var myfile=File.Create(pathString);
                            Console.WriteLine("Created Successfully");
                            myfile.Close();
                            
                        }
                        else
                        {
                            Console.WriteLine("Creation Failed");
                        }
                            break;
                    case 2:
                        Console.WriteLine("Enter Source File Name : ");
                        string file1 = Console.ReadLine();
                        Console.WriteLine("Enter Source Path : ");
                        string sourcePath1 = Console.ReadLine();
                        Console.WriteLine("Enter Targeted File Name : ");
                        string file2 = Console.ReadLine();
                        Console.WriteLine("Enter Targeted Path : ");
                        string targetPath1 = Console.ReadLine();
                        string sourceFile = Path.Combine(sourcePath1, file1);
                        Console.WriteLine(sourceFile);
                        string destFile = Path.Combine(targetPath1, file2);
                        Console.WriteLine(destFile);
                        File.Copy(sourceFile, destFile, true);
                        try
                        {
                            if (Directory.Exists(sourcePath1))
                            {
                                    File.Copy(sourceFile, destFile, true);
                                    Console.WriteLine("Your File Successfully Copied");
                                
                            }
                               else
                            {
                                Console.WriteLine("Source path does not exist!");
                            }
                        }
                        catch(Exception e)
                        {
                            Console.WriteLine(e);
                        }
                        break;
                    case 3:
                        Console.WriteLine("Enter File Name : ");
                        string file3 = Console.ReadLine();
                        Console.WriteLine("Enter Source Path : ");
                        string sourcePath3 = Console.ReadLine();
                        Console.WriteLine("Enter New File Name : ");
                        string file3a = Console.ReadLine();
                        string oldfile = Path.Combine(sourcePath3, file3);
                        string newfile = Path.Combine(sourcePath3, file3a);
                        File.Move(oldfile, newfile);

                        break;
                    case 4:
                        Console.WriteLine("Enter File Name : ");
                        file2 = Console.ReadLine();
                        Console.WriteLine("Enter Source Path : ");
                        string sourcePath2 = Console.ReadLine();
                        string sourceFile2 = Path.Combine(sourcePath2, file2);
                        string text = File.ReadAllText(sourceFile2);
                        Console.WriteLine(text);
                        break;
                    case 5:
                        Console.WriteLine("Enter First File Name");
                        string file4 = Console.ReadLine();
                        Console.WriteLine("Enter First Path :");
                        string file4path = Console.ReadLine();
                        string file4File = Path.Combine(file4path, file4);

                        Console.WriteLine("Enter Second File Name");
                        string file5 = Console.ReadLine();
                        Console.WriteLine("Enter First Path :");
                        string file5path = Console.ReadLine();
                        string file5File = Path.Combine(file5path, file5);
                        Console.WriteLine(file5path);
                        if (File.Exists(file4File))
                        {
                            FileStream f1 = null;
                            FileStream f2 = null;
                            f1 = File.Open(file4File, FileMode.Open);
                            f2 = File.Open(file5File, FileMode.Append);
                            //f1.Read()
                            StreamReader sr = new StreamReader(f1);
                            string line;
                            while ((line = sr.ReadLine()) != null)
                            {
                                StreamWriter sw = new StreamWriter(f2);
                                sw.Write(line);
                                sw.Close();
                            }
                            sr.Close();
                            Console.WriteLine("Successfully Concated");
                        }
                        else
                        {
                            Console.WriteLine("File Not Found");
                        }
                        break;
                }
                if (choice != 0)
                {
                Console.Write("Enter Your Choice : ");
                choice = Convert.ToInt32(Console.ReadLine());

                }
            } while (choice != 0);
            
        }
    }
}
