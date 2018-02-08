<?php
class ControllerModuleCustomimage extends Controller {
    private $error = array(); 
    
    public function index() {
        $this->language->load('module/customimage');

        $this->document->setTitle(strip_tags($this->language->get('heading_title')));
        
        $this->load->model('setting/setting');
        $this->load->model('module/customimage');

        $this->model_module_customimage->create_table();

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('customimage', $this->request->post);

            $this->session->data['success'] = $this->language->get('text_success');
            
            $this->response->redirect($this->url->link('module/customimage', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = strip_tags($this->language->get('heading_title'));
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_yes'] = $this->language->get('text_yes');
        $data['text_no'] = $this->language->get('text_no');
        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_btn_position_before'] = $this->language->get('text_btn_position_before');
        $data['text_btn_position_after'] = $this->language->get('text_btn_position_after');
        $data['text_btn_position_prepend'] = $this->language->get('text_btn_position_prepend');
        $data['text_btn_position_append'] = $this->language->get('text_btn_position_append');
        $data['text_help_btn_selector'] = $this->language->get('text_help_btn_selector');
        
        $data['entry_status'] = $this->language->get('entry_status');

        $data['entry_customimage_show_title'] = $this->language->get('entry_customimage_show_title');
        $data['entry_customimage_show_alt'] = $this->language->get('entry_customimage_show_alt');
        $data['entry_customimage_language_admin'] = $this->language->get('entry_customimage_language_admin');

        $data['entry_main'] = $this->language->get('entry_main');
        $data['entry_product_special'] = $this->language->get('entry_product_special');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        
        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];
            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }
        
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $data['token'] = $this->session->data['token'];

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], true)
        );
        
        $data['breadcrumbs'][] = array(
            'text'      => strip_tags($this->language->get('heading_title')),
            'href'      => $this->url->link('module/customimage', 'token=' . $this->session->data['token'], true),
        );
        
        $data['action'] = $this->url->link('module/customimage', 'token=' . $this->session->data['token'], true);
        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], true);

        $data['modules'] = array();

        if (isset($this->request->post['customimage_status'])) {
            $data['customimage_status'] = $this->request->post['customimage_status'];
        } elseif($this->config->get('customimage_status')) {
            $data['customimage_status'] = $this->config->get('customimage_status');
        } else {
            $data['customimage_status'] = 0;
        }

        if (isset($this->request->post['customimage_show_title'])) {
            $data['customimage_show_title'] = $this->request->post['customimage_show_title'];
        } elseif($this->config->get('customimage_show_title')) {
            $data['customimage_show_title'] = $this->config->get('customimage_show_title');
        } else {
            $data['customimage_show_title'] = 0;
        }

        if (isset($this->request->post['customimage_show_alt'])) {
            $data['customimage_show_alt'] = $this->request->post['customimage_show_alt'];
        } elseif($this->config->get('customimage_show_alt')) {
            $data['customimage_show_alt'] = $this->config->get('customimage_show_alt');
        } else {
            $data['customimage_show_alt'] = 0;
        }

        if (isset($this->request->post['customimage_language_admin'])) {
            $data['customimage_language_admin'] = $this->request->post['customimage_language_admin'];
        } elseif($this->config->get('customimage_language_admin')) {
            $data['customimage_language_admin'] = $this->config->get('customimage_language_admin');
        } else {
            $data['customimage_language_admin'] = 0;
        }

        $ver_arr = explode(".", VERSION);

        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();

        foreach($data['languages'] as $key => $language){
            $languages_image_path = 'view/image/flags/' . $language['image'];

            if($ver_arr['1'] == 2){
                $languages_image_path = 'language/' . $language['code'] . '/' . $language['code'] . '.png';
            }

            $data['languages'][$key]['image'] = $languages_image_path;
        }


        if ($ver_arr['1'] != 2) {
            $template = 'module/customimage.tpl';
        } else {
            $template = 'module/customimage';
        }

               
		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');
        $data['column_left'] = $this->load->controller('common/column_left');
                
		$this->response->setOutput($this->load->view($template, $data));
    }

    public function install(){
        $this->load->model('module/customimage');
        $this->model_module_customimage->create_table();
    }

    protected function validate() {
        if(!$this->user->hasPermission('modify', 'module/customimage')){
            $this->error['warning'] = $this->language->get('error_permission');
        }
        
        if (!$this->error) {
            return true;
        } else {
            return false;
        }    
    }
}
?>