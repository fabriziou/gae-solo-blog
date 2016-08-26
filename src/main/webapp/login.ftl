<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>${welcomeToSoloLabel} My Blog!</title>
        <meta name="revised" content="Sunny, ${year}" />
        <meta name="robots" content="noindex, follow" />
        <meta http-equiv="Window-target" content="_top" />
        <link type="text/css" rel="stylesheet" href="${staticServePath}/css/default-init${miniPostfix}.css?${staticResourceVersion}" charset="utf-8" />
        <link rel="icon" type="image/png" href="${staticServePath}/favicon.png" />
    </head>
    <body>
        <div class="wrapper">
            <div class="wrap">
                <div class="content">
                    <div class="logo">
                        <a href="${servePath}" target="_blank">
                            <img border="0" width="153" height="56" alt="Sunny" title="Sunny" src="${staticServePath}/images/monitor.png"/>
                        </a>
                    </div>
                    <div class="main">
                        <h2>
                            ${loginLabel}
                        </h2>
                        <div class="form">
                            <label for="userEmail">
                                ${commentEmailLabel}
                            </label>
                            <input id="userEmail" tabindex="1" />
                            <label for="userPassword">
                                ${userPasswordLabel} <a href="/forgot">(${forgotLabel})</a>
                            </label>
                            <input type="password" id="userPassword" tabindex="2" />
                            <button onclick='login();'>${loginLabel}</button>
                            <span id="tip">${resetMsg}</span>
                        </div>
                        <a href="${servePath}" target="_blank">
                            <img border="0" class="icon" alt="Sunny" title="Sunny" src="${staticServePath}/images/house.png"/>
                        </a>
                    </div>
                    <span class="clear"></span>
                </div>
            </div>
            <div class="footerWrapper">
                <div class="footer">
                    &copy; ${year} - <a href="${servePath}">${blogTitle}</a><br/>
                    Powered by <a href="${servePath}" target="_blank">Sunny</a>, ver ${version}
                </div>
            </div>
        </div>       
        <script type="text/javascript" src="${staticServePath}/js/lib/jquery/jquery.min.js" charset="utf-8"></script>
        <script type="text/javascript">
                                (function() {
                                    $("#userEmail").focus();

                                    $("#userPassword, #userEmail").keypress(function(event) {
                                        if (13 === event.keyCode) { // Enter pressed
                                            login();
                                        }
                                    });

                                    // if no JSON, add it.
                                    try {
                                        JSON
                                    } catch (e) {
                                        document.write("<script src=\"${staticServePath}/js/lib/json2.js\"><\/script>");
                                    }
                                })();

                                var login = function() {
                                    if (!/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test($("#userEmail" + status).val())) {
                                        $("#tip").text("${mailInvalidLabel}");
                                        $("#userEmail").focus();
                                        return;
                                    }

                                    if ($("#userPassword").val() === "") {
                                        $("#tip").text("${passwordEmptyLabel}");
                                        $("#userPassword").focus();
                                        return;
                                    }

                                    var requestJSONObject = {
                                        "userEmail": $("#userEmail").val(),
                                        "userPassword": $("#userPassword").val()
                                    };
                                    
                                    $("#tip").html("<img src='${staticServePath}/images/loading.gif'/> loading...")

                                    $.ajax({
                                        url: "login",
                                        type: "POST",
                                        contentType: "application/json",
                                        data: JSON.stringify(requestJSONObject),
                                        error: function() {
                                            // alert("Login error!");
                                        },
                                        success: function(data, textStatus) {
                                            if (!data.isLoggedIn) {
                                                $("#tip").text(data.msg);
                                                return;
                                            }

                                            window.location.href = data.to;
                                        }
                                    });
                                };
        </script>
    </body>
</html>
