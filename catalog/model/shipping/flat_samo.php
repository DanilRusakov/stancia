<?php
class ModelShippingFlatSamo extends Model {
	function getQuote($address) {
		$this->load->language('shipping/flat_samo');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('flat_samo_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('flat_samo_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}

		$method_data = array();

		if ($status) {
			$quote_data = array();

			$quote_data['flat_samo'] = array(
				'code'         => 'flat_samo.flat_samo',
				'title'        => $this->language->get('text_description'),
				'cost'         => $this->config->get('flat_samo_cost'),
				'tax_class_id' => $this->config->get('flat_samo_tax_class_id'),
				'text'         => 'Бесплатно',//$this->currency->format($this->tax->calculate($this->config->get('flat_samo_cost'), $this->config->get('flat_samo_tax_class_id'), $this->config->get('config_tax')))
			);

			$method_data = array(
				'code'       => 'flat_samo',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('flat_samo_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
}