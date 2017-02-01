<%@ Page Language="C#" AutoEventWireup="true" CodeFile="/Info/Map.aspx.cs" Inherits="Map" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content11" ContentPlaceHolderID="MyContent" runat="server">
    <script type="text/javascript" src='/Info/js/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='/Info/js/jquery.elevatezoom.js'></script>
    <h1>Campus Map</h1>
    <br />
    <img id="zoom_01" src='/images/canvassmall.png' data-zoom-image="/images/canvas.png" alt="" />
    <script type="text/javascript">
        $('#zoom_01').elevateZoom({
            scrollZoom: true,
            zoomWindowFadeIn: 500,
            zoomWindowFadeOut: 100
        });
    </script>
</asp:Content>





