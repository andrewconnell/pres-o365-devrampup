using WingtipCRMService.Models;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OpenIdConnect;
using Owin;
using System;
using System.IdentityModel.Claims;
using System.Threading.Tasks;
using System.Web;

namespace WingtipCRMService
{
    public partial class Startup
    {
        private const string CLIENT_ID = "e603f5c3-9b8a-4be1-ae6f-b5ca571aa2d5";
        private const string AUTHORITY = "https://login.windows.net/connect2014.onmicrosoft.com";
        public void ConfigureAuth(IAppBuilder app)
        {

            app.SetDefaultSignInAsAuthenticationType(CookieAuthenticationDefaults.AuthenticationType);
            app.UseCookieAuthentication(new CookieAuthenticationOptions());
            app.UseOpenIdConnectAuthentication(
                new OpenIdConnectAuthenticationOptions
                {
                    ClientId = CLIENT_ID,
                    Authority = AUTHORITY
                });


        }
    }
}