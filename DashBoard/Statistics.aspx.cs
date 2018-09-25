using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DashBoard_Statistics : System.Web.UI.Page
{
    BLLExpense ble = new BLLExpense();
    int userid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            userid = (int)Session["UserId"];
            //toJson();
        }
        else
        {
            Response.Redirect("../LoginSignup/Login.aspx");
        }
        
    }
    public void toJson(DataTable dt)
    {
        //DataTable dt = new DataTable();
        //userid = (int)Session["UserId"];
        //dt = ble.GetAllExpense(userid);
        string json = DataTableToJSONWithJavaScriptSerializer(dt);
        WriteTextAsync(json);
    }
    static async void WriteTextAsync(string text)
    {
        // Set a variable to the My Documents path.
        string mydocpath = Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments);
        //string mydocpath = Environment.GetFolderPath(Directory.GetCurrentDirectory());
        // Write the text asynchronously to a new file named "WriteTextAsync.txt".
        using (StreamWriter outputFile = new StreamWriter(Path.Combine(mydocpath, "Expense.json")))
        {
            await outputFile.WriteAsync(text);
        }
    }

    public string DataTableToJSONWithJavaScriptSerializer(DataTable table)
    {
        JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
        List<Dictionary<string, object>> parentRow = new List<Dictionary<string, object>>();
        Dictionary<string, object> childRow;
        foreach (DataRow row in table.Rows)
        {
            childRow = new Dictionary<string, object>();
            foreach (DataColumn col in table.Columns)
            {
                childRow.Add(col.ColumnName, row[col]);
            }
            parentRow.Add(childRow);
        }
        return jsSerializer.Serialize(parentRow);
    }

    protected void btnShow_Click(object sender, EventArgs e)
    {
        String year = ddlYear.SelectedValue.ToString();
        String month = ddlMonth.SelectedValue.ToString();
        String day = ddlDay.SelectedValue.ToString();
        if (Convert.ToInt32(ddlYear.SelectedValue) != 0) 
        {
            if (Convert.ToInt32(ddlMonth.SelectedValue) != 0)
            {
                if (Convert.ToInt32(ddlDay.SelectedValue) != 0)
                {
                    String date= month+"/"+day+"/"+year;
                    DateTime newDate = Convert.ToDateTime(date);
                    DataTable dt = ble.getExpenseByDateRange(userid, Convert.ToDateTime(newDate.ToShortDateString()), Convert.ToDateTime(newDate.ToShortDateString()));
                    toJson(dt);
                }
                else
                {
                    String stDate = month + "/01/" + year;
                    String enDate = month + "/30/" + year;
                    DateTime newStDate = Convert.ToDateTime(stDate);
                    DateTime newEnDate = Convert.ToDateTime(enDate);
                    DataTable dt = ble.getExpenseByDateRange(userid, Convert.ToDateTime(newStDate.ToShortDateString()), Convert.ToDateTime(newEnDate.ToShortDateString()));
                    toJson(dt);
                }
            }
            else
            {
                String stDate = "01/01/" + year;
                String enDate = "12/30/" + year;
                DateTime newStDate = Convert.ToDateTime(stDate);
                DateTime newEnDate = Convert.ToDateTime(enDate);
                DataTable dt = ble.getExpenseByDateRange(userid, Convert.ToDateTime(newStDate.ToShortDateString()), Convert.ToDateTime(newEnDate.ToShortDateString()));
                toJson(dt);
            }
        }
        else
        {
            ddlYear.Focus();
        }
        ddlYear.SelectedValue = 0.ToString();
        ddlMonth.SelectedValue = 0.ToString();
        ddlDay.SelectedValue = 0.ToString();
    }
}