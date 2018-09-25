using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DashBoard_MasterDashboard : System.Web.UI.MasterPage
{
    BLLUser user = new BLLUser();
    BLLIncome bli = new BLLIncome();
    BLLExpense ble = new BLLExpense();
    int userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] != null)
            {
                userid = (int)Session["UserId"];
                DataTable dt = user.getUserInformation(userid);
                lblUserName.Text = Convert.ToString(dt.Rows[0]["FullName"]);
                lblNotificationCount.Text = "0";
                showNotification();
            }
            else
            {
                Response.Redirect("../LoginSignup/Login.aspx");
            }
        }
    }

    public void showNotification()
    {
        userid = (int)Session["UserId"];
        DataTable di = bli.GetOnlyIncomes(userid);
        decimal incomeTotal = 0;
        for (int i = 0; i < di.Rows.Count; i++)
        {
            incomeTotal += Convert.ToDecimal(di.Rows[i]["incomeAmount"].ToString());
        }

        DataTable de = ble.GetOnlyExpenses(userid);
        decimal expenseTotal = 0;
        for (int i = 0; i < de.Rows.Count; i++)
        {
            expenseTotal += Convert.ToDecimal(de.Rows[i]["expenseAmount"].ToString());
        }
        if (incomeTotal != 0) 
        {
            decimal savingPercent = ((incomeTotal - expenseTotal) / incomeTotal) * 100;
            decimal expensePercent = (expenseTotal / incomeTotal) * 100;
            savingPercent = System.Math.Round(savingPercent, 2);

            if (savingPercent <= 20)
            {
                lblNotificationCount.Text = (Convert.ToInt32(lblNotificationCount.Text) + 1).ToString();
                notificationMessage.InnerText = "Current saving has declined below 20%";
            }
            else
            {
                notificationMessage.InnerText = "No Notification";
            }
        }
        
    }

    public void addDiv(int c)
    {
        Literal myLiteral = new Literal();
        myLiteral.Text = "<a class='dropdown-item'><div style='height:50px;'>" +
                            "<p id='notificationMessage" + c.ToString() + "' runat='server'>Added</p></div></a>";
        PlaceHolder.Controls.Add(myLiteral);
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("../LoginSignup/Login.aspx");
    }
}
