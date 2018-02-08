<?php
class ModelModuleCustomimage extends Model {
    public function create_table(){

        $query = $this->db->query("show columns FROM ".DB_PREFIX."product_description where `Field` = 'title_text'");

        if (!$query->num_rows){
             $this->db->query("ALTER TABLE ".DB_PREFIX."product_description ADD `title_text` TEXT NOT NULL AFTER `product_id`, `alt_text` TEXT NOT NULL AFTER `product_id` ");
        }

        $query2 = $this->db->query("show columns FROM ".DB_PREFIX."product_image where `Field` = 'descriptions'");

        if (!$query2->num_rows){
            $this->db->query("ALTER TABLE ".DB_PREFIX."product_image ADD `descriptions` TEXT NOT NULL AFTER `product_id` ");
        }

        $query3 = $this->db->query("show columns FROM ".DB_PREFIX."category_description where `Field` = 'title_text'");

        if (!$query3->num_rows){
            $this->db->query("ALTER TABLE ".DB_PREFIX."category_description ADD `title_text` TEXT NOT NULL AFTER `product_id`, ADD `alt_text` TEXT NOT NULL AFTER `product_id` ");

        }
    }

}