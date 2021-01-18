<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div class="mb-2 font-weight-bold">
            Log in
    </div>
    <#if message??>
        <#if message == "Activation failed">
            <div class="alert alert-danger" role="alert">
                ${message?ifExists}
            </div>
        <#else>
            <div class="alert alert-success" role="alert">
                ${message?ifExists}
            </div>
        </#if>
    </#if>
    <@l.login "/login" false/>
</@c.page>
