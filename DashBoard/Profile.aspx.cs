using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DashBoard_Profile : System.Web.UI.Page
{
    BLLUser user = new BLLUser();
    int userid;
    String Username;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] != null)
            {
                userid = (int)Session["UserId"];
                Username = (String)Session["UserName"];
                DataTable dt = user.getUserInformation(userid);
                txtUserName.Text = Username;
                txtFullName.Text = dt.Rows[0]["FullName"].ToString();
                txtEmail.Text = dt.Rows[0]["Email"].ToString();
                txtAddress.Text = dt.Rows[0]["Address"].ToString();
                txtPhone.Text = dt.Rows[0]["Phone"].ToString();
                DateTime date = Convert.ToDateTime(dt.Rows[0]["CreatedAt"]);
                lblCreatedAt.Text = date.ToShortDateString();
                pnlAddPopup.Visible = false;
            }
            else
            {
                Response.Redirect("../LoginSignup/Login.aspx");
            }
        }
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        userid = (int)Session["UserId"];
        hfUserID.Value = userid.ToString();
        EditPopup.Show();
        pnlAddPopup.Visible = true;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int i = user.UpdateProfile(txtEmail.Text, txtFullName.Text, txtAddress.Text, txtPhone.Text);
        if (i > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Profile Successfully Updated.');", true);
        }
    }

    protected void btnChange_Click(object sender, EventArgs e)
    {
        Username = (String)Session["UserName"];
        userid = (int)Session["UserId"];
        DataTable dt = user.getPasswordByUsername(Username);
        String oldPass = user.Encrypt(txtOldPassword.Text);
        if (oldPass == dt.Rows[0]["Password"].ToString())
        {
            String password = user.Encrypt(txtNewPassword.Text);
            int i = user.changepassword(Username, password);
            if (i > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Password Successfully Changed.');", true);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Old Password Wrong');", true);
        }
    }
}