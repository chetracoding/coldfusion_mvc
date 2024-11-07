<cfimport prefix="ct" taglib="/views/customTags">
<cfset page = isDefined( "url.p" ) ? url.p : 1>
<cfset prevKeyword = isDefined("url.q") ? url.q : "">
<cfset todos = new controllers.todo.TodoController().getTodos({ isDone = true })>
<cfset limit = 12>

<ct:PageLayout title="History">
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
  <nav class="navbar fixed-bottom">
    <div class="container-fluid d-flex justify-content-end">
        <a class="btn btn-sm btn-outline-secondary <cfoutput>#page == 1 ? "disabled" : ""#</cfoutput>" href="?p=<cfoutput>#page - 1#</cfoutput>&q=<cfoutput>#prevKeyword#</cfoutput>">Previous page</a>
        <a class="btn btn-sm btn-outline-secondary <cfoutput>#page * limit gte todos.count ? "disabled" : ""#</cfoutput>" href="?p=<cfoutput>#page + 1#</cfoutput>&q=<cfoutput>#prevKeyword#</cfoutput>">Next page</a>
    </div>
</nav>
</div>
</ct:PageLayout>
