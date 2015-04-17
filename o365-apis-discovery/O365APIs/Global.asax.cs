using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using O365APIs.Data;

namespace O365APIs {
  public class MvcApplication : System.Web.HttpApplication {
    protected void Application_Start() {
      Database.SetInitializer(new O365APIsInitializer());
      O365APIsContext dbContext = new O365APIsContext();
      dbContext.Database.Initialize(true);

      AreaRegistration.RegisterAllAreas();
      FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
      RouteConfig.RegisterRoutes(RouteTable.Routes);
      BundleConfig.RegisterBundles(BundleTable.Bundles);
    }
  }
}
