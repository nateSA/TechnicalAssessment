
    function CheckAvailability() {
        var username = document.getElementById("txtUsername").value;
    var request;
    if (window.XMLHttpRequest) {
        //New browsers.
        request = new XMLHttpRequest();
        }
    else if (window.ActiveXObject) {
        //Old IE Browsers.
        request = new ActiveXObject("Microsoft.XMLHTTP");
        }
    if (request != null) {
            var url = "Default.aspx/CheckUserName";
    request.open("POST", url, false);
    var sendStr = "{username: '" + username + "'}";
    request.setRequestHeader("Content-Type", "application/json");
    request.onreadystatechange = function () {
                if (request.readyState == 4 && request.status == 200) {
                    var messages = document.getElementById("message");
    if (JSON.parse(request.responseText).d) {
        //Username available.
        message.style.color = "green";
    message.innerHTML = "Username is available";
                    }
    else {
        //Username not available.
        message.style.color = "red";
    message.innerHTML = "Username is NOT available";
                    }
                }
            };
    request.send(sendStr);
        }
    }

    function ClearMessage() {
        document.getElementById("message").innerHTML = "";
    };

