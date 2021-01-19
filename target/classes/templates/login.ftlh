<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
        <div class="alert alert-danger" role="alert">
            ${Session.SPRING_SECURITY_LAST_EXCEPTION.message}
        </div>
    </#if>
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
