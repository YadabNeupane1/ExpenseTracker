using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DashBoard_Dashboard : System.Web.UI.Page
{
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
                showAmounts();
            }
            else
            {
                Response.Redirect("../LoginSignup/Login.aspx");
            }
            
        }
    }
    public void showAmounts()
    {        
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
        lblIncomeAmount.Text = "Rs. " + incomeTotal.ToString();
        lblExpenseAmount.Text = "Rs. " + expenseTotal.ToString();
        decimal balanceAmount = incomeTotal - expenseTotal;
        lblBalanceAmount.Text = "Rs. "+ balanceAmount.ToString();
        //Label3.Text = "Rs. " + incomeTotal.ToString();
        //Label1.Text = "Rs. " + expenseTotal.ToString();
        //Label2.Text = "Rs. " + balanceAmount.ToString();
    }
}