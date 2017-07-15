using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Attach script in page to the appropriate input TextBox
        InputTextBox.Attributes.Add("onkeyup", "InputTextBox_KeyUpEvent()");

        if (IsPostBack) // Form Submission
        {
            SubmitResult.Text = InputTextBox.Text + " was submitted via text completion.";

            if (SubmitSource.Value.ToUpper() == "FORM")
            {
                SubmitResult.Text = InputTextBox.Text + " was submitted via the Submit button.";
            }
        }

        // Reset the form submission source
        SubmitSource.Value = "FORM";

        // Reset the input value if desired?
        //InputTextBox.Text = "";

    }
}