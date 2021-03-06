﻿<%@ Page Title="Articles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArticleList.aspx.cs" Inherits="WorldOfNews.ArticleList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <section>
        <div>
            <hgroup>
                <h2><%: Page.Title %></h2>
            </hgroup>

            <div>
            <div style="float:right">
            <asp:Button CssClass="btn btn-success" runat="server" Text="Search" OnClick="SearchArticles_Click"/></div>
            <div style="float:right; margin-right:5px">
                <asp:TextBox ID="searchTextBox" ValidationGroup="searchGroup" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" runat="server" ControlToValidate="searchTextBox" ValidationGroup="searchGroup" ErrorMessage="Search field can not be empty."></asp:RequiredFieldValidator>
            </div>
            </div>

            <asp:DropDownList ID="OrderArticlesDropDownMenu" Width="20%" OnSelectedIndexChanged="OrderArticlesDropDownMenu_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server">
                <asp:ListItem Text="Order articles"></asp:ListItem>
                <asp:ListItem Text="A to Z"></asp:ListItem>
                <asp:ListItem Text="Z to A"></asp:ListItem>
                <asp:ListItem Text="From New to Old"></asp:ListItem>
                <asp:ListItem Text="From Old to New"></asp:ListItem>
            </asp:DropDownList>
            <p></p>
            <hr />
            <asp:ListView ID="articleList" runat="server"
                DataKeyNames="ArticleID" GroupItemCount="4"
                ItemType="WorldOfNews.Models.Article" SelectMethod="GetArticles">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="ArticleDetails.aspx?articleID=<%#:Item.ArticleID%>">
                                        <img src="/Images/<%#:Item.ImagePath%>"
                                            width="140" height="110" style="border: solid" /></a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="ArticleDetails.aspx?productID=<%#:Item.ArticleID%>">
                                        <span>
                                            <%#:Item.ArticleName%>
                                        </span>
                                    </a>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>

    <section>
        <div>
            <hgroup>
                <h2><%: Page.Title %> from another sources</h2>
            </hgroup>
            <br />
            <asp:ListView ID="ListView1" runat="server"
                DataKeyNames="ArticleID" GroupItemCount="4"
                ItemType="WorldOfNews.Models.ExternArticle" SelectMethod="GetExternArticles">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td/>
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <td runat="server">
                        <table>
                            <tr>
                                <td>
                                    <a href="<%#: Item.Link %>">
                                        <img src="/Images/<%#:Item.ImagePath%>"
                                            width="140" height="110" style="border: solid" /></a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="<%#:Item.Link%>">
                                        <span>
                                            <%#:Item.ArticleName%>
                                        </span>
                                    </a>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
        </div>
    </section>
</asp:Content>
