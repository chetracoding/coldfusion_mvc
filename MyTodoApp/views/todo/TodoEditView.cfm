<cfimport prefix="ct" taglib="/views/customTags">
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

<ct:PageLayout isDisplaySearch="false">
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
      <cfform name="todoForm" method="POST" action="#action#">
        <div class="mb-3 form-floating">
          <cfinput type="text" name="title" value="#form.title#" required="yes" message="Title field is required." class="form-control form-control-lg" placeholder="Title" >
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
      </cfform>
    </div>
  </div>
</div>
</ct:PageLayout>
