<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="FAQ" MasterPageFile="~/Master.master" %>

<asp:Content ID="Content5" ContentPlaceHolderID="MyContent" runat="server">
    <div>
        <h1>Frequently Asked Questions</h1>
        <div class="faq">
            <p class="question">
                + What do I do if I can't remember my student ID number?
            </p>
            <div class="answer-wrapper">
                <p class="answer">Your student ID number can be looked up in the "Student Information" page on the student portal.</p>
            </div>
            <hr />
            <p class="question">
                + How do I register with Parking Services?
            </p>
            <div class="answer-wrapper">
                <p class="answer">
                    Click the "Help" link in the left sidebar for more information on how to login and register with Parking Services.
                    <br />
                    You will need to contact Parking Services in order to activate your student ID and receive a PIN number for registration.
                </p>
            </div>
            <hr />
            <p class="question">
                + I just registered my student ID with Parking Services and I have received my PIN number. What do I do now?
            </p>
            <div class="answer-wrapper">
                <p class="answer">
                    After successfully registering your student ID with Parking Services, a PIN number is assigned to all accounts.
                    <br />
                    The PIN number is used for validating your account when you register on the page.
                    <br />
                    When registering your account, passwords must meet the following three criteria:<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;1.  Passswords must be at least 8 characters long<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;2.  Passwords must contain at least one letter, uppercase or lowercase.<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;3.  Passwords must contain at least one number<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;4.  Re-enter your password in the "Re-Enter Password" field to confirm your password.
                </p>
            </div>
            <hr />
            <p class="question">
                + I am a commuter, where am I able to park?
            </p>
            <div class="answer-wrapper">
                <p class="answer">A campus map can be accessed at XXXXXXXXXXXXXX</p>
            </div>
            <hr />
        </div>
        <script type="text/javascript" src="/Info/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="/Info/toggleFAQ.js"></script>
    </div>
</asp:Content>
