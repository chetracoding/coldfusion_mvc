<!--- Create component in tag syntax
<cfcomponent hint="A utility storage to all CF scopes" output="false">
  <cffunction name="init" access="public" output="false" hint="Constructor">
		<cfscript>
			return this;
		</cfscript>
  </cffunction>

  <cffunction name="exportTodoExcel" access="remote">
    <cfset sqlTodos = 'SELECT * FROM todos'>
    <cfset xlsxFileTag = getDirectoryFromPath(getCurrentTemplatePath() & "excelTemplate.xlsx")>
    <cfset todoSheet = spreadsheetNew("Todo")>

    <cfset spreadsheetAddRow(todoSheet, sqlTodos.columnList)>
    <cfset spreadsheetAddRows(todoSheet, sqlTodos)>
  </cffunction>
</cfcomponent> --->