component {

  public function init(){
    return this;
  }

  remote void function register(
    string firstName,
    string lastName,
    string email,
    string password
  ) {
    transaction {
      try {
        if (
          arguments.firstName == "" ||
          arguments.email == "" ||
          arguments.password == ""
          )
        {
          session.alertColor = "danger";
          session.alertMessage = "Fields are required!";
          location("../../views/auth/RegisterView.cfm", false);
        }

        result = new model.User().insert(
          arguments.firstName,
          arguments.lastName,
          arguments.email,
          hash(arguments.password, "SHA-256", "UTF-8")
        );

        if (result.recordCount) {
          session.isLogged = true;
          session.userId = result.id;
          transactionCommit();
          location("/", false);
        }
      }
      catch (any e) {
        transactionCommit();
        // Note: sqlstate (23000) is duplicate entry
        session.alertColor = "danger";
        session.alertMessage = "Something wrong while loading this page, please contact to site admin ...";
        if (e.type == "Database" AND e.sqlstate == 23000) {
          session.alertMessage = "Your email is invalid!";
        }
        location("../../views/auth/RegisterView.cfm", false);
      }
    }
  }

  remote void function login(string email, string password) {
    try {
      if (
        arguments.email == "" ||
        arguments.password == ""
        )
      {
        session.alertColor = "danger";
        session.alertMessage = "Fields are required!";
        location("../../views/auth/LoginView.cfm", false);
      }

      result = new model.User().select(arguments.email);

      if (!result.recordCount OR result?.password != hash(arguments.password, "SHA-256", "UTF-8")) {
        session.alertColor = "danger";
        session.alertMessage = "Email or password is invalid!";
        location("../../views/auth/LoginView.cfm", false);
      }

      session.isLogged = true;
      session.userId = result.id;
      location("/", false);
    }
    catch (any e) {
      writeDump(e)
    }
  }

  remote void function logout() {
    session.isLogged = false;
    location("../../views/auth/LoginView.cfm", false);
  }
}
