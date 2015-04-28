using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Http.OData.Builder;
using System.Web.Http.OData.Batch;
using WingtipCRMService.Models;
using Microsoft.Data.Edm;
using System.Web.Http.Cors;

namespace WingtipCRMService
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {

            //Generate Breeze entity data model
            using (var context = new CustomerContext())
            {
                config.Routes.MapODataRoute(
                    routeName: "odata",
                    routePrefix: "odata",
                    model: context.GetEdm(),
                    batchHandler: new DefaultODataBatchHandler(GlobalConfiguration.DefaultServer)
                    );
            }

            //enable CORS
            config.EnableCors(new EnableCorsAttribute("*", "*", "*", "DataServiceVersion,MaxDataServiceVersion"));
        }
    }
}
