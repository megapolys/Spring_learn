<#macro login path registration>
    <form action="${path}" method="post">
        <div class="mb-3 col-3">
            <label for="inputLogin" class="form-label">Логин</label>
            <input id="inputLogin" class="form-control" type="text" name="username" aria-describedby="inputLoginHelp" placeholder="логин"/>
            <#if !registration>
                <div id="inputLoginHelp" class="form-text">Можно почту вводить, тоже норм.</div>
            </#if>
        </div>
        <div class="mb-3 col-3">
            <label for="inputPassword" class="form-label">Пароль</label>
            <input type="password" class="form-control" id="inputPassword" name="password" placeholder="пароль">
        </div>
        <#if registration>
            <div class="mb-3 col-3">
                <label for="inputEmail" class="form-label">Адрес почты</label>
                <input id="inputEmail" class="form-control" type="text" name="email" placeholder="email"/>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !registration>
            <div class="mb-3">
                <a class="btn btn-primary" href="../registration">Зарегистрироваться</a>
            </div>
        </#if>
        <button type="submit"
                class="btn btn-primary">${registration?string("Зарегистрироваться","Залогиниться")}</button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit">Выйти</button>
    </form>
</#macro>