component {

  public function init(){
    return this;
  }

  remote function getTodos( struct filter = {} ) {
    try {
      var filterItems = {}
      var pageSize = 12;

      if (url.keyExists("q")) {
        filterItems.keyword = url.q
      }
      if (url.keyExists("p") AND isNumeric(url.p)) {
        pageSize = url.p * pageSize;
      }
      if (arguments.filter.keyExists("isDone")) {
        filterItems.isDone = arguments.filter.isDone
      }

      return new model.Todo().select(session.userId, filterItems, pageSize);
    }
    catch (any e) {
      writeDump(e)
      session.alertColor = "danger";
      session.regsterMessage = "Something wrong while loading this page, please contact to site admin ...";
    }
  }

  remote function getTodoById(numeric id) {
    try {
      if (!arguments.keyExists("id")) return;
      return new model.Todo().select(session.userId, { id = arguments.id });
    }
    catch (any e) {
      // writeOutput("Error: " & e.message);
      session.alertColor = "danger";
      session.regsterMessage = "Something wrong while loading this page, please contact to site admin ...";
    }
  }

  remote void function addTodo(string title, string description) {
    transaction {
      try {
        if (arguments.title == ""){
          session.alertColor = "danger";
          session.alertMessage = "Title is required!";
          location("../../views/todo/TodoEditView.cfm", false);
        }

        new model.Todo().insert(
          arguments.title,
          arguments.description,
          session.userId
        );

        session.alertColor = "success";
        session.alertMessage = "Todo added successfully";
        transactionCommit();
        location("/", false);

      }
      catch (any e) {
        transactionRollback();
        // writeOutput("Error: " & e.message);
        session.alertColor = "danger";
        session.regsterMessage = "Something wrong while adding todo, please contact to site admin ...";
        location("../../views/todo/TodoEditView.cfm", false);
      }
    }
  }

  remote void function updateTodoById(numeric id, string title, string description, boolean isDone) {
    transaction {
      try {
        if (arguments.keyExists("title") && arguments.title == ""){
          session.alertColor = "danger";
          session.alertMessage = "Title is required!";
          location("../../views/todo/TodoEditView.cfm?id=#arguments.id#", false);
        }

        var payload = {}
        if (arguments.keyExists("isDone")) {
          payload.isDone = arguments.isDone
        }
        if (arguments.keyExists("title")) {
          payload.title = arguments.title
        }
        if (arguments.keyExists("description")) {
          payload.description = arguments.description
        }

        new model.Todo().update(
          arguments.id,
          payload
        );

        session.alertColor = "success";
        session.alertMessage = "Todo modified successfully";
        transactionCommit();
        location("/", false);
      }
      catch (any e) {
        transactionRollback();
        writeOutput("Error: " & e.message);
      }
    }
  }

  remote void function deleteTodoById(required numeric id) {
    transaction {
      try {
        new model.Todo().delete(arguments.id);
        session.alertColor = "success";
        session.alertMessage = "Todo deleted successfully";
        transactionCommit();
        location("/", false);
      }
      catch (any e) {
        transactionRollback();
        writeOutput("Error: " & e.message);
      }
    }
  }
}
