component {
    function up() {
        queryExecute( "
            CREATE TABLE `users` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `first_name` VARCHAR(255) NOT NULL,
                `last_name` VARCHAR(255),
                `email` VARCHAR(255) NOT NULL UNIQUE,
                `password` VARCHAR(255) NOT NULL
            )
        " );
    }

    function down() {
        queryExecute( "
            DROP TABLE `users`
        " );
    }
}
