//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class OrderInvoice
    {
        public int OrderDetailId { get; set; }
        public int OrderId { get; set; }
        public int ToyId { get; set; }
        public System.DateTime OrderDetailDate { get; set; }
        public int OfferId { get; set; }
        public int FinalPrice { get; set; }
    
        public virtual Offer Offer { get; set; }
        public virtual Order Order { get; set; }
        public virtual Toy Toy { get; set; }

        
    }
}
