﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ToyManufacturerApplication
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ToyManufacturerDbEntities : DbContext
    {
        public ToyManufacturerDbEntities()
            : base("name=ToyManufacturerDbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Address> Addresses { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Offer> Offers { get; set; }
        public virtual DbSet<OrderInvoice> OrderInvoices { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Plant> Plants { get; set; }
        public virtual DbSet<Toy> Toys { get; set; }
        public virtual DbSet<vOrderDetail> vOrderDetails { get; set; }
    }
}