<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParkingRules.aspx.cs" Inherits="ParkingRules" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content12" ContentPlaceHolderID="MyContent" runat="server">
    <div style="width: 850px;">
        <h1>Parking Rules</h1>
        <p>
            **Note: The University defines a "park" as the standing of a vehicle that contains zero or more passengers.**
        </p>
        <blockquote>
            There are four parking lot types:
                 <ul>
                     <li>Faculty & Staff</li>
                     <li>Commuter & Student</li>
                     <li>Residential Student</li>
                     <li>Overflow</li>
                 </ul>
        </blockquote>
        <ul>
            <li>Faculty and staff lots are restricted parking only for those who work for the university. This is indicated by green lots on the Parking Map. Cars in the faculty and staff lots must have the proper faculty/staff parking decal on their car.</li>
            <li>Commuter student lots are restricted parking only for students that commute from off-campus residences. This is indicated by yellow lots on the Parking Map. Cars in the commuter student lot must have either the proper commuter parking decal, or a faculty/staff parking decal on their car.</li>
            <li>Residential student lots are restricted parking only for students that reside on campus property. This is indicated by red lots on the Parking Map. Cars in the resident student lot must have either the proper resident parking decal, or a faculty/staff parking decal on their car.</li>
            <li>Overflow lots are non-restricted parking for faculty and staff, students both commuter and resident, and non-registered visitors. This is indicated by orange lots on the Parking Map. Cars in the overflow lots must have a university parking decal (faculty/staff, commuter, resident), or a university-given car placard for temporary visitors.</li>
        </ul>
        <h2>Rules and Tips:</h2>
        <blockquote>
            <ul>
                <li>All cars parked on University property must have either a University parking decal or a University-given visitor placard.</li>
                <li>Register your vehicle every year within the first week of the academic year.</li>
                <li>Make sure to park with your vehicle back facing out--do not pull through spaces or back in.</li>
                <li>Place parking decals on the outside of the driver's side rear windshield.</li>
            </ul>
        </blockquote>
    </div>
</asp:Content>
