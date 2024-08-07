<cfscript>
  isCreated = !isDefined( "url.id" );
  action = "../../controllers/todo/TodoController.cfc?method=addTodo";
  form = {
    title = "",
    description = ""
  };

  if(!isCreated){
    action = "../../controllers/todo/TodoController.cfc?method=updateTodoById&id=#url.id#";
    todo = new controllers.todo.TodoController().getTodoById(url.id);
    form.title = todo.title;
    form.description = todo.description;
  }
</cfscript>

<cfinclude template="../layout/Header.cfm">

<nav class="navbar navbar-expand-lg bg-primary">
  <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
          aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse d-flex justify-content-between" id="navbarTogglerDemo01">
          <a class="text-white navbar-brand" href="/">Tick Tick</a>
          <a href="/controllers/auth/AuthController.cfc?method=logout" class="btn btn-outline-secondary">Log out</a>
      </div>
  </div>
</nav>

<div class="container h-100 d-flex justify-content-center">
  <div class="card my-4 text-center" style="width: 40rem; border-radius: 0.5rem;">
    <div class="card-header fw-bolder py-2 bg-primary-on-container text-primary">
      <cfif isCreated>
        Create new todo
      <cfelse>
        Edit
      </cfif>
    </div>
    <div class="card-body">
      <form name="form" method="POST" action="<cfoutput>#action#</cfoutput>">
        <div class="mb-3 form-floating">
          <input name="title" type="text" value="<cfoutput>#form.title#</cfoutput>" id="floatingInput" class="form-control" placeholder="Title">
          <label for="floatingInput">Title</label>
        </div>
        <div class="mb-3">
          <div class="form-floating">
            <textarea name="description" class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 200px"><cfoutput>#form.description#</cfoutput></textarea>
            <label for="floatingTextarea2">Comments</label>
          </div>
        </div>
        <div class="d-flex justify-content-between">
          <a href="/" class="btn btn-outline-secondary">Back</a>
          <button name="save" type="submit" class="btn btn-primary px-4" value="Add">Save</button>
        </div>
      </form>
    </div>
  </div>
</div>

<cfinclude template="../layout/Footer.cfm">
