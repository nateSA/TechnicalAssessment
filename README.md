# TechnicalAssessment

Technical User Documentation

User is greeted by below form where they input there details. Once the user clicks on the submit button it checks if the username/ email account already exists in DB if the user does not exists it inserts the user into the user table then calls SendActivationEmail(userId) method which sends a mail for the user to activate their account

 

If user gets below error screen
 
Please check firewall settings as the SMTP mail port could be blocked.




If user already has an account they can click on the “I am already member” link which will forward them to log in form.
 

Users will need to insert their username/email + password in order to log in. When the user clicks on the LogIn button it calls an SP: Validate_User



Not Done
•	User Profile form
•	User Roles
•	Partially done – JS method to check if user has an account in real time
•	Forget Password checkbox + functionality
•	Admin Form 
•	Neaten code + remove comments

