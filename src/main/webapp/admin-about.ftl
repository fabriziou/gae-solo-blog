<style>
    .about-developer .developer-title{
        float: left;
        width: 300px;
        margin-left: 12px;
    }
    .about-developer .contributor-title{
        margin-left: 18px;
        float: left;
        width: 300px;
        margin-left: 12px;
    }
    .about-developer .developer-body{
        float: left;
        width: 300px;
    }
    .about-developer .contributor-body{
        margin-left: 18px;
        float: left;
        width: 300px;
    }
    .about-developer .about-body ul{
        width: 230px;
    }
    .about-developer .about-body ul li{
        width: 100px;
        float: left;
        display: block;
    }
</style>

<div class="module-panel">
    <div class="module-header">
        <h2>${aboutLabel}</h2>
    </div>
    <div class="module-body padding12">
        <div class="about-logo">
            <a href="/" target="_blank">
                <img src="${staticServePath}/images/appengine.gif" alt="GAE-Solo" title="GAE-Solo" />
            </a>
        </div>
        <span class="clear" />
    </div>
</div>
${plugins}
