using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using Microsoft.Owin.Security.OpenIdConnect;
using O365APIs.Utils;
using Owin;
using AuthenticationContext = Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext;

namespace O365APIs {
  public partial class Startup {

    public void ConfigureAuth(IAppBuilder app)
    {
      app.SetDefaultSignInAsAuthenticationType(CookieAuthenticationDefaults.AuthenticationType);
      app.UseCookieAuthentication(new CookieAuthenticationOptions());

      //configure the OWIN OpenID Connect options
      app.UseOpenIdConnectAuthentication(new OpenIdConnectAuthenticationOptions
      {
        ClientId = SettingsHelper.ClientId,
        Authority = SettingsHelper.AzureADAuthority,
        Notifications = new OpenIdConnectAuthenticationNotifications()
        {
          // when an auth code is received
          AuthorizationCodeReceived = (context) =>
          {
            // get the openid connect code passed from azure ad on a successful auth
            string code = context.Code;

            // create app cred & get the user
            ClientCredential creds = new ClientCredential(SettingsHelper.ClientId, SettingsHelper.ClientSecret);
            string userObjectId =
              context.AuthenticationTicket.Identity.FindFirst(System.IdentityModel.Claims.ClaimTypes.NameIdentifier)
                .Value;

            // get access & refresh token
            EFADALTokenCache cache = new EFADALTokenCache(userObjectId);
            AuthenticationContext authContext = new AuthenticationContext(SettingsHelper.AzureADAuthority,
                                                      cache);

            // obtain access token for the azure ad graph
            Uri redirectUri = new Uri(HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Path));
            AuthenticationResult authResult = authContext.AcquireTokenByAuthorizationCode(
              code, redirectUri, creds, SettingsHelper.AzureAdGraphResourceId);

            // success auth
            return Task.FromResult(0);
          },
          AuthenticationFailed = (context) =>
          {
            context.HandleResponse();
            return Task.FromResult(0);
          }
        },
        TokenValidationParameters = new TokenValidationParameters()
        {
          ValidateIssuer = false
        }
      });
    }

  }
}