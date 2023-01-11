using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

namespace User_Login_CS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterUser(object sender, EventArgs e)
        {
            int userId = 0;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Insert_User"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                        cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                        cmd.Connection = con;
                        con.Open();
                        userId = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                    }
                }
                string message = string.Empty;
                switch (userId)
                {
                    case -1:
                        message = "Username already exists.\\nPlease choose a different username.";
                        break;
                    case -2:
                        message = "Supplied email address has already been used.";
                        break;
                    default:
                        message = "Registration successful.\\nUser Id: " + userId.ToString();
                        SendActivationEmail(userId);
                        break;
                }
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('" + message + "');", true);
            }


        }

        private void SendActivationEmail(int userId)
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string activationCode = Guid.NewGuid().ToString();
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("INSERT INTO UserActivation VALUES(@UserId, @ActivationCode)"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@ActivationCode", activationCode);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
            using (MailMessage mm = new MailMessage("techassessment@aol.com", txtEmail.Text))
            {
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls;

                mm.Subject = "Account Activation";
                string body = "Hello " + txtUsername.Text.Trim() + ",";
                body += "<br /><br />Please click the following link to activate your account";
                body += "<br /><a href = '" + Request.Url.AbsoluteUri.Replace("CS.aspx", "CS_Activation.aspx?ActivationCode=" + activationCode) + "'>Click here to activate your account.</a>";
                body += "<br /><br />Thanks";
                mm.Body = body;
                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.UseDefaultCredentials = false;
                smtp.Host = "smtp.aol.com";
                smtp.Port = 25;
                //smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                NetworkCredential NetworkCred = new NetworkCredential("techassessment@aol.com", "P@ssw()rd54321");
                
                smtp.Credentials = NetworkCred;
                
                smtp.Send(mm);
            }
        }

        [System.Web.Services.WebMethod]
        public static bool CheckUserName(string username)
        {
            bool status = false;
            string constr = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("CheckUserAvailability", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserName", username.Trim());
                    conn.Open();
                    status = Convert.ToBoolean(cmd.ExecuteScalar());
                    conn.Close();
                }
            }
            return status;
        }

        protected void txtUsername_TextChanged(object sender, EventArgs e)
        {
           // ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:CheckAvailability(); ", true);
            ClientScript.RegisterStartupScript(this.GetType(), "Javascript", "CheckAvailability();",true);
        }
    }
}