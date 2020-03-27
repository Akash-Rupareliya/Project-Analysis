using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToyManufacturerApplication
{
    class Program
    {
        static void Main(string[] args)
        {
            int choice = 0;
            var dbContext = new ToyManufacturerDbEntities();
            Console.WriteLine("1. Add offers");
            Console.WriteLine("2. Add Customer");
            Console.WriteLine("3. Login Customer");
            Console.WriteLine("4. Add Plants");
            Console.WriteLine("5. Add Toy");
            Console.WriteLine("Enter Your Choice : ");
            choice = Convert.ToInt32(Console.ReadLine());
            do
            {
                switch (choice)
                {
                    case 1:
                        Offer offer = new Offer();
                        offer.GetData();
                        dbContext.Offers.Add(offer);
                        dbContext.SaveChanges();
                        Console.WriteLine("Offer Added Successfully");
                        break;
                    case 2:
                        Customer customer = new Customer();
                        customer.GetData();
                        var check = dbContext.Customers.SingleOrDefault(t => t.CustomerEmail == customer.CustomerEmail);
                        if (check == null)
                        {
                            try
                            {
                                dbContext.Customers.Add(customer);
                                dbContext.SaveChanges();
                                Console.WriteLine("Customer Added Successfully");
                            }
                            catch(Exception e)
                            {
                                Console.WriteLine(e);
                            }
                        }
                        else
                        {
                            Console.WriteLine("Customer Already Exists");
                        }
                        break;
                    case 3:
                        login();
                        break;
                    case 4:
                        Plant plant = new Plant();
                        plant.GetData();
                        dbContext.Plants.Add(plant);
                        break;
                    case 5:
                        Toy toy = new Toy();
                        toy.GetData();
                        dbContext.Toys.Add(toy);
                        dbContext.SaveChanges();
                        break;
                }

                Console.WriteLine("Enter Your Choice : ");
                choice = Convert.ToInt32(Console.ReadLine());
            } while (choice != 0);
            void login()
            {
                using (dbContext)
                {
                    var customer = new Customer();
                    Console.WriteLine("Enter Your Email Id : ");
                    customer.CustomerEmail = Console.ReadLine();
                    var check = dbContext.Customers.SingleOrDefault(t => t.CustomerEmail == customer.CustomerEmail);
                    if (check == null)
                    {
                        Console.WriteLine("Please Enter Valid Credentials");
                    }
                    else
                    {
                        Console.WriteLine("You have logged in successfully");
                        AddOrder(check.CustomerId);
                    }

                
                }
            }
            void AddOrder(int customerid)
            {
                using (dbContext) {
                    var order = new Order();
                    var toy = new Toy();
                    toy.List();
                    Console.WriteLine("Enter you want to Buy Toy Id :");
                    order.CustomerId = customerid;
                    ShowAddress(customerid);
                    Console.WriteLine("Enter Address id where you want delivery: ");
                    order.AddressId = Convert.ToInt32(Console.ReadLine());
                    try
                    {
                        dbContext.Orders.Add(order);
                        dbContext.SaveChanges();
                        var orderInvoice = dbContext.Orders.Where(t => t.CustomerId == customerid).FirstOrDefault();
                        var orderId = orderInvoice.OrderId;
                        Console.WriteLine("Enter ToyId you want Buy :");
                        var toyid = Convert.ToInt32(Console.ReadLine());
                        AddOrderInvoiceDetail(orderId, toyid);
                    }
                    catch(Exception e)
                    {
                        Console.WriteLine(e);
                    }
                }  
                
            }
            void AddOrderInvoiceDetail(int orderid, int toyid){
                using (dbContext)
                {
                    var orderInvoice = new OrderInvoice();
                    orderInvoice.OrderId = orderid;
                    orderInvoice.ToyId = toyid;
                    try
                    {
                        dbContext.OrderInvoices.Add(orderInvoice);
                        dbContext.SaveChanges();
                        Console.WriteLine("Your Invoice is Generated");

                    }
                    catch(Exception e)
                    {
                        Console.WriteLine(e);
                    }
                }
            }
            void ShowAddress(int customerid)
            {
                var addressList = dbContext.Addresses.Where(t => t.CustomerId == customerid);
                if (addressList != null)
                {
                    Console.WriteLine("AddressId \t Location \t City \tPincode");
                }
                foreach(var address in addressList)
                {
                    Console.WriteLine(address.AddressId + address.AddressLocation + address.City + address.Pincode);
                }
            }
        }
    }
}
