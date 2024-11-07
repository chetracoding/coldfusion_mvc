component {
  this.name = "ColdFusionMVC";
	this.applicationTimeout = createTimeSpan(0,2,0,0); //2h
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,45,0); //45 min
  this.searchImplicitScopes = false;
	this.passArrayByReference = true;
	this.datasources = {
		my_todo_app_datasource = {
			database = server.system.environment["DB_NAME"],
			host = server.system.environment["DB_HOST"],
			port = server.system.environment["DB_PORT"],
			driver = server.system.environment["DB_DRIVER"],
			username = server.system.environment['DB_USER'],
			password = server.system.environment['DB_PASSWORD']
		}
	}
	this.datasource = "my_todo_app_datasource";

	// ORM
	// this.ormEnabled = true;
	// this.ormsettings = {
	// 	dialect = "MySQL",
	// 	cfclocation = "./orm",
	// 	logSQL = true
	// }

	// Our default serialization options
	// for queries (row, column or struct)
	this.serialization = {
		preserveCaseForStructKey 	: true,
		serializeQueryAs 			: "struct"
	};

  public boolean function onApplicationStart() {
      application.datasource = "my_todo_app_datasource";
			application.bashPath = getDirectoryFromPath(getCurrentTemplatePath());
      return true;
  }

	public void function onSessionStart() {
		session.isLogged = false;
	}

	public void function onRequestStart(string targetPage) {
		allowedAuthPages = [
			"/views/auth/RegisterView.cfm",
			"/controllers/auth/AuthController.cfc",
			"/views/auth/LoginView.cfm"
		];
		if (arrayContains(allowedAuthPages, arguments.targetPage)) {
			return;
		}

		if (session.isLogged == false) {
			location("/views/auth/LoginView.cfm", false);
		}
	}

	public void function onRequest( required string targetPage ) 
	{
		// if( CGI.REMOTE_ADDR == '127.0.0.1' ){
		// 	ormReload();
		// }

		include arguments.targetPage;
	}

	public function onRequestEnd() {
		// Delete previous alert message
		if (isDefined( "session.alertColor" ) OR isDefined( "session.alertMessage" )) {
			structDelete(session, "alertColor", true);
			structDelete(session, "alertMessage", true);
		}
	}

	public boolean function onMissingTemplate( string targetPage ) {
		location("/views/NotFoundView.cfm", false);
	}

}
