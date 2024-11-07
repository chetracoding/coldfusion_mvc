component {
  public function init(){
    return this;
  }

  remote function exportTodoExcel(){
    sqlTodos = 'SELECT * FROM todos';
    qTodos = queryExecute(sqlTodos);
    writeDump(qTodos)

    xlsxFileTag = getDirectoryFromPath(getCurrentTemplatePath()) & "excelTemplate.xls";
    workbook = spreadsheetNew("Todo");

    spreadsheetAddRow(workbook, qTodos.columnList);
    spreadsheetAddRows(workbook, qTodos);

    spreadsheetWrite(workbook, xlsxFileTag, true);
  }

}