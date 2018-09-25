using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DashBoard_Incomes : System.Web.UI.Page
{
    int userid = 0;
    BLLIncome bli = new BLLIncome();
    BLLCategory blc = new BLLCategory();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlAddPopup.Visible = false;
            if (Session["UserId"] != null)
            {
                userid = (int)Session["UserId"];
                showDDL();
                txtDate.Text = DateTime.Today.ToShortDateString();
                if (bli.GetAllIncome(userid) == null)
                {
                    lblMessage.Text = "No Data Found";
                }
                else
                {
                    showIncomes();
                }
            }
            else
            {
                Response.Redirect("../LoginSignup/Login.aspx");
            }

        }
    }
    public void showDDL()
    {
        userid = (int)Session["UserId"];
        DataTable dt = blc.GetAllIncomeCategory(userid);
        ddlCateogory.DataSource = dt;
        ddlCateogory.DataTextField = "IncomeCatname";
        ddlCateogory.DataValueField = "IncomeCatid";
        ddlCateogory.DataBind();
        ddlCateogory.Items.Insert(0, "Choose any");
    }
    public void showIncomes()
    {
        userid = (int)Session["UserId"];
        DataTable dt = bli.GetAllIncome(userid);
        GridView1.DataSource = dt;
        GridView1.DataBind();
        UpdateGridView.Update();
    }
    public void clearInput()
    {
        //txtName.Text = string.Empty;
        txtAmount.Text = string.Empty;
        txtDescription.Text = string.Empty;
        txtDate.Text = DateTime.Today.ToShortDateString();
        ddlCateogory.SelectedIndex = 0;
        //ddlStatus.SelectedIndex = 0;
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        userid = (int)Session["UserId"];
        DateTime d = Convert.ToDateTime(txtDate.Text);
        int i = bli.InsertIncome(Convert.ToInt32(ddlCateogory.SelectedValue.ToString()), 1,
            Convert.ToDecimal(txtAmount.Text), Convert.ToDateTime(d.ToShortDateString()),
            txtDescription.Text.ToString(), userid);
        if (i > 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Income Added')", true);
            showIncomes();
            clearInput();
        }
    }

    public void showPopupCategory()
    {
        userid = (int)Session["UserId"];
        DataTable dt = blc.GetAllIncomeCategory(userid);
        ddleditCategory.DataSource = dt;
        ddleditCategory.DataTextField = "IncomeCatname";
        ddleditCategory.DataValueField = "IncomeCatid";
        ddleditCategory.DataBind();
    }

    protected void ibtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)((ImageButton)sender).NamingContainer;
        Int32 incomeId = Convert.ToInt32(GridView1.DataKeys[gvRow.RowIndex].Value);
        int i = bli.DeleteIncome(incomeId);
        if (i > 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Income Deleted')", true);
            showIncomes();
        }
    }

    protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)((ImageButton)sender).NamingContainer;
        Int32 incomeid = Convert.ToInt32(GridView1.DataKeys[gvRow.RowIndex].Value);


        DataTable dtbl = bli.GetIncomeByIncomeId(incomeid);
        showPopupCategory();
        hfUserID.Value = dtbl.Rows[0]["incomeId"].ToString();
        ddleditCategory.Text = dtbl.Rows[0]["incomeCatId"].ToString();
        txteditAmount.Text = dtbl.Rows[0]["incomeAmount"].ToString();
        txteditDate.Text = Convert.ToDateTime(dtbl.Rows[0]["incomeDate"]).ToShortDateString();
        txteditDescription.Text = dtbl.Rows[0]["incomeDescription"].ToString();

        pnlAddPopup.Visible = true;
        EditPopup.Show();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        DateTime d = Convert.ToDateTime(txteditDate.Text);
        String desc = txteditDescription.Text.ToString();
        int i = bli.UpdateIncome(Convert.ToInt32(ddleditCategory.SelectedValue.ToString()),
            Convert.ToDecimal(txteditAmount.Text), Convert.ToDateTime(d.ToShortDateString()),
            txteditDescription.Text, Convert.ToInt32(hfUserID.Value.ToString()));
        if (i > 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Income Edited.')", true);
            showIncomes();
            clearInput();
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        EditPopup.Hide();
    }
}