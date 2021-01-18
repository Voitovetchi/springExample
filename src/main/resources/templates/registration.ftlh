<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="mb-2 font-weight-bold">
        Add new user
    </div>
    <#if message??>
        <#if message == "User exists">
            <div class="alert alert-danger" role="alert">
                ${message?ifExists}
            </div>
        <#else>
            <div class="alert alert-info" role="alert">
                    ${message?ifExists}
            </div>
        </#if>
    </#if>
    <@l.login "/registration" true/>
</@c.page>