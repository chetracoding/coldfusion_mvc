<cfset page = isDefined( "url.p" ) ? url.p : 1>
<cfset todos = new controllers.todo.TodoController().getTodos({ isDone = false })>
<cfset showMore = todos.rows.len() LT todos.count AND isNumeric(page)>

<div class="contrainer mt-2 mx-2">
  <nav class="navbarm d-flex justify-content-end">
      <a class="btn btn-primary" href="/views/todo/TodoEditView.cfm" role="button">Add more</a>
  </nav>

  <div class="row mb-2">
    <cfif todos.count>
        <cfoutput query="todos.rows">
            <div class="col-12 col-lg-3 col-sm-6 mt-2">
                <div class="card">
                    <div class="card-body">
                        <cfif is_done>
                            <h5 class="card-title text-decoration-line-through">#title#</h5>
                        <cfelse>
                            <h5 class="card-title">#title#</h5>
                        </cfif>
                        <p class="card-text">#description#</p>
                        <div class="d-flex justify-content-between">
                            <a href="/controllers/todo/TodoController.cfc?method=updateTodoById&id=#id#&isDone=true" class="btn btn-outline-primary">Make to done</a>
                            <div>
                                <a href="/views/todo/TodoEditView.cfm?id=#id#" class="btn btn-outline-secondary">Edit</a>
                                <a href="/controllers/todo/TodoController.cfc?method=deleteTodoById&id=#id#" class="btn btn-outline-danger">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </cfoutput>
      <cfelse>
        <h5 class="text-center">Don't have any todo.</h5>
      </cfif>
  </div>

  <cfif showMore>
    <nav class="navbar fixed-bottom">
        <div class="container-fluid d-flex justify-content-end">
            <a class="btn btn-sm btn-outline-secondary" href="?p=<cfoutput>#page + 1#</cfoutput>">Load more ...</a>
        </div>
    </nav>
  </cfif>
</div>
