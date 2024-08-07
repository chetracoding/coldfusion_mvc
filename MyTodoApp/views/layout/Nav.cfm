<cfset prevKeyword = isDefined("url.q") ? url.q : "">

<nav class="navbar navbar-expand-lg bg-primary">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
            aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <a class="text-white navbar-brand" href="/">Tick Tick</a>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link text-white" href="/views/todo/HistoryView.cfm">History</a>
                </li>
            </ul>
            <form method="GET" class="d-flex me-2">
                <input name="q" value="<cfoutput>#prevKeyword#</cfoutput>" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-primary-on-container" type="submit">Search</button>
            </form>
            <a href="/controllers/auth/AuthController.cfc?method=logout" class="btn btn-outline-secondary">Log out</a>
        </div>
    </div>
</nav>