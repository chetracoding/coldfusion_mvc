component {

  public function init(){
    return this;
  }

  public function select(numeric userId, struct filter, numeric pageSize) {
    filter = arguments.filter
    var sql = "SELECT id, title, description, is_done FROM todos WHERE fk_user_id = :userId ";
    var params = { userId = { value = arguments.userId, cfsqltype="cf_sql_numeric" } };

    if (filter.keyExists("id")) {
      // In case get By Id
      sql = sql & "AND id = :id";
      params.id = {value = filter.id, cfsqltype="cf_sql_numeric"}
      return queryExecute( sql, params );
    }

    if (filter.keyExists("keyword")) {
      sql = sql & "AND (title LIKE :keyword OR description LIKE :keyword)";
      params.keyword = {value = "%#filter.keyword#%", cfsqltype="cf_sql_varchar"}
    }
    if (filter.keyExists("isDone")) {
      sql = sql & "AND is_done = :isDone";
      params.isDone = {value = filter.isDone, cfsqltype="cf_sql_tinyint"}
    }

    var count = queryExecute( sql, params );

    sql = sql & " ORDER BY id DESC LIMIT :pageSize";
    params.pageSize = {value = arguments.pageSize, cfsqltype="cf_sql_numeric"};

    var rows = queryExecute( sql, params );

    return {
      rows,
      count = count.recordCount
    };
  }

  public function insert(string title, string description, numeric fkUserId) {
    return queryExecute(
      "INSERT INTO todos (title, description, fk_user_id) VALUES (:title, :description, :userId)",
      {
        title = { value = arguments.title, cfsqltype="cf_sql_varchar" },
        description = { value = arguments.description, cfsqltype="cf_sql_varchar" },
        userId = { value = arguments.fkUserId, cfsqltype="cf_sql_numeric" }
      }
    );
  }

  public function update(numeric id, struct payload) {
    payload = arguments.payload;
    var sql = "UPDATE todos SET id = id";
    var params = { id = {value = arguments.id, cfsqltype="cf_sql_numeric"} }

    if (payload.keyExists("isDone")) {
      params.isDone = {value = payload.isDone, cfsqltype="cf_sql_tinyint"};
      sql = sql & ",is_done = :isDone";
    }
    if (payload.keyExists("title")) {
      params.title = {value = payload.title, cfsqltype="cf_sql_varchar"};
      sql = sql & ",title = :title";
    }
    if (payload.keyExists("description")) {
      params.description = {value = payload.description, cfsqltype="cf_sql_varchar"};
      sql = sql & ",description = :description";
    }

    queryExecute(sql & " WHERE id = :id", params);
  }

  public function delete(numeric id) {
    var sql = "DELETE FROM todos WHERE id = :id";
    var params = { id = {value = arguments.id, cfsqltype="cf_sql_numeric"} }
    queryExecute(sql, params);
  }
}
