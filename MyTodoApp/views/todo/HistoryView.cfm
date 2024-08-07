<cfset page = isDefined( "url.p" ) ? url.p : 1>
<cfset todos = new controllers.todo.TodoController().getTodos({ isDone = true })>
<cfset showMore = todos.rows.len() LT todos.count AND isNumeric(page)>

<cfinclude template = "/views/layout/Header.cfm">
<cfinclude template = "/views/layout/Nav.cfm">

<div class="contrainer mt-2 mx-2">
  <div class="row">
    <cfif todos.count>
        <cfoutput query="todos.rows">
            <div class="col-3 mt-2">
                <div class="card">
                    <div class="card-body">
                        <cfif is_done>
                            <h5 class="card-title text-decoration-line-through">#title#</h5>
                        <cfelse>
                            <h5 class="card-title">#title#</h5>
                        </cfif>
                        <p class="card-text">#description#</p>
                        <div class="d-flex justify-content-end">
                            <a href="/controllers/todo/TodoController.cfc?method=updateTodoById&id=#id#&isDone=false" class="btn btn-outline-secondary">Make to do</a>
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

<cfinclude template = "/views/layout/Footer.cfm">
