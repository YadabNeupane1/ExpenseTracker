using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for BLLExpense
/// </summary>
public class BLLExpense
{
    public BLLExpense()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable GetAllExpense(int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getAllExpense";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", id);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }

    public DataTable GetAllSortedExpense(int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getAllSortedExpense";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", id);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }
    public DataTable getAllSortedExpense(int id, string method)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "Expense_sort";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", id);
        cmd.Parameters.AddWithValue("@method", method);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }
    public DataTable getAllSortedReport(int id, string method,DateTime from,DateTime to)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "Report_sort";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", id);
        cmd.Parameters.AddWithValue("@method", method);
        cmd.Parameters.AddWithValue("@from", from);
        cmd.Parameters.AddWithValue("@to", to);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }
    public int InsertExpense(int iid, int status, string name, decimal amount, DateTime date, string desc, int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "Expense_CRUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@ecatid", iid);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@amount", amount);
        cmd.Parameters.AddWithValue("@desc", desc);
        cmd.Parameters.AddWithValue("@status", status);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@uid", id);
        cmd.Parameters.AddWithValue("@method", "Insert");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int UpdateExpense(int catid, string name, decimal amount, DateTime date, string desc, int eid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "Expense_CRUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@ecatid", catid);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@amount", amount);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@desc", desc);
        cmd.Parameters.AddWithValue("@eid", eid);
        cmd.Parameters.AddWithValue("@method", "Update");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int DeleteExpense(int eid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "Expense_CRUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@eid", eid);
        cmd.Parameters.AddWithValue("@method", "Delete");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public DataTable GetOnlyExpenses(int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getOnlyExpenses";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", id);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }

    public DataTable GetMonthlyExpenses(int id,DateTime st,DateTime en)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getExpenseByDateRange";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", id);
        cmd.Parameters.AddWithValue("@from", st);
        cmd.Parameters.AddWithValue("@to", en);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }
    public DataTable GetExpenseByExpenseId(int expenseid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getExpenseByExpenseid";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@eid", expenseid);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }
    
    public DataTable getExpenseByDateRange(int id, DateTime from, DateTime to)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getExpenseByDateRange";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", id);
        cmd.Parameters.AddWithValue("@from", from);
        cmd.Parameters.AddWithValue("@to", to);
        
        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }
}