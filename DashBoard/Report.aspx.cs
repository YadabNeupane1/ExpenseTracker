using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DashBoard_Report : System.Web.UI.Page
{
    int userid;

    BLLExpense ble = new BLLExpense();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserId"] != null)
            {
                userid = (int)Session["UserId"];
                lblEmpty.Visible = true;
                SSrow.Visible = false;
            }
            else
            {
                Response.Redirect("../LoginSignup/Login.aspx");
            }
        }
    }
    public void showExpense()
    {
        userid = (int)Session["UserId"];
        DateTime from = Convert.ToDateTime(txtfrom.Text);
        DateTime to = Convert.ToDateTime(txtto.Text);
        hdFrom.Value = from.ToShortDateString();
        hdTo.Value = to.ToShortDateString();
        DataTable dt = ble.getExpenseByDateRange(userid, Convert.ToDateTime(from.ToShortDateString()), Convert.ToDateTime(to.ToShortDateString()));
        Session.Add("report", dt);
        if (dt.Rows.Count > 1)
        {
            SSrow.Visible = true;
        }
        gridReport.DataSource = dt;
        gridReport.DataBind();
        UpdateGridView.Update();
    }

    public decimal calculateTotalExpense()
    {
        DataTable dt = (DataTable)Session["report"];
        decimal total = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            total += Convert.ToDecimal(dt.Rows[i]["expenseAmount"]);
        }
        return total;
    }

    protected void btnGenerate_Click(object sender, EventArgs e)
    {
        showExpense();
        lblEmpty.Text = "From " + hdFrom.Value + " To " + hdTo.Value;
        txtto.Text = txtfrom.Text = string.Empty;
        gridReport.Columns[6].Visible = false;
        gridReport.Columns[2].Visible = false;
    }

    public void showSortedExpense(string sort)
    {
        userid = (int)Session["UserId"];
        DateTime from = Convert.ToDateTime(hdFrom.Value);
        DateTime to = Convert.ToDateTime(hdTo.Value);
        DataTable dt = ble.getAllSortedReport(userid, sort, Convert.ToDateTime(from.ToShortDateString()), Convert.ToDateTime(to.ToShortDateString()));
        gridReport.DataSource = dt;
        gridReport.DataBind();
        UpdateGridView.Update();
    }

    protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlSort.SelectedIndex != 0)
        {
            showSortedExpense(ddlSort.SelectedItem.ToString());
        }
    }

    protected void gridReport_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTotal = (Label)e.Row.FindControl("lblTotalExpense");
            lblTotal.Text = calculateTotalExpense().ToString();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //lblEmpty.Text = "All Report";
        if (Convert.ToInt32(ddlSearch.SelectedValue) != 0)
        {
            userid = (int)Session["UserId"];
            DateTime from = Convert.ToDateTime(hdFrom.Value);
            DateTime to = Convert.ToDateTime(hdTo.Value);
            DataTable dt = ble.getExpenseByDateRange(userid, Convert.ToDateTime(from.ToShortDateString()), Convert.ToDateTime(to.ToShortDateString()));
            DataTable td = dt.Clone();
            int check;
            var pointer = new List<int>();
            int k = 0, i;
            check = 0;
            for (i = 0; i < dt.Rows.Count; i++)
            {
                check = 0;
                if (ddlSearch.SelectedItem.ToString() == "Name")
                {
                    check = SearchString(dt.Rows[i]["expenseName"].ToString().ToLower(), txtSearch.Text.ToLower());
                }
                if (ddlSearch.SelectedItem.ToString() == "Cateogory")
                {
                    check = SearchString(dt.Rows[i]["expenseCatName"].ToString().ToLower(), txtSearch.Text.ToLower());
                }
                if (ddlSearch.SelectedItem.ToString() == "Amount")
                {
                    check = SearchString(dt.Rows[i]["expenseAmount"].ToString().ToLower(), txtSearch.Text.ToLower());
                }
                if (ddlSearch.SelectedItem.ToString() == "Description")
                {
                    check = SearchString(dt.Rows[i]["expenseDescription"].ToString().ToLower(), txtSearch.Text.ToLower());
                }
                if (check == 1)
                {
                    pointer.Add(i);
                }
            }

            for (i = 0; i < pointer.Count; i++)
            {
                td.ImportRow(dt.Rows[pointer[i]]);
            }
            Session.Add("report", td);
            gridReport.DataSource = td;
            gridReport.DataBind();
            pointer.Clear();
            txtSearch.Text = String.Empty;
        }
    }

    public int SearchString(string A, string B)
    {
        ulong siga = 0;
        ulong sigb = 0;
        ulong Q = 10007;
        ulong D = 256;
        int check = 0;

        if (A.Length < B.Length)
        {
            return 0;
        }

        for (int i = 0; i < B.Length; ++i)
        {
            siga = (siga * D + (ulong)A[i]) % Q;
            sigb = (sigb * D + (ulong)B[i]) % Q;
        }

        if (siga == sigb)
            check = 1;

        ulong pow = 1;

        for (int k = 1; k <= B.Length - 1; ++k)
            pow = (pow * D) % Q;

        for (int j = 1; j <= A.Length - B.Length; ++j)
        {
            siga = (siga + Q - pow * (ulong)A[j - 1] % Q) % Q;
            siga = (siga * D + (ulong)A[j + B.Length - 1]) % Q;

            if (siga == sigb)
                if (A.Substring(j, B.Length) == B)
                    check = 1;
        }
        if (check == 1)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
}