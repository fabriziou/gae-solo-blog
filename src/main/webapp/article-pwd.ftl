<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>${articleViewPwdLabel}</title>
        <meta name="keywords" content="Java 博客,GAE blog" />
        <meta name="description" content="An open source blog based on GAE Java,GAE Java 开源博客" />
        <meta name="owner" content="Sunny" />
        <meta name="author" content="Sunny" />
        <meta name="generator" content="GAE-Solo" />
        <meta name="copyright" content="Sunny" />
        <meta name="revised" content="Sunny, ${year}" />
        <meta name="robots" content="noindex, follow" />
        <meta http-equiv="Window-target" content="_top" />
        <link type="text/css" rel="stylesheet" href="${staticServePath}/css/default-init${miniPostfix}.css?${staticResourceVersion}" charset="utf-8" />
        <link rel="icon" type="image/png" href="${staticServePath}/favicon.png" />
        <script type="text/javascript" src="${staticServePath}/js/lib/jquery/jquery.min.js" charset="utf-8"></script>
    </head>
    <body>
        <div class="wrapper">
            <div class="wrap">
                <div class="content">
                    <div class="logo">
                        <a href="${servePath}" target="_blank">
                            <img border="0" width="153" height="56" alt="Sunny" title="Sunny" src="${staticServePath}/images/logo.jpg"/>
                        </a>
                    </div>
                    <div class="main article-pwd">
                        <h2>
                            ${articleTitle}   
                        </h2>
                        <div>
                            ${articleAbstract}
                        </div>
                        <#if msg??>
                        <div>${msg}</div>
                        </#if>
                        <form method="POST" action="${servePath}/console/article-pwd">
                            <label for="pwdTyped">访问密码：</label>
                            <input type="password" id="pwdTyped" name="pwdTyped" />
                            <input type="hidden" name="articleId" value="${articleId}" />
                            <button id="confirm" type="submit">${confirmLabel}</button>
                        </form>
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
                    Powered by <a href="${servePath}" target="_blank">B3log</a>, ver ${version}
                </div>
            </div>
        </div>
    </body>
</html>
