<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Form Input OnChange Submit</h1>
        <h2>Proof of Concept</h2>
        <p class="lead">This application demonstrates how to monitor input event changes in a WebForms project without using jQuery libraries.</p>
        <p>jQuery is included only as a Bootstrap dependency.</p>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h2>The following form will be submitted in one of two ways:</h2>
            <ol>
                <li>Type a 5 digit number into the input box -or-</li>
                <li>Click the Submit button</li>
            </ol>
            <p>
                <input id="SubmitSource" name="SubmitSource" type="hidden" value="FORM" runat="server" />
                <asp:textbox runat="server" id="InputTextBox" />
                <input type="submit" value="Submit" />
            </p>  
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-info">
                <asp:Label runat="server" Font-Bold="true">Result:</asp:Label>
                <asp:label runat="server" id="SubmitResult">Submit the form via one of the methods above to get a result.</asp:label>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function InputTextBox_KeyUpEvent() {
            // We are using javascript to avoid a postpack action for each keyup and subsequent poor UX.
            // Here is an example of postback on keypress for posterity:
            // https://www.codeproject.com/Questions/670649/How-to-call-a-Csharp-Method-on-KeyPress-of-the-Tex

            var testValue = document.getElementById('MainContent_InputTextBox').value;
            if (isNumeric(testValue)) {
                if (testValue.length == 5) {
                    // Set Submission Source
                    document.getElementById('MainContent_SubmitSource').value = 'INPUTCHANGE';

                    // Submit the form
                    // The form is not named or given an Id attribute, so submit the first (and only) form from the collection.
                    document.forms[0].submit();
                }
            }
        }

        function isNumeric(n) {
            return !isNaN(parseFloat(n)) && isFinite(n);
        }
    </script>

</asp:Content>
