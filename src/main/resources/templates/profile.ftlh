<#import "parts/common.ftlh" as c>

<@c.page>
    <h5>${username}</h5>
    ${message?ifExists}
    <form method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />

        <div class="form-group row">
            <label class="col-sm-1 col-form-label">Password:</label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Password" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">Email:</label>
            <div class="col-sm-6">
                <input type="email" name="email" class="form-control" placeholder="some@some.com" value="${email!''}" />
            </div>
        </div>
        <button class="btn btn-primary" type="submit">Save</button>
    </form>
</@c.page>