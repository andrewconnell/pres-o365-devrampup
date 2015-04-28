<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
    <script type="text/javascript" src="../Scripts/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="../Scripts/knockout-2.3.0.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.runtime.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.js"></script>
    <script type="text/javascript" src="/_layouts/15/sp.ui.dialog.js"></script>
    <script type="text/javascript" src="../Scripts/wingtip.contacts.data.js"></script>
    <script type="text/javascript" src="../Scripts/wingtip.contacts.model.js"></script>
    <script type="text/javascript" src="../Scripts/wingtip.contacts.viewmodel.js"></script>
    <script type="text/javascript" src="../Scripts/EditPageEvents.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Single-Page App
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
            <div id="formDiv" style="overflow: auto">
                <form>
                   <input id="identifier" data-bind="attr: { value: get_contact(0).get_id() }" type="hidden" />
                   <table>
                        <tr>
                            <td>First Name</td>
                            <td>
                                <input id="firstName" data-bind="attr: { value: get_contact(0).get_fname() }" type="text" autofocus required placeholder="John" />
                                <div class="error">First Name is required</div>
                            </td>
                        </tr>
                        <tr>
                            <td>Last Name</td>
                            <td>
                                <input id="lastName" data-bind="attr: { value: get_contact(0).get_lname() }" type="text" required placeholder="Doe" />
                                <div class="error">Last Name is required</div>
                            </td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td>
                                <input id="workPhone" data-bind="attr: { value: get_contact(0).get_phone() }" type="tel" required placeholder="555-555-5555" />
                                <div class="error">Please enter a valid phone number</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="margin-top:5px;padding-top:5px;">
                                    <button  value="Submit" id="updateButton" >
                                        Submit
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
</asp:Content>
