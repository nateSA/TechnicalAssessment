<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="User_Login_CS.WebForm1" %>

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


        <div class="main">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>
                            <form method="POST" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <%--<input type="text" name="txtUsername" id="txtUsername1" placeholder="Your Name" runat="server" onblur ="CheckAvailability()" />--%>
                                    <asp:TextBox ID="txtUsername" runat="server" OnTextChanged="txtUsername_TextChanged" onblur ="CheckAvailability()"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="email"><i class="zmdi zmdi-email"></i></label>
                                    <%--<input type="email" name="txtEmail" id="txtEmail" placeholder="Your Email" runat="server"/>--%>
                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Your Email" />
                                    <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red"
                                        ControlToValidate="txtEmail" runat="server" />
                                    <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                        ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <%--<input type="password" name="pass" id="pass" placeholder="Password"/>--%>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" />
                                    <asp:RequiredFieldValidator ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword"
                                        runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <%--<input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password"/>--%>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Confirm your password" />
                                    <asp:CompareValidator ErrorMessage="Passwords do not match." ForeColor="Red" ControlToCompare="txtPassword"
                                        ControlToValidate="txtConfirmPassword" runat="server" />
                                </div>
                                <div class="form-group">
                                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                                </div>
                                <div class="form-group form-button">
                                    <%--<input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>--%>
                                    <asp:Button Text="Submit" runat="server" OnClick="RegisterUser" />

                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure>
                                <img src="images/signup-image.jpg" alt="sing up image">
                            </figure>
                            <a href="LogIn.aspx" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>
            </section>



            <!-- JS -->
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="js/main.js"></script>
    </form>
</body>
</html>

