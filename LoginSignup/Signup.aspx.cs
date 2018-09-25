using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginSignup_Signup1 : System.Web.UI.Page
{
    BLLUser user = new BLLUser();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSignup_Click(object sender, EventArgs e)
    {
        if (txtUserName.Text=="admin" || txtUserName.Text=="Admin")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Username is invalid.');", true);
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
        else
        {
            DataTable dt = user.getUserByEmail(txtEmail.Text);
            if (dt.Rows.Count > 0)
            {
                //lblMessage.Text = "Email Already Used";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Email already used.');", true);
                txtEmail.Text = "";
                txtPassword.Text = "";
                txtConfirmPassword.Text = "";

            }
            else
            {
                DataTable dt1 = user.getUserByUsername(txtUserName.Text);
                if (dt1.Rows.Count > 0)
                {


                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Username already exists')", true);
                    txtUserName.Text = "";
                    txtPassword.Text = "";
                    txtConfirmPassword.Text = "";
                }
                else
                {
                    String password = user.Encrypt(txtPassword.Text);
                    String createdAt = DateTime.Now.ToString("yyyy-MM-dd");
                    String activationcode = Guid.NewGuid().ToString();
                    int id = user.addUserInfo(txtFirstName.Text + " " + txtLastName.Text, txtUserName.Text, password, txtPhone.Text, txtEmail.Text, txtAddress.Text, Convert.ToDateTime(createdAt), activationcode);
                    if (id > 0)
                    {
                        sendActivationCode(activationcode);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Registration successful. Activation email has been sent.');window.location ='Login.aspx';", true);
                    }
                }
            }
        }
    }
    public void sendActivationCode(String activationcode)
    {

        using (MailMessage mm = new MailMessage("expensetrackingproject@gmail.com", txtEmail.Text))
        {
            mm.Subject = "Account Activation";
            string body = "Hello " + (txtFirstName.Text + " " + txtLastName.Text).Trim() + ",";
            body += "<br /><br />Please click the following link to activate your account";
            body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("Signup.aspx", "Login.aspx?ActivationCode=" + activationcode) + "'>Click here to activate your account.</a>";
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
        }

    }
}