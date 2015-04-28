using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace WingtipCRMAppWeb.Models
{
    [DataContract]
    public class Customer
    {
        [DataMember]
        public string ID { get; set; }

        [DataMember]
        [DisplayName("First Name")]
        public string FirstName { get; set; }

        [DataMember]
        [DisplayName("Last Name")]
        public string LastName { get; set; }

        [DataMember]
        public string Company { get; set; }

        [DataMember]
        [DisplayName("Work Phone")]
        public string WorkPhone { get; set; }

        [DataMember]
        [DisplayName("Home Phone")]
        public string HomePhone { get; set; }

        [DataMember]
        [DisplayName("Email Address")]
        public string EmailAddress { get; set; }
    }
}