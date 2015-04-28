<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <meta name="WebPartPageExpansion" content="full" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
    <link href="../Content/themes/redmond/jquery-ui.css" rel="stylesheet" />

    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <script src="../Scripts/jquery-ui-1.10.4.custom.min.js"></script>
    <script src="../Scripts/knockout-3.0.0.js"></script>
    <script src="../Scripts/datajs-1.1.2.min.js"></script>
    <script src="../Scripts/q.min.js"></script>
    <script src="../Scripts/breeze.beta.debug.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    <script src="../Scripts/wingtip.crm.model.js"></script>
    <script src="../Scripts/wingtip.crm.viewmodel.js"></script>
    <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Wingtip CRM Client
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

  <div id="toolbar" class="ui-widget-header">
    <input type="button" id="cmdAddNewCustomer" value="Add New Customer" class="ui-button"/>
    <input type="button" id="cmdSaveChanges" value="Save Changes" class="ui-button"/>
    <img id="progress" src="../Images/PROGRESS.GIF" />
  </div>

  <div id="results">

    <table id="customersTable">
      <thead>
        <tr>
          <td>First Name</td>
          <td>Last Name</td>
          <td>Company</td>
          <td>E-mail</td>
          <td>Work Phone</td>
          <td>Home Phone</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </thead>
      <tbody id="resultsTable" data-bind="foreach: getCustomers()">
        <tr>
          <td data-bind="text: getFirstName()"></td>
          <td data-bind="text: getLastName()"></td>
          <td data-bind="text: getCompany()"></td>
          <td data-bind="text: getEmail()"></td>
          <td data-bind="text: getWorkPhone()"></td>
          <td data-bind="text: getHomePhone()"></td>
          <td><a data-bind="attr: { href: 'javascript: onDeleteCustomer(' + getId() + ');' }" >
                <img src="../Images/DELETE.GIF" alt='Delete' />
              </a>
          </td>
          <td>
            <a data-bind="attr: { href: 'javascript: onUpdateCustomerRequest(' + getId() + ');' }" >
              <img src="../Images/EDIT.GIF" alt='Edit' />

            </a>
          </td>
        </tr>
      </tbody>
    </table>

  </div>

  <div id="customer_dialog" style="display: none;" class="ui-widget-content">
    <table>
      <tr>
        <td>First Name:</td>
        <td>
          <input id="txtFirstName" /></td>
      </tr>
      <tr>
        <td>Last Name:</td>
        <td>
          <input id="txtLastName" /></td>
      </tr>
      <tr>
        <td>Company:</td>
        <td>
          <input id="txtCompany" /></td>
      </tr>
       <tr>
        <td>E-mail:</td>
        <td>
          <input id="txtEmail" /></td>
      </tr>
     <tr>
        <td>Work Phone:</td>
        <td>
          <input id="txtWorkPhone" /></td>
      </tr>
      <tr>
        <td>Home Phone:</td>
        <td>
          <input id="txtHomePhone" /></td>
      </tr>
    </table>

    <!-- hidden controls -->
    <div style="display: none">
      <input id="txtId" />
    </div>

  </div>

</asp:Content>
