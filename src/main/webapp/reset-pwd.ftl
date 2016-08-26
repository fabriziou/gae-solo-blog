<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <title>${forgotLabel} GAE-Solo!</title>
        <meta name="keywords" content="Java 博客,GAE blog"/>
        <meta name="description" content="An open source blog based on GAE Java,GAE Java 开源博客"/>
        <meta name="owner" content="Sunny"/>
        <meta name="author" content="Sunny"/>
        <meta name="generator" content="GAE-Solo"/>
        <meta name="copyright" content="Sunny"/>
        <meta name="revised" content="Sunny, ${year}"/>
        <meta name="robots" content="noindex, follow"/>
        <meta http-equiv="Window-target" content="_top"/>
        <link type="text/css" rel="stylesheet"
              href="${staticServePath}/css/default-init${miniPostfix}.css?${staticResourceVersion}" charset="utf-8"/>
        <link rel="icon" type="image/png" href="${staticServePath}/favicon.png"/>
    </head>
    <body>
        <div class="wrapper">
            <div class="wrap">
                <div class="content">
                    <div class="logo">
                        <a href="${servePath}" target="_blank">
                            <img border="0" width="153" height="56" alt="Sunny" title="Sunny"
                                 src="${staticServePath}/images/logo.jpg"/>
                        </a>
                    </div>
                    <div class="main">
                        <h2>
                            ${forgotLabel}
                        </h2>
                        <#if "email" == inputType>
                        <div class="form">
                            <label for="emailOrPassword">
                                ${commentEmailLabel}
                            </label>
                            <input id="emailOrPassword"/>
                            <button id="sendBtn" onclick='forgot();'>${sendLabel}</button>
                            <span id="tip"></span>
                        </div>
                        <#else>
                        <div class="form">
                            <label for="emailOrPassword">
                                ${userPasswordLabel}
                            </label>
                            <input id="emailOrPassword"/>
                            <input type="hidden" id="userEmailHidden" value="${userEmailHidden}" />
                            <button id="sendBtn" onclick='reset();'>${ok}</button>
                            <span id="tip"></span>
                        </div>
                        </#if>

                        <a href="${servePath}" target="_blank">
                            <img border="0" class="icon" alt="Sunny" title="Sunny" src="${staticServePath}/favicon.png"/>
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
                $("#emailOrPassword").focus();

                $("#emailOrPassword").keypress(function(event) {
                    if (13 === event.keyCode) { // Enter pressed
                        $('#sendBtn').click();
                    }
                });

                // if no JSON, add it.
                try {
                    JSON
                } catch (e) {
                    document.write("<script src=\"${staticServePath}/js/lib/json2.js\"><\/script>");
                }
            })();

            var reset = function() {
                if ($("#emailOrPassword").val() === "") {
                    $("#tip").text("${passwordEmptyLabel}");
                    $("#emailOrPassword").focus();
                    return;
                }
                var requestJSONObject = {
                    "newPwd": $("#emailOrPassword").val(),
                    "userEmail": $("#userEmailHidden").val()
                };

                $("#tip").html("<img src='${staticServePath}/images/loading.gif'/> loading...");
                $.ajax({
                    url: "${servePath}/reset",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(requestJSONObject),
                    error: function() {
                        // alert("reset password error!");
                    },
                    success: function(data, textStatus) {
                        if (data.succeed) {
                            window.location.href = data.to;
                        } else {
                            $("#tip").text(data.msg);
                        }
                    }
                });
            };

            var forgot = function() {
                if (!/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test($("#emailOrPassword" + status).val())) {
                    $("#tip").text("${mailInvalidLabel}");
                    $("#emailOrPassword").focus();
                    return;
                }

                var requestJSONObject = {
                    "userEmail": $("#emailOrPassword").val()
                };

                $("#tip").html("<img src='${staticServePath}/images/loading.gif'/> loading...")
                $.ajax({
                    url: "${servePath}/forgot",
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify(requestJSONObject),
                    error: function() {
                        // alert("reset password error!");
                    },
                    success: function(data, textStatus) {
                        if (data.succeed) {
                            window.location.href = data.to;
                        } else {
                            $("#tip").text(data.msg);
                        }
                    }
                });
            };
        </script>
    </body>
</html>