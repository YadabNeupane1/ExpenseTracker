using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginSignup_Signin : System.Web.UI.Page
{
    BLLUser user = new BLLUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            
            string activationCode = !string.IsNullOrEmpty(Request.QueryString["ActivationCode"]) ? Request.QueryString["ActivationCode"] : Guid.Empty.ToString();
            int i = user.activationSuccessful(activationCode);

        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text == "admin" && txtPassword.Text=="admin")
        {
            Session["Username"] = "admin";
            Response.Redirect("../Admin/Admin.aspx");
        }
        else
        {
            String password = user.Encrypt(txtPassword.Text);
            DataTable dt = user.getLoginInfo(txtUserName.Text, password);
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToString(dt.Rows[0]["Status"]) == "Enable")
                {
                    Session["UserId"] = Convert.ToInt32(dt.Rows[0]["UserId"]);
                    Session["UserName"] = (dt.Rows[0]["UserName"]).ToString();
                    Response.Redirect("../DashBoard/Dashboard.aspx");
                }
                else
                {

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User not Verified')", true);
                    txtPassword.Text = "";

                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Incorrect Username and Password')", true);

                txtUserName.Text = "";
                txtPassword.Text = "";
            }
        }
        

    }
}