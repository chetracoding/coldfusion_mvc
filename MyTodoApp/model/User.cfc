component {

  public function init(){
    return this;
  }

  public function select(string email) {
    return queryExecute(
      "SELECT id, first_name, last_name, email, password FROM users WHERE email = :email;",
      {
        email = arguments.email
      }
    );
  }

  public function insert(firstName, lastName, email, password) {
    var sql = "INSERT INTO users ( first_name, last_name, email, password )
              VALUES ( :firstName, :lastName, :email, :password )";

    var params = {
			firstName = { value = arguments.firstName, cfsqltype="varchar" },
			lastName = { value = arguments.lastName, cfsqltype="varchar" },
			email = { value = arguments.email, cfsqltype="varchar" },
			password = { value = arguments.password, cfsqltype="varchar" }
		};
    queryExecute(sql, params);

    return queryExecute(
      "SELECT id, first_name, last_name, email FROM users WHERE email = :email;",
      {
        email = arguments.email
      }
    );
  }
}
