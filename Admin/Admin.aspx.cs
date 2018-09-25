using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.Page
{
    BLLUser user = new BLLUser();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserName"] != null)
            {
                admin();
            }
            else
            {
                Response.Redirect("../LoginSignup/Login.aspx");
            }
        }

    }

    private void admin()
    {
        DataTable dt = user.admin();
        gridAdmin.DataSource = dt;
        gridAdmin.DataBind();
        UpdateGridView.Update();
    }


    protected void ibtnDelete_Click(object sender, ImageClickEventArgs e)
    {
        GridViewRow gvRow = (GridViewRow)((ImageButton)sender).NamingContainer;
        Int32 uid = Convert.ToInt32(gridAdmin.DataKeys[gvRow.RowIndex].Value);
        int i = user.DeleteUser(uid);
        if (i > 0)
        {
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('User Removed');", true);
            admin();
        }
    }

    protected void gridAdmin_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gridAdmin.PageIndex = e.NewPageIndex;
        admin();
    }
}