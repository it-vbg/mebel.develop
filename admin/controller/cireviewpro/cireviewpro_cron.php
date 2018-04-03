<?php
class ControllerCiReviewProCiReviewProCron extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('cireviewpro/cireviewpro_cron');
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('customer/customer');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->load->model('setting/setting');

		$this->load->model('cireviewpro/ciratingtype');
		$this->model_cireviewpro_ciratingtype->Buildtable();

		$store_id = 0;
		if(isset($this->request->get['store_id'])) {
			$store_id = $this->request->get['store_id'];
		}

		if ($this->request->server['HTTPS']) {
			$data['front_site'] = $base = HTTPS_CATALOG;
		} else {
			$data['front_site'] = $base = HTTP_CATALOG;
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {

			


			$this->model_setting_setting->editSetting('cireviewpro_cron',  $this->request->post, $store_id);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('cireviewpro/cireviewpro_cron', 'token=' . $this->session->data['token'], true));
		}


		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['legend_email'] = $this->language->get('legend_email');

		$data['text_none'] = $this->language->get('text_none');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_none'] = $this->language->get('text_none');

		$data['entry_subject'] = $this->language->get('entry_subject');
		$data['entry_message'] = $this->language->get('entry_message');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_orderstatuses'] = $this->language->get('entry_orderstatuses');
		$data['entry_customer_groups'] = $this->language->get('entry_customer_groups');
		$data['entry_dayinterval'] = $this->language->get('entry_dayinterval');
		$data['entry_resendold'] = $this->language->get('entry_resendold');
		$data['entry_onorder'] = $this->language->get('entry_onorder');

		$data['help_orderstatuses'] = $this->language->get('help_orderstatuses');
		$data['help_selectmultiple'] = $this->language->get('help_selectmultiple');
		$data['help_orderstatuschange'] = $this->language->get('help_orderstatuschange');
		$data['help_customer_groups'] = $this->language->get('help_customer_groups');
		$data['help_dayinterval'] = $this->language->get('help_dayinterval');
		$data['help_dayinterval1'] = $this->language->get('help_dayinterval1');
		$data['help_resendold'] = $this->language->get('help_resendold');
		$data['help_onorder'] = $this->language->get('help_onorder');

		$data['button_save'] = $this->language->get('button_save');


		$data['code_code'] = $this->language->get('code_code');
		$data['code_translate'] = $this->language->get('code_translate');
		$data['code_firstname'] = $this->language->get('code_firstname');
		$data['code_lastname'] = $this->language->get('code_lastname');
		$data['code_email'] = $this->language->get('code_email');
		$data['code_store_name'] = $this->language->get('code_store_name');
		$data['code_logo'] = $this->language->get('code_logo');
		$data['code_products'] = $this->language->get('code_products');
		
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
		
		if (isset($this->error['subject'])) {
			$data['error_subject'] = $this->error['subject'];
		} else {
			$data['error_subject'] = array();
		}

		if (isset($this->error['message'])) {
			$data['error_message'] = $this->error['message'];
		} else {
			$data['error_message'] = array();
		}

		if (isset($this->error['orderstatuses'])) {
			$data['error_orderstatuses'] = $this->error['orderstatuses'];
		} else {
			$data['error_orderstatuses'] = '';
		}

		if (isset($this->error['dayinterval'])) {
			$data['error_dayinterval'] = $this->error['dayinterval'];
		} else {
			$data['error_dayinterval'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('cireviewpro/cireviewpro_cron', 'token=' . $this->session->data['token'], true)
		);
		

		$data['token'] = $this->session->data['token'];

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$data['action'] = $this->url->link('cireviewpro/cireviewpro_cron', 'token=' . $this->session->data['token'], true);

		$module_info = $this->model_setting_setting->getSetting('cireviewpro_cron', $store_id);

		$data['store_id'] = $store_id;

		
		if (isset($this->request->post['cireviewpro_cron_mail'])) {
			$data['cireviewpro_cron_mail'] = $this->request->post['cireviewpro_cron_mail'];
		} else if(!empty($module_info['cireviewpro_cron_mail'])) {
			$data['cireviewpro_cron_mail'] = (array)$module_info['cireviewpro_cron_mail'];
		} else {
			$data['cireviewpro_cron_mail'] = array();
		}
		
		if (isset($this->request->post['cireviewpro_cron_status'])) {
			$data['cireviewpro_cron_status'] = $this->request->post['cireviewpro_cron_status'];
		} else if(!empty($module_info['cireviewpro_cron_status'])) {
			$data['cireviewpro_cron_status'] = $module_info['cireviewpro_cron_status'];
		}  else {
			$data['cireviewpro_cron_status'] = 0;
		}
		
		if (isset($this->request->post['cireviewpro_cron_orderstatuses'])) {
			$data['cireviewpro_cron_orderstatuses'] = $this->request->post['cireviewpro_cron_orderstatuses'];
		} else if(!empty($module_info['cireviewpro_cron_orderstatuses'])) {
			$data['cireviewpro_cron_orderstatuses'] = (array)$module_info['cireviewpro_cron_orderstatuses'];
		}  else {
			$data['cireviewpro_cron_orderstatuses'] = array();
		}

		if (isset($this->request->post['cireviewpro_cron_ordercomment'])) {
			$data['cireviewpro_cron_ordercomment'] = $this->request->post['cireviewpro_cron_ordercomment'];
		} else if(!empty($module_info['cireviewpro_cron_ordercomment'])) {
			$data['cireviewpro_cron_ordercomment'] = $module_info['cireviewpro_cron_ordercomment'];
		}  else {
			$data['cireviewpro_cron_ordercomment'] = '';
		}

		if (isset($this->request->post['cireviewpro_cron_customer_groups'])) {
			$data['cireviewpro_cron_customer_groups'] = $this->request->post['cireviewpro_cron_customer_groups'];
		} else if(!empty($module_info['cireviewpro_cron_customer_groups'])) {
			$data['cireviewpro_cron_customer_groups'] = (array)$module_info['cireviewpro_cron_customer_groups'];
		}  else {
			$data['cireviewpro_cron_customer_groups'] = array();
		}

		if (isset($this->request->post['cireviewpro_cron_dayinterval'])) {
			$data['cireviewpro_cron_dayinterval'] = $this->request->post['cireviewpro_cron_dayinterval'];
		} else if(!empty($module_info['cireviewpro_cron_dayinterval'])) {
			$data['cireviewpro_cron_dayinterval'] = $module_info['cireviewpro_cron_dayinterval'];
		}  else {
			$data['cireviewpro_cron_dayinterval'] = 1;
		}
		
		if (isset($this->request->post['cireviewpro_cron_resendold'])) {
			$data['cireviewpro_cron_resendold'] = $this->request->post['cireviewpro_cron_resendold'];
		} else if(!empty($module_info['cireviewpro_cron_resendold'])) {
			$data['cireviewpro_cron_resendold'] = $module_info['cireviewpro_cron_resendold'];
		}  else {
			$data['cireviewpro_cron_resendold'] = 0;
		}

		if (isset($this->request->post['cireviewpro_cron_onorder'])) {
			$data['cireviewpro_cron_onorder'] = $this->request->post['cireviewpro_cron_onorder'];
		} else if(!empty($module_info['cireviewpro_cron_onorder'])) {
			$data['cireviewpro_cron_onorder'] = $module_info['cireviewpro_cron_onorder'];
		}  else {
			$data['cireviewpro_cron_onorder'] = 0;
		}

		// get all order statuses
		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		// get all customer groups
		$this->load->model('customer/customer_group');
		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('cireviewpro/cireviewpro_cron.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'cireviewpro/cireviewpro_cron')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		// validate if orderstatus selected
		if(empty($this->request->post['cireviewpro_cron_orderstatuses'])) {
			$this->error['orderstatuses'] = $this->language->get('error_orderstatuses');
		}

		if(!$this->request->post['cireviewpro_cron_dayinterval']) {
			$this->error['dayinterval'] = $this->language->get('error_dayinterval');
		}
		

		foreach ($this->request->post['cireviewpro_cron_mail'] as $language_id => $value) {
			if ((utf8_strlen($value['subject']) < 3) || (utf8_strlen($value['subject']) > 255)) {
				$this->error['subject'][$language_id] = $this->language->get('error_subject');
			}

			if ((utf8_strlen($value['message']) < 3)) {
				$this->error['message'][$language_id] = $this->language->get('error_message');
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	public function sendInviteEmail() {
		$json = array();

		$this->load->language('cireviewpro/cireviewpro_invite');
		$this->load->model('tool/image');
		$this->load->model('sale/order');
		$this->load->model('setting/setting');
		

		$this->response->addHeader('Content-Type: application/json');
		if(!isset($this->request->post['multiple'])) {
			$json['error'] = $this->language->get('error_invalidrequest');
			$this->response->setOutput(json_encode($json));
			$this->response->output();
			exit();
		}

		$order_ids = array();
	
		// single order
		if($this->request->post['multiple'] == 'false') {
			if(empty($this->request->post['order_id'])) {
				$json['error'] = $this->language->get('error_no_order');
				$this->response->setOutput(json_encode($json));
				$this->response->output();
				exit();
			} else {
				$order_ids[] = $this->request->post['order_id'];
			}
		}

		// multiple orders
		if($this->request->post['multiple'] == 'true') {
			if(empty($this->request->post['order_ids'])) {
				$json['error'] = $this->language->get('error_no_order');
				$this->response->setOutput(json_encode($json));
				$this->response->output();
				exit();
			} else {
				$order_ids =  $this->request->post['order_ids'];
			}
		}

		if(empty($order_ids)) {
			$json['error'] = $this->language->get('error_no_order');
			$this->response->setOutput(json_encode($json));
			$this->response->output();
			exit();
		}
		
		foreach ($order_ids as $order_id) {
			
			$order_info = $this->model_sale_order->getOrder($order_id);

			if($order_info) {
				$module_info = $this->model_setting_setting->getSetting('cireviewpro_cron', $order_info['store_id']);

				// get new orders and send invite emails
				$orderstatuses = array();
				if(!empty($module_info['cireviewpro_cron_orderstatuses'])) {
					$orderstatuses = $module_info['cireviewpro_cron_orderstatuses'];
				}
				
				$ignore_customer_groups = array();
				if(!empty($module_info['cireviewpro_cron_customer_groups'])) {
					$ignore_customer_groups = $module_info['cireviewpro_cron_customer_groups'];
				}
				

				if((!empty($orderstatuses) && in_array($order_info['order_status_id'], $orderstatuses)) && (!in_array($order_info['customer_group_id'], $ignore_customer_groups))) {
					$this->orderData($order_info);
				}

				$json['success'] = $this->language->get('text_success');
			}

		}

		
		$this->response->setOutput(json_encode($json));
	}

	private function orderData($order_info) {
		$query1 = $this->db->query("SELECT * FROM ". DB_PREFIX . "order_product WHERE order_id='". $order_info['order_id'] ."' ");
		if ($this->request->server['HTTPS']) {
			$base = HTTPS_CATALOG;
		} else {
			$base = HTTP_CATALOG;
		}

		$order_products = $query1->rows;
		$orderproducts = array();
		foreach ($order_products as $key => $order_product) {
			$product_image = false;
			$query2 = $this->db->query("SELECT * FROM ". DB_PREFIX . "product WHERE product_id='". $order_product['product_id'] ."'");
			$product_info = $query2->row;
			if($product_info) {
				if(!empty($product_info['image']) && file_exists(DIR_IMAGE . $product_info['image'])) {
					$product_image = $this->model_tool_image->resize($product_info['image'], 100, 100);
				}
			}

			$product_link = $base . 'index.php?route=product/product&product_id='. $order_product['product_id'];
			$product_link = $this->load->controller('cireviewpro/cireviewpro_invite/rewrite',$product_link);

			$orderproducts[] = array(
				'product_id' => $order_product['product_id'],
				'product_name' => $order_product['name'],
				'product_image' => $product_image,
				'product_link' => $product_link,
			);
		
		}

		
		$store_logo = false;
		if($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {

			$store_logo = $this->model_tool_image->resize($this->config->get('config_logo'), 200,200);
		}


		$mail_data = array(
			'store_logo' => $store_logo,
			'order_products' => $orderproducts,
		);

		$mail_data = array_merge($mail_data, $order_info);

		$this->sendMail($mail_data);
		
	}

	private function sendMail($mail_data) {


		// get langauge id from langauge code
		$lang_code_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "language` WHERE code = '" . $this->db->escape($mail_data['language_code']) . "'");

		$module_info = $this->model_setting_setting->getSetting('cireviewpro_cron', $mail_data['store_id']);
		
		
		if(isset($module_info['cireviewpro_cron_mail'])) {
			$mail_content = $module_info['cireviewpro_cron_mail'];
		} else {
			$mail_content =  $this->config->get('cireviewpro_cron_mail');
		}
		

		 if(!empty($lang_code_query->row) && isset($mail_content[$lang_code_query->row['language_id']])) {
			$mailcontent = $mail_content[$lang_code_query->row['language_id']];
		} else {
			reset($mail_content);
			$first_key = key($mail_content);
			$mailcontent = $mail_content[$first_key];
		}



		$find = array(
			'{FIRSTNAME}',
			'{LASTNAME}',
			'{EMAIL}',
			'{STORE_NAME}',
			'{LOGO}',
			'{ORDER_PRODUCTS}',

		);

		$replace = array(
			'FIRSTNAME' => $mail_data['firstname'],
			'LASTNAME'  => $mail_data['lastname'],
			'EMAIL'  => $mail_data['email'],
			'STORE_NAME' => $this->config->get('config_name'),
			'LOGO' => $mail_data['store_logo'] ? '<img src="'. $mail_data['store_logo'] .'" alt="'. $this->config->get('config_name') .'">' : '',

			'ORDER_PRODUCTS' => $this->orderProducts($mail_data),
		);

		$message = html_entity_decode($mailcontent['message'], ENT_QUOTES, 'UTF-8');
		$subject = html_entity_decode($mailcontent['subject'], ENT_QUOTES, 'UTF-8');

		$subject = str_replace(array("\r\n", "\r", "\n"), '', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '', trim(str_replace($find, $replace, $subject))));
		$message = str_replace(array("\r\n", "\r", "\n"), '', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '', trim(str_replace($find, $replace, $message))));

		$html = $this->header($subject);
		$html .= $message;
		$html .= $this->footer();

		$this->manageCiReviewInvite($mail_data);

		
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($mail_data['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject( html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
		$mail->setHtml($html);
		$mail->send();

	}

	private function header($title) {		
		return '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd"><html><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8"><title>'.$title.'</title></head><body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;"><div style="width: 680px;">';
	}

	private function footer() {
		return  '</div></body></html>';
	}

	private function orderProducts($mail_data) {
		// Load the language for any mails that might be required to be sent out
		$language = new Language($mail_data['language_code']);
		$language->load($mail_data['language_code']);
		$language->load('cireviewpro/cireviewcron');

		$html = '<table>';
		$html .= '	<thead>';
		$html .= '		<tr>';
		$html .= '			<td>'. $language->get('text_product') .'</td>';
		$html .= '			<td>'. $language->get('text_image') .'</td>';
		$html .= '			<td>'. $language->get('text_link') .'</td>';
		$html .= '		</tr>';
		$html .= '	</thead>';
		$html .= '	<tbody>';
		foreach ($mail_data['order_products'] as $key => $order_product) {
		$html .= '		<tr>';
		$html .= '			<td><a href="'. $order_product['product_link'] .'">'. $order_product['product_name'] .'</a></td>';
		$html .= '			<td><a href="'. $order_product['product_link'] .'">'. '<img src="'. $order_product['product_image'] .'" alt="'. $order_product['product_name'] .'" />' .'</a></td>';
		$html .= '			<td>'. $order_product['product_link'] .'</td>';
		$html .= '		</tr>';
		}
		$html .= '	</tbody>';
		$html .= '</table>';

		return $html;
	}

	private function manageCiReviewInvite($mail_data) {
		// check if we already have record

		foreach ($mail_data['order_products'] as $key => $order_product) {
			$query = $this->db->query("SELECT * FROM ". DB_PREFIX ."cireview_invite WHERE order_id='". $mail_data['order_id'] ."' AND store_id='". $mail_data['store_id'] ."' AND customer_id='". $mail_data['customer_id'] ."' AND product_id='". $order_product['product_id'] ."' ");

			$cireview_invite_info = $query->row;
			if($query->num_rows) {
				$cireview_invite_id = $cireview_invite_info['cireview_invite_id'];
			} else {
				$this->db->query("INSERT INTO ". DB_PREFIX ."cireview_invite SET order_id='". $mail_data['order_id'] ."', store_id='". $mail_data['store_id'] ."', customer_id='". $mail_data['customer_id'] ."', product_id='". $order_product['product_id'] ."', invite=1, status=1, date_added=NOW()");
				$cireview_invite_id = $this->db->getLastId();
				
			}

			$this->db->query("INSERT INTO ". DB_PREFIX ."cireview_invitereminder SET cireview_invite_id='". $cireview_invite_id ."', reminder=1, date_added=NOW()");

		}
	}
}