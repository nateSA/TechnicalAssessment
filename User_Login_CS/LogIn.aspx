<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="User_Login_CS.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
                    <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                        <a href="#" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <%--<input type="text" name="txtUsername" id="txtUsername" placeholder="Your UserName"/>--%>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"
            required />
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <%--<input type="password" name="txtPassword" id="txtPassword" placeholder="Password"/>--%>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password"
             required />
                            </div>
                            <div class="form-group">
                                <%--<input type="checkbox" name="remember-me"  ID="chkRememberMe" class="agree-term"  runat="server"/>--%>
                                      <div class="agree-term" >
            <asp:CheckBox name="remember-me" Text="Remember Me"  ID="chkRememberMe"  runat="server" />
        </div>
                                <label for="remember-me" class="label-agree-term"><span><span></span></span></label>
                            </div>
                            <div class="form-group form-button">
                                <%--<input type="submit" name="signin" id="signin" class="form-submit" value="Log in"/>--%>
                                        <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="ValidateUser" Class="btn btn-primary" />

                            </div>
                               <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
            <strong>Error!</strong>
            <asp:Label ID="lblMessage" runat="server" />
        </div>
                        </form>
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-facebook"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-twitter"></i></a></li>
                                <li><a href="#"><i class="display-flex-center zmdi zmdi-google"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>

     
    </form>
</body>
</html>
