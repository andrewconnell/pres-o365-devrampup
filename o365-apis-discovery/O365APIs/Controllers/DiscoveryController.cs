using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.IdentityModel.Clients.ActiveDirectory;
using Microsoft.Office365.Discovery;
using O365APIs.Utils;

namespace O365APIs.Controllers {
  public class DiscoveryController : Controller {

    // GET: Discovery
    public async Task<ActionResult> Index()
    {
      // get instance of the authentication context using the token cache we created previously
      var signedInUser = ClaimsPrincipal.Current.FindFirst(ClaimTypes.NameIdentifier).Value;
      var authContext = new AuthenticationContext(SettingsHelper.AzureADAuthority, new EFADALTokenCache(signedInUser));

      // create credentials for the application
      var appCred = new ClientCredential(SettingsHelper.ClientId, SettingsHelper.ClientSecret);

      // get user identifier
      var userObjectId = ClaimsPrincipal.Current.FindFirst(SettingsHelper.ClaimTypeObjectIdentifier).Value;
      var userId = new UserIdentifier(userObjectId, UserIdentifierType.UniqueId);

      // create instance of DiscoveryClient
      var discoveryClient = new DiscoveryClient(new Uri(SettingsHelper.O365DiscoveryServiceEndpoint),
        async () =>
        {
          var authResult = await authContext.AcquireTokenSilentAsync(SettingsHelper.O365DiscoveryResourceId, appCred, userId);
          return authResult.AccessToken;
        });

      // query discovery service for endpoints
      var capabilitiesResults = await discoveryClient.DiscoverCapabilitiesAsync();

      return View(capabilitiesResults);
    }
  }
}