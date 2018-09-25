using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for BLLUser
/// </summary>
public class BLLUser
{
    public BLLUser()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int addUserInfo(String Fullname, string Username, String Password, String Phone, String Email, String address, DateTime date, String ActivationCode)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ets_AddUserinfo";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;


        cmd.Parameters.AddWithValue("@Username", Username);
        cmd.Parameters.AddWithValue("@Password", Password);
        cmd.Parameters.AddWithValue("@Fullname", Fullname);
        cmd.Parameters.AddWithValue("@Phone", Phone);
        cmd.Parameters.AddWithValue("@Email", Email);
        cmd.Parameters.AddWithValue("@Address", address);
        cmd.Parameters.AddWithValue("@CreatedAt", date);
        cmd.Parameters.AddWithValue("@Status", "Disable");
        cmd.Parameters.AddWithValue("@ActivationCode", ActivationCode);

        SqlParameter param = new SqlParameter("userid", SqlDbType.Int, 5);
        cmd.Parameters.Add(param);
        param.Direction = ParameterDirection.Output;


        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public int activationSuccessful(String activationcode)
    {

        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ets_ActivationSuccessful";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@ActivationCode", activationcode);
        cmd.Parameters.AddWithValue("@Status", "Enable");


        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;

    }
    public DataTable getLoginInfo(String Username)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ets_GetUserInfoByUserName";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@username", Username);

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable getPasswordByUsername(String Username)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ets_getPasswordByUsername";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@username", Username);

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int UpdateProfile(String Email, String Fullname, String Address, String Phone)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "ets_UpdateProfile";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("Email", Email);
        cmd.Parameters.AddWithValue("FullName", Fullname);
        cmd.Parameters.AddWithValue("Address", Address);
        cmd.Parameters.AddWithValue("Phone", Phone);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;

    }


    public DataTable getUserInformation(int Userid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ets_GetUserInfo";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserId", Userid);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public DataTable getLoginInfo(String Username, String Password)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ets_GetLoginInfo";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", Username);
        cmd.Parameters.AddWithValue("@Password", Password);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;


    }
    public DataTable getUserByEmail(String Email)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ets_GetUserByEmail";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Email", Email);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;

    }
    public DataTable getUserByUsername(String username)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        String sql = "ets_GetUserByUserName";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", username);
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;

    }
    public int changepassword(String Username, String password)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "ets_UpdatePassword";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserName", Username);
        cmd.Parameters.AddWithValue("@Password", password);

        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;
    }
    public string Encrypt(string clearText)
    {
        string EncryptionKey = "EXP9849TRACK6936SYS!";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }

    public string Decrypt(string cipherText)
    {
        string EncryptionKey = "EXP9849TRACK6936SYS!";
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(cipherBytes, 0, cipherBytes.Length);
                    cs.Close();
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }

    public DataTable admin()
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "ets_Admin";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        return dt;
    }

    public int DeleteUser(int userid)
    {
        SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["ETS"].ConnectionString);
        string sql = "ets_DeleteUser";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@UserId", userid);
        con.Open();
        int i = cmd.ExecuteNonQuery();
        con.Close();
        return i;


    }

}