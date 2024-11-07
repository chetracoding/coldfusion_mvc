<cfset todos = new controllers.todo.TodoController().getTodos({ isDone = false, limit = 0 })>

<cfdocument saveasname="Export_Daily_Tasks" format="PDF" overwrite="true" pagetype="A4">
  <!DOCTYPE html>
  <html lang="en">
  <header>
    <style>
      .header-title {
        padding: 14px;
        background-color: #052c65;
        color: white;
        text-align: center;
      }
      .header-info {
        padding: 10px;
        border: 1px solid gray;
        margin: 4px 0px;
      }
      .table {
        width: 100%;
      }
      .cols {
        width: 25%;
        text-align: left;
      }
    </style>
  </header>
  <body>
      <div class="header-title">Export Daily Tasks</div>
      <div class="header-info">
        <p>First name: <strong>Chetra</strong></p>
        <p>Last name: <strong>Hong</strong></p>
        <p>Total tasks: <strong><cfoutput >
          #todos.count#
        </cfoutput></strong></p>
      </div>
      <table class="table">
        <thead>
            <tr>
                <th class="cols">N</th>
                <th class="cols">ID</th>
                <th class="cols">Title</th>
                <th class="cols">Description</th>
            </tr>
        </thead>
        <tbody>
          <cfoutput query="todos.rows">
            <tr>
                <td>#todos.rows.currentRow#</td>
                <td>#id#</td>
                <td>#title#</td>
                <td>#description#</td>
            </tr>
          </cfoutput>
        </tbody>
      </table>
      <!--- <cftable query="qryData" startRow="1" colSpacing="3" HTMLTable>
        <cfloop query="query" index="i" from="1">
          <cfcol header="<b>N</b>" align="Left" width="10" text="#1#">
          <cfcol header="<b>Name</b>" align="Left" width="10" text="#name#">
          <cfcol header="<b>Age</b>" align="Left" width="15" text="#age#">
          <cfcol header="<b>Description</b>" align="Left" width="15" text="#desc#">
        </cfloop>
      </cftable> --->
  </body>
  </html>

  <cfdocumentitem type="footer">
    Page <cfoutput>#cfdocument.currentpagenumber#</cfoutput>
  </cfdocumentitem>
</cfdocument>