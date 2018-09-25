using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DashBoard_Analysis : System.Web.UI.Page
{
    int userid;
    BLLExpense ble = new BLLExpense();
    BLLIncome bli = new BLLIncome();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] != null)
            {
                showPercent();
                showMonths();
                //Label1.Text = "The next month's expense is forecasted to be around Rs. " + nxtExpense.ToString();
            }
            else
            {
                Response.Redirect("../LoginSignup/Login.aspx");
            }

        }
    }
    
    public void forecast(double[] arr)
    {
        double exp = 0.4 * arr[0] + 0.3 * arr[1] + 0.2 * arr[2] + 0.1 * arr[3];
        String m = getMonthName(Convert.ToInt32( DateTime.Today.Month));
        lblP1.Text = m.ToString();
        lblPE1.Text = "Rs " + exp.ToString();
    }
    public void showMonths()
    {
        userid = (int)Session["UserId"];
        DateTime today = DateTime.Today;
        int mth = today.Month;
        int[] k=new int[4];
        String[] str = new String[4];
        for (int i = 0; i < 4; i++)
        {
            k[i] = (mth - (i + 1) + 12) % 12;
            str[i] = getMonthName(k[i]);
        }
        lblM1.Text = str[0];
        lblM2.Text = str[1];
        lblM3.Text = str[2];
        lblM4.Text = str[3];
        double[] sum = new double[4];
        double total = 0;
        int l = 0;
        for (int i = 0; i < 4; i++)
        {
            DateTime stdate = new DateTime(2018, k[i], 01);
            DateTime endate;
            if (k[i]==2)
            {
                endate = new DateTime(2018, k[i], 28);
            }
            else
            {
                endate = new DateTime(2018, k[i], 30);
            }
            DataTable td = ble.getExpenseByDateRange(userid, stdate, endate);
            total = 0;
            for (int j = 0; j < td.Rows.Count; j++)
            {
                total += Convert.ToDouble(td.Rows[j]["expenseAmount"]);
            }
            sum[l++] = Convert.ToInt32(total);
        }
        lblE1.Text = "Rs " + sum[0].ToString();
        lblE2.Text = "Rs " + sum[1].ToString();
        lblE3.Text = "Rs " + sum[2].ToString();
        lblE4.Text = "Rs " + sum[3].ToString();
        forecast(sum);
    }
    public void showPercent()
    {
        userid = (int)Session["UserId"];
        DateTime today = DateTime.Today;
        int mth = today.Month;
        int yr = today.Year;
        int day = today.Day;
        if (day < 15)
        {
            mth = mth - 1;
            if (mth==0)
            {
                mth = 12;
            }
        }
        DateTime st = new DateTime(yr, mth, 01);
        DateTime en;
        if (mth == 2)
        {
            en = new DateTime(yr, mth, 28);
        }
        else
        {
            en = new DateTime(yr, mth, 30);
        }
        DataTable di = bli.GetMonthlyIncome(userid,st,en);
        decimal incomeTotal = 0;
        for (int i = 0; i < di.Rows.Count; i++)
        {
            incomeTotal += Convert.ToDecimal(di.Rows[i]["incomeAmount"].ToString());
        }
        DataTable de = ble.GetMonthlyExpenses(userid,st,en);
        decimal expenseTotal = 0;
        for (int i = 0; i < de.Rows.Count; i++)
        {
            expenseTotal += Convert.ToDecimal(de.Rows[i]["expenseAmount"].ToString());
        }
        decimal savingPercent=0;
        decimal expensePercent=0;
        if (incomeTotal != 0)
        {
            savingPercent = ((incomeTotal - expenseTotal) / incomeTotal) * 100;
            expensePercent = (expenseTotal / incomeTotal) * 100;
            savingPercent = System.Math.Round(savingPercent, 2);            
        }
        String mahina = getMonthName(mth);
        label3.Text = mahina + "'s Income";
        label2.Text = mahina + "'s Expense";
        lblMonthlyIncome.Text = "Rs " + incomeTotal.ToString();
        lblMonthlyExpense.Text = "Rs "+expenseTotal.ToString();
        label.Text = mahina + "'s saving";
        lblMonthlySaving.Text = savingPercent.ToString() + " %";
    }
    public string getMonthName(int month)
    {
        if (month == 1) 
        {
            return "January";
        }
        if (month == 2) 
        {
            return "Feburary";
        }
        if (month == 3) 
        {
            return "March";
        }
        if (month == 4) 
        {
            return "April";
        }
        if (month == 5) 
        {
            return "May";
        }
        if (month == 6) 
        {
            return "June";
        }
        if (month == 7) 
        {
            return "July";
        }
        if (month == 8) 
        {
            return "August";
        }
        if (month == 9) 
        {
            return "September";
        }
        if (month == 10) 
        {
            return "October";
        }
        if (month == 11) 
        {
            return "November";
        }
        if (month == 12) 
        {
            return "December";
        }
        return "error";
    }
}