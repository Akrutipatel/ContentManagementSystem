﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UserInterface/VirtualClassroom/VirtualClass.Master"
    AutoEventWireup="true" CodeBehind="VirtualClass.aspx.cs" Inherits="CMS.VirtualClass1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Virtual Class - Content Management System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="checkbox" runat="server">
<form id="mainForm" runat="server" style="margin: 0 0 0px;">
    <div>
        <div class="row-fluid sortable">
            <div class="box span12">
                <div class="box-header well" data-original-title>
                    <h2>
                        <i class="icon-th"></i>&nbsp;&nbsp;Browse Virtual Classes
                    </h2>
                </div>
                <div class="box-content">
                    <div class="row-fluid">
                        <div class="span4">
                            <div class="control-group">
                                <label class="control-label" for="selectError">
                                    <h6>
                                        Select Semester
                                    </h6>
                                </label>
                                <div class="controls">
                                    <asp:DropDownList ID="ddlSem" AutoPostBack="true" class="input-large span10" runat="server"
                                        onchange="loadClasses();" Style="width: auto;">
                                        <asp:ListItem Value="">Select Semester</asp:ListItem>
                                        <asp:ListItem Value="1">Sem-1</asp:ListItem>
                                        <asp:ListItem Value="2">Sem-2</asp:ListItem>
                                        <asp:ListItem Value="3">Sem-3</asp:ListItem>
                                        <asp:ListItem Value="4">Sem-4</asp:ListItem>
                                        <asp:ListItem Value="5">Sem-5</asp:ListItem>
                                        <asp:ListItem Value="6">Sem-6</asp:ListItem>
                                        <asp:ListItem Value="7">Sem-7</asp:ListItem>
                                        <asp:ListItem Value="8">Sem-8</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="span4">
                            <div class="control-group">
                                <label class="control-label" for="selectError">
                                    <h6>
                                        Select Class</h6>
                                </label>
                                <div class="controls">
                                    <asp:DropDownList ID="ddlClass" AutoPostBack="true" AppendDataBoundItems="true" class="input-large span10"
                                        runat="server" onchange="refreshClassName();" OnSelectedIndexChanged="loadVideoList"
                                        Style="width: auto;">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/span-->
        </div>
        <!--/row-->
    </div>
    <div id="home" class="row-fluid sortable" style="display: block">
        <div class="box span12">
            <div id="className" class="box-header well">
                <h2>
                    <i class="icon-picture"></i>&nbsp;&nbsp;<%= ddlClass.SelectedItem.Text%>
                </h2>
            </div>
            <div id="Div1" style="display: block" class="box-content" runat="server">
                <div class="row-fluid show-grid">
                    <div class="span8">
                        <div id="player">
                            <iframe id="play" width="700" height="400" src="<%=defaultURL%>" frameborder="0"
                                allowfullscreen="true"></iframe>
                        </div>
                    </div>
                    <div class="span4" id="player_content">
                        <%=defaultDescription %>
                    </div>
                </div>
            </div>
        </div>
        <!--/span-->
    </div>
    <div id="Div2" class="row-fluid sortable" style="display: block">
        <div class="box span12">
            <div id="Div3" class="box-header well">
                <h2>
                    <i class="icon-picture"></i>&nbsp;&nbsp;Browse More Videos From This Class..
                </h2>
            </div>
            <div id="Div5" style="display: block" class="box-content" runat="server">
                <%--<div class="row-fluid show-grid">
                <div class="span12" style="text-align: left; font-weight: 600; margin-bottom: 10px; padding-left: 10px;">
                    More Videos From This Class..
                </div>
                </div>--%>
                <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlClass" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Repeater ID="rep1" runat="server">
                            <HeaderTemplate>
                                <div id="videolist" class="row-fluid show-grid">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%--<div class="span4" style="width:100%">
                                <td style="height: 90px; margin: 0 8px 0 0; margin-bottom: 15px;">--%>
                                <div class="span3" style="margin-left: 1px; margin-bottom: 15px; margin-right: 15px;
                                    background-color: white;">
                                    <%--<a href='javascript:refreshIframe("<%# Eval("key") %>","<%# Eval("description") %>")'
                                        id='<%# Eval("id") %>' onclick="refreshIframe();">
                                        <%# Eval("title") %>
                                        <span style="margin-top: 10px;">
                                            <img width="auto" alt="" src="<%# getThLink(Eval("key").ToString()) %>" />
                                        </span></a>--%>
                                    <p style="margin: 0px 0px 0px 0px;">
                                        <a class="hovertext" href='javascript:refreshIframe("<%# Eval("key") %>","<%# Eval("description") %>")'
                                            title="<%# Eval("title") %>">
                                            <img src="<%# getThLink(Eval("key").ToString()) %>" height="auto" border="0" alt=""></a></p>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <!--/span-->
    </div>
    <div id="Div4" class="row-fluid sortable" style="display: block">
        <div class="box span12">
            <div id="Div5" class="box-header well">
                <h2>
                    <i class="icon-picture"></i>&nbsp;&nbsp;List Of Related Files
                </h2>
            </div>
            <div class="row-fluid show-grid">
            </div>
        </div>
        <!--/span-->
    </div>
    <script type="text/javascript">
        function refreshIframe(link, desc) {
            var str = "http://www.youtube.com/embed/" + link;
            var description = desc;
            document.getElementById('play').src = str;
            document.getElementById("player_content").innerHTML = description;
            //document.getElementById('iframeID').contentWindow.location.reload();
        }

        function refreshClassName(className) {
            document.getElementById('className').innerHTML = className;
            document.getElementById('home').style = "display : block";
        }

        function loadAllDefaults() {
            var pageUrl = '<%=ResolveUrl("~/UserInterface/StaffPortal/VirtualClass.aspx")%>';
            var className = '{className:"' + $('#<%=ddlClass.ClientID%> option:selected').html() + '"}';
            $.ajax({
                type: "POST",
                url: pageUrl + '/loadPageDefaults',
                data: className,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    loadDefaults(response.d);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }
        function loadDefaults(list) {
            if (list.length > 0) {
                $.each(list, function () {
                    refreshIframe(this['Text'], this['Value']);
                });
            }
            else {
                alert("Something Went Wrong!!");
            }
        }
    </script>
    <style type="text/css">
                    a.hovertext
                    {
                        position: relative;
                        
                        text-decoration: none !important;
                        text-align: center;
                    }
                    a.hovertext:after
                    {
                        content: attr(title);
                        position: absolute;
                        left: 0;
                        bottom: 0;
                        padding: 0.5em 20px;
                        <%--width: 460px;--%>
                        background: rgba(0,0,0,0.8);
                        text-decoration: none !important;
                        color: #fff;
                        opacity: 0;
                        -webkit-transition: 0.5s;
                        -moz-transition: 0.5s;
                        -o-transition: 0.5s;
                        -ms-transition: 0.5s;
                    }
                    a.hovertext:hover:after, a.hovertext:focus:after
                    {
                        opacity: 1.0;
                    }
                </style>
                </form>
</asp:Content>