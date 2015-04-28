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
    <script type="text/javascript" src="../Scripts/DefaultPageEvents.js"></script>
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Single-Page App
</asp:Content>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <div id="toolbarWindow">
        <input type="button" id="newButton" value="New" />
    </div>
    <div id="resultsDiv" style="overflow: auto">
        <table>
            <caption>My Contacts</caption>
            <thead>
                <tr>
                    <th><span style="margin-right: 15px;"></span></th>
                    <th><span style="margin-right: 15px;"></span></th>
                    <th><span style="margin-right: 15px;">Last Name</span></th>
                    <th><span style="margin-right: 15px;">First Name</span></th>
                    <th><span style="margin-right: 15px;">Phone</span></th>
                </tr>
            </thead>
            <tbody id="resultsTable" data-bind="foreach: get_contacts()">
                <tr>
                    <td nowrap="nowrap">
                        <img data-bind="attr: { id: 'edit' + get_id() }" class="editButton" src="../images/edit.gif" />
                    </td>
                    <td nowrap="nowrap">
                        <img data-bind="attr: { id: 'delete' + get_id() }" class="deleteButton" src="../images/delete.gif" />
                    </td>
                    <td nowrap="nowrap" data-bind="text: get_lname()"></td>
                    <td nowrap="nowrap" data-bind="text: get_fname()"></td>
                    <td nowrap="nowrap" data-bind="text: get_phone()"></td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
