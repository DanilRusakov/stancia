<?php
class ModelInformationContact extends Model {
	public function getContacts($store_id = 0){
		$query = $this->db->query("SELECT value FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `code` = 'contacts'");
		return $query->row['value'];
	}
}