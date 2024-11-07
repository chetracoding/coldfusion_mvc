<cfparam name="attributes.isDisplayHeader" default="true">
<cfparam name="attributes.isDisplaySearch" default="true">
<cfparam name="attributes.title" default="Tick Tick">

<cfif thisTag.executionMode EQ "start">
  <!DOCTYPE html>
  <html lang="en">

  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>
        <cfoutput>#attributes.title#</cfoutput>
      </title>
      <link rel="icon" href="/assets/icon.png">

      <link href="/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
      <script src="/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </head>

  <body>
      <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
          <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
              <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
          </symbol>
          <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
              <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
          </symbol>
          <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
              <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
          </symbol>
      </svg>

      <!--- Base alert component ---->
      <cfset alertColor = isDefined( "session.alertColor" ) ? session.alertColor : "success">
      <cfset alertIcons = {
          success: "check-circle-fill",
          danger: "exclamation-triangle-fill",
          info: "info-fill"
      }>
      <cfset icon = alertIcons.keyExists(alertColor) ? alertIcons[alertColor] : alertIcons.success>
      <cfif isDefined( "session.alertMessage" )>
          <div style="z-index: 1000;" class="alert-<cfoutput>#alertColor#</cfoutput> w-auto bottom-0 start-50 translate-middle-x position-fixed alert alert-dismissible fade show d-flex align-items-center" role="alert">
              <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#<cfoutput>#icon#</cfoutput>"/></svg>
              <div>
              <cfoutput>#session.alertMessage#</cfoutput>
              </div>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
          </div>
      </cfif>

    <!--- Nav --->
    <cfif attributes.isDisplayHeader>
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

                    <cfif attributes.isDisplaySearch>
                        <form method="GET" class="d-flex me-2">
                            <input name="q" value="<cfoutput>#prevKeyword#</cfoutput>" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-primary-on-container" type="submit">Search</button>
                        </form>
                    </cfif>

                    <a href="/controllers/auth/AuthController.cfc?method=logout" class="btn btn-outline-secondary">Log out</a>
                </div>
            </div>
        </nav>
    </cfif>

<cfelse>
  </body>
  </html>
</cfif>