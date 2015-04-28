using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(WingtipCRMService.Startup))]

namespace WingtipCRMService
{
   public partial class Startup
    {
       public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);

        }
    }
}
