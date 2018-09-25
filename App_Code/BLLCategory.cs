using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for BLLCategory
/// </summary>
public class BLLCategory
{
    public BLLCategory()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int InsertIncomeCategory(String income, int status,int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "IncomeCategory_CUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@in", income);
        cmd.Parameters.AddWithValue("@s", status);
        cmd.Parameters.AddWithValue("@uid", id);
        cmd.Parameters.AddWithValue("@method", "Insert");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int UpdateIncomeCategory(string category, int catid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "IncomeCategory_CUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@in", category);
        cmd.Parameters.AddWithValue("@icatid", catid);
        cmd.Parameters.AddWithValue("@method", "Update");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int DeleteIncomeCategory(int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "IncomeCategory_CUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@icatid", id);
        cmd.Parameters.AddWithValue("@method", "Delete");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public DataTable GetIncomeCategoryById(int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getIncomeCategoryById";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@icatid", id);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }

    public int InsertExpenseCategory(string expense, int status, int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ExpenseCategory_CUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@cn", expense);
        cmd.Parameters.AddWithValue("@s", status);
        cmd.Parameters.AddWithValue("@uid", id);
        cmd.Parameters.AddWithValue("@method", "Insert");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int UpdateExpenseCategory(string category, int catid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ExpenseCategory_CUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@cn", category);
        cmd.Parameters.AddWithValue("@ecatid", catid);
        cmd.Parameters.AddWithValue("@method", "Update");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int DeleteExpenseCategory(int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ExpenseCategory_CUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@ecatid", id);
        cmd.Parameters.AddWithValue("@method", "Delete");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public DataTable GetExpenseCategoryById(int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getExpenseCategoryById";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@ecatid", id);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }
    public DataTable GetAllIncomeCategory(int userid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "getAllIncomeCategory";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", userid);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        adapter.Fill(dt);
        return dt;
    }
    public DataTable GetAllExpenseCategory(int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getAllExpenseCategory";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", id);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        adapter.Fill(dt);
        return dt;
    }
    public DataTable SearchbyIncomeCatName(string catname, int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "searchByIncomeCatName";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@catname", catname);
        cmd.Parameters.AddWithValue("@uid", id);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        adapter.Fill(dt);
        return dt;
    }
    public DataTable SearchbyExpenseCatName(string catname, int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "searchByExpenseCatName";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@catname", catname);
        cmd.Parameters.AddWithValue("@uid", id);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();
        adapter.Fill(dt);
        return dt;
    }
}