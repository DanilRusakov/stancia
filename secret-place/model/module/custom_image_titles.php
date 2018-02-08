<?php
class ModelModuleCustomImageTitles extends Model {
    private static $alerts = array();
    private $tables = array(
        'category_description' => array('alt_text', 'title_text'),
        'product_description' => array('alt_text', 'title_text'),
        'product_image_description' => array('product_image_id', 'language_id', 'product_id', 'alt_text', 'title_text')
    );

    public function upgradeDatabaseStructure($from_version, $alert = array()) {
        $errors = false;
        $this->alerts = array();

        switch ($from_version) {
            case '2.5.0':
                $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_image_description` CONVERT TO CHARACTER SET utf8 COLLATE utf8_unicode_ci");

                foreach ($this->tables as $table => $columns) {
                    $this->db->query("ALTER TABLE `" . DB_PREFIX . "{$table}`
                        MODIFY alt_text VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
                        MODIFY title_text VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''"
                    );
                }
            default:
                break;
        }

        return !$errors;
    }

    public function applyDatabaseChanges() {
        foreach (array('product_description', 'category_description') as $table) {
            foreach (array('alt_text', 'title_text') as $column) {
                $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "{$table} LIKE '{$column}'");
                if (!$column_exists->num_rows) {
                    $this->db->query("ALTER TABLE " . DB_PREFIX . "{$table} ADD ({$column} VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '')");
                }
            }
        }

        $this->db->query("
            CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "product_image_description (
                product_image_id INT(11) NOT NULL,
                language_id INT(11) NOT NULL,
                product_id INT(11) NOT NULL,
                alt_text VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
                title_text VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
                PRIMARY KEY (product_image_id, language_id),
                INDEX fk_pid_language (language_id),
                INDEX fk_pid_product (product_id)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci"
        );
    }

    public function revertDatabaseChanges() {
        $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "product_image_description");

        foreach (array('product_description', 'category_description') as $table) {
            foreach (array('alt_text', 'title_text') as $column) {
                $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "{$table} LIKE '{$column}'");
                if ($column_exists->num_rows) {
                    $this->db->query("ALTER TABLE " . DB_PREFIX . "{$table} DROP COLUMN {$column}");
                }
            }
        }
    }

    public function checkDatabaseStructure($alert = array()) {
        $errors = false;
        $this->alerts = array();

        foreach ($this->tables as $tbl => $columns) {
            $table_exists = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . "{$tbl}'");
            if (!$table_exists->num_rows) {
                $errors = true;
                $this->alerts['error']["missing_table_{$tbl}"] = sprintf($this->language->get('error_missing_table'), DB_PREFIX . $tbl);
            } else { // Check for table fields
                foreach($columns as $column) {
                    $column_exists = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "{$tbl} LIKE '{$column}'");
                    if (!$column_exists->num_rows) {
                        $errors = true;
                        $this->alerts['error']["missing_column_{$column}"] = sprintf($this->language->get('error_missing_column'), DB_PREFIX . $tbl, $column);
                    }
                }
            }
        }

        return !$errors;
    }

    public function getAlerts() {
        return $this->alerts;
    }
}
