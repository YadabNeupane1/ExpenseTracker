using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginSignup_AccountRecovery1 : System.Web.UI.Page
{
    BLLUser user = new BLLUser();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        DataTable dt = user.getLoginInfo(txtUserName.Text);
        if (dt.Rows.Count > 0)
        {
            
            int userid = Convert.ToInt32(dt.Rows[0]["UserId"]);
            DataTable dt1 = user.getUserInformation(userid);
            String email = Convert.ToString(dt1.Rows[0]["Email"]);
            if (email == txtEmail.Text)
            {
                String username = user.Encrypt(txtUserName.Text);
                using (MailMessage mm = new MailMessage("expensetrackingsystemproject@gmail.com", email))
                {
                    mm.Subject = "Password Recovery(Expense Tracking System)";
                    string body = "Hello " + (dt1.Rows[0]["FullName"].ToString()).Trim() + ",";
                    body += "<br /><br />Please click the following link to change your account password";
                    body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("AccountRecovery.aspx", "ChangePassword.aspx?Username=" + username) + "'>Click here to change your account password.</a>";
                    body += "<br /><br />Thanks";
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential NetworkCred = new NetworkCredential("expensetrackingsystemproject@gmail.com", "expense123");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = NetworkCred;
                    smtp.Port = 587;
                    smtp.Send(mm);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('An Email has been sent.');window.location ='Login.aspx';", true);
                }
            }
            else
            {
                Response.Write("<script>alert('Incorrect Email.')</script>");
                //lblMessage.Text = "Incorrect Email.";
                txtUserName.Text = "";
                txtEmail.Text = "";
            }

        }
        else
        {
            Response.Write("<script>alert('Incorrect UserName')</script>");
            //lblMessage.Text = "Incorrect UserName";
            txtUserName.Text = "";
            txtEmail.Text = "";
        }
    }
}