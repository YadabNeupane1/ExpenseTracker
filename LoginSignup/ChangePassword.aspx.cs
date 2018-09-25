using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginSignup_ChangePassword1 : System.Web.UI.Page
{
    BLLUser user = new BLLUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {

            string Username = !string.IsNullOrEmpty(Request.QueryString["Username"]) ? Request.QueryString["Username"] : ToString();
            txtUserName.Text =user.Decrypt(Username);

        }
    }
    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        if (txtNewPassword.Text == txtConfirmPassword.Text)
        {
            String newpassword = user.Encrypt(txtNewPassword.Text);
            int i = user.changepassword(txtUserName.Text, newpassword);
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Password Successfully Changed');window.location ='Login.aspx';", true);
            }

        }
        else
        {
            Response.Write("<script>alert('Password doesn't match')</script>");
        }
    }
}