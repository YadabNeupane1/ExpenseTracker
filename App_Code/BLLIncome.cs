using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for BLLIncome
/// </summary>
public class BLLIncome
{
    public BLLIncome()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable GetAllIncome(int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getAllIncome";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", id);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }

    public DataTable GetMonthlyIncome(int id, DateTime st, DateTime en)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getIncomeByDateRange";
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
    public int InsertIncome(int iid, int status, decimal amount, DateTime date, string description, int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "Income_CUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@iid", iid);
        cmd.Parameters.AddWithValue("@amount", amount);
        cmd.Parameters.AddWithValue("@desc", description);
        cmd.Parameters.AddWithValue("@status", status);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@uid", id);
        cmd.Parameters.AddWithValue("@method", "Insert");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int UpdateIncome(int catid, decimal amount, DateTime date, string desc, int iid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "Income_CUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@icatid", catid);
        cmd.Parameters.AddWithValue("@amount", amount);
        cmd.Parameters.AddWithValue("@date", date);
        cmd.Parameters.AddWithValue("@desc", desc);
        cmd.Parameters.AddWithValue("@iid", iid);
        cmd.Parameters.AddWithValue("@method", "Update");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int DeleteIncome(int iid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "Income_CUD";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@iid", iid);
        cmd.Parameters.AddWithValue("@method", "Delete");

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public DataTable GetOnlyIncomes(int id)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getOnlyIncomes";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@uid", id);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }
    public DataTable GetIncomeByIncomeId(int incomeId)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "getIncomeByIncomeid";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@iid", incomeId);

        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();

        adapter.Fill(dt);
        return dt;
    }
}