using Microsoft.SharePoint.Client;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Linq;
using WingtipCRMAppWeb.Models;

namespace WingtipCRMAppWeb.Controllers
{
    public class HomeController : Controller
    {
        [SharePointContextFilter]
        public async Task<ActionResult> Index()
        {

            StringBuilder requestUri = new StringBuilder()
            .Append("https://wingtipcrmservice.azurewebsites.net/odata/")
            .Append("Customers?$orderby=LastName");

            HttpClient client = new HttpClient();
            HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, requestUri.ToString());

            //Access Token not required, because we are authorized in the same tenancy
            //request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", accessToken);

            HttpResponseMessage response = await client.SendAsync(request);
            string json = await response.Content.ReadAsStringAsync();
            XElement root = Json2Xml(json);

            List<Customer> customers = new List<Customer>();

            foreach (XElement propElement in root.Descendants("value").Elements())
            {
                customers.Add(new Customer
                {
                    ID = propElement.Elements("ID").First().Value,
                    FirstName = propElement.Elements("FirstName").First().Value,
                    LastName = propElement.Elements("LastName").First().Value,
                    Company = propElement.Elements("Company").First().Value,
                    EmailAddress = propElement.Elements("EmailAddress").First().Value,
                    WorkPhone = propElement.Elements("WorkPhone").First().Value,
                    HomePhone = propElement.Elements("HomePhone").First().Value
                });
            }

           
            return View(customers);
        }

        private static XElement Json2Xml(string json)
        {
            using (XmlDictionaryReader reader = JsonReaderWriterFactory.CreateJsonReader(
                    Encoding.UTF8.GetBytes(json),
                    XmlDictionaryReaderQuotas.Max))
            {
                return XElement.Load(reader);
            }
        }
    }
}
