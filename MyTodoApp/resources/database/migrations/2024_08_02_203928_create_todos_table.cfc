component {
    function up() {
        queryExecute( "
            CREATE TABLE `todos` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `title` VARCHAR(255) NOT NULL,
                `description` TEXT,
                `is_done` BOOLEAN NOT NULL DEFAULT 0,
                `fk_user_id` INT NOT NULL,
                FOREIGN KEY (`fk_user_id`) REFERENCES users(`id`) ON DELETE NO ACTION
            )
        " );
    }

    function down() {
        queryExecute( "
            DROP TABLE `todos`
        " );
    }
}
