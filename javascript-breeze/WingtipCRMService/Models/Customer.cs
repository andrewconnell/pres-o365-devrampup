using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration;

namespace WingtipCRMService.Models
{
    public class CustomerContext : DbContext
    {
        //Get connection string from web.config
        public CustomerContext() : base("Name=PeopleEntities") { }
        public DbSet<Customer> Customers { get; set; }
    }
    public class Customer
    {
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Company { get; set; }
        public string WorkPhone { get; set; }
        public string HomePhone { get; set; }
        public string EmailAddress { get; set; }
    }

    public class CustomerMap : EntityTypeConfiguration<Customer>
    {
        public CustomerMap()
        {
            this.ToTable("Customers");
            this.HasKey(t => t.ID);
            this.Property(t => t.ID).HasColumnName("ID");
            this.Property(t => t.FirstName).HasMaxLength(100).HasColumnName("FirstName");
            this.Property(t => t.LastName).HasMaxLength(100).HasColumnName("LastName");
            this.Property(t => t.Company).HasMaxLength(100).HasColumnName("Company");
            this.Property(t => t.WorkPhone).HasMaxLength(100).HasColumnName("WorkPhone");
            this.Property(t => t.HomePhone).HasMaxLength(100).HasColumnName("HomePhone");
            this.Property(t => t.EmailAddress).HasMaxLength(100).HasColumnName("EmailAddress");
        }
    }
}