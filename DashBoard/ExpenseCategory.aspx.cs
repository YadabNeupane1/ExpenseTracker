using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DashBoard_ExpensesCategory : System.Web.UI.Page
{
    int userid;
    BLLCategory blc = new BLLCategory();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlAddPopup.Visible = false;
            if (Session["UserId"] != null)
            {
                loadCategories();

            }
            else
            {
                Response.Redirect("../LoginSignup/Login.aspx");
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        userid = (int)Session["UserId"];
        if (txtCategory.Text.ToString() != String.Empty)
        {
            DataTable dt = blc.SearchbyExpenseCatName(txtCategory.Text, userid);
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Category already exists.');", true);
                txtCategory.Text = string.Empty;
                txtCategory.Focus();
            }
            else
            {
                int i = blc.InsertExpenseCategory(txtCategory.Text, 1, userid);
                if (i > 0)
                {
                    loadCategories();
                    txtCategory.Text = string.Empty;
                }
            }
        }
        else
        {
            txtCategory.Focus();
        }

    }
    public void loadCategories()
    {
        userid = (int)Session["UserId"];
        DataTable dt = blc.GetAllExpenseCategory(userid);
        gridExpenseCategories.DataSource = dt;
        gridExpenseCategories.DataBind();
    }

    protected void gridExpenseCategories_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridExpenseCategories.PageIndex = e.NewPageIndex;
        loadCategories();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        userid = (int)Session["UserId"];
        DataTable dt = blc.SearchbyExpenseCatName(txteditCategory.Text, userid);
        if (dt.Rows.Count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Category already exists.');", true);
            txteditCategory.Text = string.Empty;
            txteditCategory.Focus();
        }
        else
        {
            int i = blc.UpdateExpenseCategory(txteditCategory.Text, Convert.ToInt32(hfUserID.Value));
            if (i > 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Edit Successful');", true);
                loadCategories();
                txteditCategory.Text = string.Empty;
            }
        }

    }

    protected void ibtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)((ImageButton)sender).NamingContainer;
        Int32 Id = Convert.ToInt32(gridExpenseCategories.DataKeys[gvRow.RowIndex].Value);
        int i = blc.DeleteExpenseCategory(Id);
        if (i > 0)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Expense Deleted');", true);
            loadCategories();
        }
    }

    protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)((ImageButton)sender).NamingContainer;
        Int32 id = Convert.ToInt32(gridExpenseCategories.DataKeys[gvRow.RowIndex].Value);

        DataTable dt = blc.GetExpenseCategoryById(id);

        hfUserID.Value = dt.Rows[0]["expenseCatId"].ToString();
        txteditCategory.Text = dt.Rows[0]["expenseCatName"].ToString();
        pnlAddPopup.Visible = true;
        EditPopup.Show();
    }
}