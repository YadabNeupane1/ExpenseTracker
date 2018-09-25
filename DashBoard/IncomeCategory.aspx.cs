using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DashBoard_IncomesCategory : System.Web.UI.Page
{
    BLLCategory blc = new BLLCategory();
    int userid = 0;
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
    public void loadCategories()
    {
        userid = (int)Session["UserId"];
        DataTable dt = blc.GetAllIncomeCategory(userid);
        gridIncomeCategories.DataSource = dt;
        gridIncomeCategories.DataBind();
    }


    protected void btnAdd_Click(object sender, EventArgs e)
    {
        userid = (int)Session["UserId"];
        if (txtCategory.Text.ToString() != String.Empty)
        {
            DataTable dt = blc.SearchbyIncomeCatName(txtCategory.Text, userid);
            if (dt.Rows.Count > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Category already exists.')", true);
                txtCategory.Text = string.Empty;
                txtCategory.Focus();
            }
            else
            {
                int i = blc.InsertIncomeCategory(txtCategory.Text, 1, userid);
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

    protected void gridIncomeCategories_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridIncomeCategories.PageIndex = e.NewPageIndex;
        loadCategories();
    }

    protected void ibtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)((ImageButton)sender).NamingContainer;
        Int32 Id = Convert.ToInt32(gridIncomeCategories.DataKeys[gvRow.RowIndex].Value);
        int i = blc.DeleteIncomeCategory(Id);
        if (i > 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Income Category Deleted.')", true);
            
            loadCategories();
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        userid = (int)Session["UserId"];
        DataTable dt = blc.SearchbyIncomeCatName(txteditCategory.Text, userid);
        if (dt.Rows.Count > 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Category already exists.')", true);
            txteditCategory.Text = string.Empty;
            txteditCategory.Focus();
        }
        else
        {
            int i = blc.UpdateIncomeCategory(txteditCategory.Text, Convert.ToInt32(hfUserID.Value));
            if (i > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Edit Successful')", true);
                loadCategories();
                txteditCategory.Text = string.Empty;
            }
        }
    }

    protected void ibtnEdit_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)((ImageButton)sender).NamingContainer;
        Int32 id = Convert.ToInt32(gridIncomeCategories.DataKeys[gvRow.RowIndex].Value);

        DataTable dt = blc.GetIncomeCategoryById(id);

        hfUserID.Value = dt.Rows[0]["incomeCatId"].ToString();
        txteditCategory.Text = dt.Rows[0]["incomeCatName"].ToString();
        pnlAddPopup.Visible = true;
        EditPopup.Show();
    }
}