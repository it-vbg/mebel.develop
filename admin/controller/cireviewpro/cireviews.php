<?php
class ControllerCiReviewProCiReviews extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('cireviewpro/cireviews');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('cireviewpro/cireviews');

		$this->load->model('cireviewpro/ciratingtype');
		$this->model_cireviewpro_ciratingtype->Buildtable();

		$this->getList();
	}

	public function add() {
		$this->load->language('cireviewpro/cireviews');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('cireviewpro/cireviews');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_cireviewpro_cireviews->addCiReview($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_title'])) {
				$url .= '&filter_title=' . urldecode(html_entity_decode($this->request->get['filter_title'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urldecode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_store_id'])) {
				$url .= '&filter_store_id=' . urldecode(html_entity_decode($this->request->get['filter_store_id'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_author'])) {
				$url .= '&filter_author=' . urldecode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_rating'])) {
				$url .= '&filter_rating=' . $this->request->get['filter_rating'];
			}
			
			if (isset($this->request->get['filter_product_id'])) {
				$url .= '&filter_product_id=' . $this->request->get['filter_product_id'];
			}

			if (isset($this->request->get['filter_product'])) {
				$url .= '&filter_product=' . urldecode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_vote'])) {
				$url .= '&filter_vote=' . $this->request->get['filter_vote'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . urldecode(html_entity_decode($this->request->get['filter_date_added'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('cireviewpro/cireviews');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('cireviewpro/cireviews');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_cireviewpro_cireviews->editCiReview($this->request->get['review_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_title'])) {
				$url .= '&filter_title=' . urldecode(html_entity_decode($this->request->get['filter_title'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urldecode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_store_id'])) {
				$url .= '&filter_store_id=' . urldecode(html_entity_decode($this->request->get['filter_store_id'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_author'])) {
				$url .= '&filter_author=' . urldecode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_rating'])) {
				$url .= '&filter_rating=' . $this->request->get['filter_rating'];
			}
			
			if (isset($this->request->get['filter_product_id'])) {
				$url .= '&filter_product_id=' . $this->request->get['filter_product_id'];
			}

			if (isset($this->request->get['filter_product'])) {
				$url .= '&filter_product=' . urldecode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_vote'])) {
				$url .= '&filter_vote=' . $this->request->get['filter_vote'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . urldecode(html_entity_decode($this->request->get['filter_date_added'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('cireviewpro/cireviews');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('cireviewpro/cireviews');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $cireviews_id) {
				$this->model_cireviewpro_cireviews->deleteCiReview($cireviews_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_title'])) {
				$url .= '&filter_title=' . urldecode(html_entity_decode($this->request->get['filter_title'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urldecode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_store_id'])) {
				$url .= '&filter_store_id=' . urldecode(html_entity_decode($this->request->get['filter_store_id'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_author'])) {
				$url .= '&filter_author=' . urldecode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_rating'])) {
				$url .= '&filter_rating=' . $this->request->get['filter_rating'];
			}
			
			if (isset($this->request->get['filter_product_id'])) {
				$url .= '&filter_product_id=' . $this->request->get['filter_product_id'];
			}

			if (isset($this->request->get['filter_product'])) {
				$url .= '&filter_product=' . urldecode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['filter_vote'])) {
				$url .= '&filter_vote=' . $this->request->get['filter_vote'];
			}

			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}

			if (isset($this->request->get['filter_date_added'])) {
				$url .= '&filter_date_added=' . urldecode(html_entity_decode($this->request->get['filter_date_added'], ENT_QUOTES, 'UTF-8'));
			}

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . $url, true));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['filter_title'])) {
			$filter_title = $this->request->get['filter_title'];
		} else {
			$filter_title = null;
		}

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_store_id'])) {
			$filter_store_id = $this->request->get['filter_store_id'];
		} else {
			$filter_store_id = null;
		}

		if (isset($this->request->get['filter_author'])) {
			$filter_author = $this->request->get['filter_author'];
		} else {
			$filter_author = null;
		}

		if (isset($this->request->get['filter_rating'])) {
			$filter_rating = $this->request->get['filter_rating'];
		} else {
			$filter_rating = null;
		}

		if (isset($this->request->get['filter_product_id'])) {
			$filter_product_id = $this->request->get['filter_product_id'];
		} else {
			$filter_product_id = null;
		}

		if (isset($this->request->get['filter_product'])) {
			$filter_product = $this->request->get['filter_product'];
		} else {
			$filter_product = null;
		}

		if (isset($this->request->get['filter_vote'])) {
			$filter_vote = $this->request->get['filter_vote'];
		} else {
			$filter_vote = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}
		
		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'ad.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . urldecode(html_entity_decode($this->request->get['filter_title'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urldecode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_store_id'])) {
			$url .= '&filter_store_id=' . urldecode(html_entity_decode($this->request->get['filter_store_id'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_author'])) {
			$url .= '&filter_author=' . urldecode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_rating'])) {
			$url .= '&filter_rating=' . $this->request->get['filter_rating'];
		}
		
		if (isset($this->request->get['filter_product_id'])) {
			$url .= '&filter_product_id=' . $this->request->get['filter_product_id'];
		}

		if (isset($this->request->get['filter_product'])) {
			$url .= '&filter_product=' . urldecode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_vote'])) {
			$url .= '&filter_vote=' . $this->request->get['filter_vote'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . urldecode(html_entity_decode($this->request->get['filter_date_added'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['token'] = $this->session->data['token'];
		/*new update starts*/
		$this->load->model('setting/store');

		$data['stores'] = array();
		
		$data['stores'][] = array(
			'store_id' => '0',
			'name'     => $this->language->get('text_default')
		);
		
		$stores = $this->model_setting_store->getStores();

		foreach ($stores as $store) {
			$data['stores'][] = array(
				'store_id' => $store['store_id'],
				'name'     => $store['name']
			);
		}
		/*new update ends*/

		$data['add'] = $this->url->link('cireviewpro/cireviews/add', 'token=' . $this->session->data['token'] . $url, true);
		$data['delete'] = $this->url->link('cireviewpro/cireviews/delete', 'token=' . $this->session->data['token'] . $url, true);

		$data['cireviews'] = array();

		$filter_data = array(
			'filter_title'  => $filter_title,
			'filter_email'  => $filter_email,
			'filter_store_id'  => $filter_store_id,
			'filter_author'  => $filter_author,
			'filter_rating'  => $filter_rating,
			'filter_product_id'  => $filter_product_id,
			'filter_product'  => $filter_product,
			'filter_vote'  => $filter_vote,
			'filter_status'  => $filter_status,
			'filter_date_added'  => $filter_date_added,
			'filter_status'  => $filter_status,
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$cireviews_total = $this->model_cireviewpro_cireviews->getTotalCiReviews($filter_data);

		$results = $this->model_cireviewpro_cireviews->getCiReviews($filter_data);

		
		$this->load->model('cireviewpro/ciratingtype');
		$this->load->model('tool/image');
		/*new update starts*/$this->load->model('setting/store');/*new update ends*/

		foreach ($results as $result) {

			if(!empty($result['product_image']) && file_exists(DIR_IMAGE . $result['product_image'])) {
				$product_thumb = $this->model_tool_image->resize($result['product_image'], 40, 40);

			} else {
				$product_thumb = $this->model_tool_image->resize('placeholder.png', 40, 40);					
			}

			$ratings = array();
			$ciratings = $this->model_cireviewpro_cireviews->getCiReviewRating($result['review_id']);

			foreach($ciratings as $cirating) {
				if(empty($cirating['ciratingtype_name'])) {
					$ciratingtype_info = $this->model_cireviewpro_ciratingtype->getCiRatingType($cirating['ciratingtype_id']);
					if($ciratingtype_info) {
						$cirating['ciratingtype_name'] = $ciratingtype_info['name'];
					}
				}
				$ratings[] = array(
					'cireview_rating_id' => $cirating['cireview_rating_id'],
					'rating' => $cirating['rating'],
					'ciratingtype_id' => $cirating['ciratingtype_id'],
					'ciratingtype_name' => $cirating['ciratingtype_name'],
				);
			}
			/*new update starts*/
			$store = $this->language->get('text_default');

			if((int)$result['store_id'] != 0) {
				$store_info = $this->model_setting_store->getStore((int)$result['store_id']);
				if($store_info) {
					$store = $store_info['name'];
				}
			}
			/*new update ends*/
			$data['cireviews'][] = array(
				'review_id'    => $result['review_id'],				
				'cireview_id'    => $result['cireview_id'],				
				/*new update starts*/'store'    => $store,/*new update ends*/
				'product_name'            => strip_tags(html_entity_decode($result['product_name'], ENT_QUOTES, 'UTF-8')),
				'product_thumb'            => $product_thumb,
				'product_id'            => $result['product_id'],
				'email'            => $result['email'],
				'author'            => strip_tags(html_entity_decode($result['author'], ENT_QUOTES, 'UTF-8')),
				'title'            => strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8')),
				'rating'            => $result['rating'],
				'ratings'            => $ratings,
				'votes_up'            => !$result['votes_up'] ? 0 : $result['votes_up'],
				'votes_down'            => !$result['votes_down'] ? 0 : $result['votes_down'],
				'status'            => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'date_added'      => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'edit'            => $this->url->link('cireviewpro/cireviews/edit', 'token=' . $this->session->data['token'] . '&review_id=' . $result['review_id'] . $url, true)
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_vote_up'] = $this->language->get('text_vote_up');
		$data['text_vote_down'] = $this->language->get('text_vote_down');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['column_product_name'] = $this->language->get('column_product_name');
		$data['column_title'] = $this->language->get('column_title');
		/*new update starts*/$data['column_store'] = $this->language->get('column_store');/*new update ends*/
		$data['column_author'] = $this->language->get('column_author');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_rating'] = $this->language->get('column_rating');
		$data['column_avgrating'] = $this->language->get('column_avgrating');
		$data['column_vote_up'] = $this->language->get('column_vote_up');
		$data['column_vote_down'] = $this->language->get('column_vote_down');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_date_added'] = $this->language->get('column_date_added');
		
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_title'] = $this->language->get('entry_title');
		/*new update starts*/$data['entry_store'] = $this->language->get('entry_store');/*new update ends*/
		$data['entry_author'] = $this->language->get('entry_author');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_rating'] = $this->language->get('entry_rating');
		$data['entry_vote'] = $this->language->get('entry_vote');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');


		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_product_name'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . '&sort=product_name' . $url, true);
		$data['sort_author'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . '&sort=r.author' . $url, true);
		$data['sort_rating'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . '&sort=r.rating' . $url, true);
		$data['sort_status'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . '&sort=r.status' . $url, true);
		$data['sort_date_added'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . '&sort=r.date_added' . $url, true);
		$data['sort_title'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . '&sort=cr.title' . $url, true);
		$data['sort_email'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . '&sort=cr.email' . $url, true);
		/*new update starts*/$data['sort_store_id'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . '&sort=cr.store_id' . $url, true);/*new update ends*/
		$data['sort_vote_up'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . '&sort=votes_up' . $url, true);
		$data['sort_vote_down'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . '&sort=votes_down' . $url, true);


		$url = '';

		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . urldecode(html_entity_decode($this->request->get['filter_title'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urldecode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_store_id'])) {
			$url .= '&filter_store_id=' . urldecode(html_entity_decode($this->request->get['filter_store_id'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_author'])) {
			$url .= '&filter_author=' . urldecode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_rating'])) {
			$url .= '&filter_rating=' . $this->request->get['filter_rating'];
		}
		
		if (isset($this->request->get['filter_product_id'])) {
			$url .= '&filter_product_id=' . $this->request->get['filter_product_id'];
		}

		if (isset($this->request->get['filter_product'])) {
			$url .= '&filter_product=' . urldecode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_vote'])) {
			$url .= '&filter_vote=' . $this->request->get['filter_vote'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . urldecode(html_entity_decode($this->request->get['filter_date_added'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $cireviews_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($cireviews_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($cireviews_total - $this->config->get('config_limit_admin'))) ? $cireviews_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $cireviews_total, ceil($cireviews_total / $this->config->get('config_limit_admin')));

		$data['filter_author'] = $filter_author;
		$data['filter_title'] = $filter_title;
		$data['filter_email'] = $filter_email;
		$data['filter_store_id'] = $filter_store_id;
		$data['filter_rating'] = $filter_rating;
		$data['filter_product_id'] = $filter_product_id;
		$data['filter_product'] = $filter_product;
		$data['filter_vote'] = $filter_vote;
		$data['filter_status'] = $filter_status;
		$data['filter_date_added'] = $filter_date_added;
		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('cireviewpro/cireviews_list.tpl', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['review_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_no_abuse'] = $this->language->get('text_no_abuse');

		$data['entry_author'] = $this->language->get('entry_author');
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_rating'] = $this->language->get('entry_rating');
		$data['entry_date_added'] = $this->language->get('entry_date_added');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_title'] = $this->language->get('entry_title');
		/*new update starts*/$data['entry_store'] = $this->language->get('entry_store');/*new update ends*/
		$data['entry_reply'] = $this->language->get('entry_reply');
		$data['entry_attachimages'] = $this->language->get('entry_attachimages');
		$data['entry_comment'] = $this->language->get('entry_comment');
		$data['entry_votes_up'] = $this->language->get('entry_votes_up');
		$data['entry_votes_down'] = $this->language->get('entry_votes_down');

		$data['entry_abusereason'] = $this->language->get('entry_abusereason');
		$data['entry_abusereason_detail'] = $this->language->get('entry_abusereason_detail');


		$data['help_product'] = $this->language->get('help_product');

		
		
		
		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_abuses'] = $this->language->get('tab_abuses');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_upload'] = $this->language->get('button_upload');
		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['product'])) {
			$data['error_product'] = $this->error['product'];
		} else {
			$data['error_product'] = '';
		}

		if (isset($this->error['author'])) {
			$data['error_author'] = $this->error['author'];
		} else {
			$data['error_author'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['text'])) {
			$data['error_text'] = $this->error['text'];
		} else {
			$data['error_text'] = '';
		}

		if (isset($this->error['votes_up'])) {
			$data['error_votes_up'] = $this->error['votes_up'];
		} else {
			$data['error_votes_up'] = '';
		}

		if (isset($this->error['votes_down'])) {
			$data['error_votes_down'] = $this->error['votes_down'];
		} else {
			$data['error_votes_down'] = '';
		}

		if (isset($this->error['rating'])) {
			$data['error_rating'] = $this->error['rating'];
		} else {
			$data['error_rating'] = array();
		}


		$url = '';

		if (isset($this->request->get['filter_title'])) {
			$url .= '&filter_title=' . urldecode(html_entity_decode($this->request->get['filter_title'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urldecode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_store_id'])) {
			$url .= '&filter_store_id=' . urldecode(html_entity_decode($this->request->get['filter_store_id'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_author'])) {
			$url .= '&filter_author=' . urldecode(html_entity_decode($this->request->get['filter_author'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_rating'])) {
			$url .= '&filter_rating=' . $this->request->get['filter_rating'];
		}
		
		if (isset($this->request->get['filter_product_id'])) {
			$url .= '&filter_product_id=' . $this->request->get['filter_product_id'];
		}

		if (isset($this->request->get['filter_product'])) {
			$url .= '&filter_product=' . urldecode(html_entity_decode($this->request->get['filter_product'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_vote'])) {
			$url .= '&filter_vote=' . $this->request->get['filter_vote'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . urldecode(html_entity_decode($this->request->get['filter_date_added'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . $url, true)
		);

		$data['token'] = $this->session->data['token'];
		/*new update starts*/
		$this->load->model('setting/store');

		$data['stores'] = array();
		
		$data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->language->get('text_default')
		);
		
		$stores = $this->model_setting_store->getStores();

		foreach ($stores as $store) {
			$data['stores'][] = array(
				'store_id' => $store['store_id'],
				'name'     => $store['name']
			);
		}
		/*new update ends*/
		if (!isset($this->request->get['review_id'])) {
			$data['action'] = $this->url->link('cireviewpro/cireviews/add', 'token=' . $this->session->data['token'] . $url, true);
			$data['review_id'] = 0;
		} else {
			$data['action'] = $this->url->link('cireviewpro/cireviews/edit', 'token=' . $this->session->data['token'] . '&review_id=' . $this->request->get['review_id'] . $url, true);
			$data['review_id'] = $this->request->get['review_id'];
		}


		$data['cancel'] = $this->url->link('cireviewpro/cireviews', 'token=' . $this->session->data['token'] . $url, true);

		if (isset($this->request->get['review_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$cireviews_info = $this->model_cireviewpro_cireviews->getCiReview($this->request->get['review_id']);

		}

		if (isset($this->request->post['product_id'])) {
			$data['product_id'] = $this->request->post['product_id'];
		} elseif (!empty($cireviews_info)) {
			$data['product_id'] = $cireviews_info['product_id'];
		} else {
			$data['product_id'] = '';
		}

		if (isset($this->request->post['product'])) {
			$data['product'] = $this->request->post['product'];
		} elseif (!empty($cireviews_info)) {
			$data['product'] = $cireviews_info['product_name'];
		} else {
			$data['product'] = '';
		}
		/*new update starts*/
		if (isset($this->request->post['store_id'])) {
			$data['store_id'] = $this->request->post['store_id'];
		} elseif (!empty($cireviews_info)) {
			$data['store_id'] = $cireviews_info['store_id'];
		} else {
			$data['store_id'] = '';
		}
		/*new update ends*/
		if (isset($this->request->post['author'])) {
			$data['author'] = $this->request->post['author'];
		} elseif (!empty($cireviews_info)) {
			$data['author'] = $cireviews_info['author'];
		} else {
			$data['author'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} elseif (!empty($cireviews_info)) {
			$data['email'] = $cireviews_info['email'];
		} else {
			$data['email'] = '';
		}
		
		if (isset($this->request->post['title'])) {
			$data['title'] = $this->request->post['title'];
		} elseif (!empty($cireviews_info)) {
			$data['title'] = $cireviews_info['title'];
		} else {
			$data['title'] = '';
		}

		if (isset($this->request->post['text'])) {
			$data['text'] = $this->request->post['text'];
		} elseif (!empty($cireviews_info)) {
			$data['text'] = $cireviews_info['text'];
		} else {
			$data['text'] = '';
		}

		if (isset($this->request->post['votes_up'])) {
			$data['votes_up'] = $this->request->post['votes_up'];
		} elseif (!empty($cireviews_info)) {
			$data['votes_up'] = $cireviews_info['votes_up'] ? $cireviews_info['votes_up'] : 0 ;
		} else {
			$data['votes_up'] = 0;
		}

		if (isset($this->request->post['votes_down'])) {
			$data['votes_down'] = $this->request->post['votes_down'];
		} elseif (!empty($cireviews_info)) {
			$data['votes_down'] = $cireviews_info['votes_down'] ? $cireviews_info['votes_down'] : 0;
		} else {
			$data['votes_down'] = 0;
		}

		if (isset($this->request->post['date_added'])) {
			$data['date_added'] = $this->request->post['date_added'];
		} elseif (!empty($cireviews_info)) {
			$data['date_added'] = ($cireviews_info['date_added'] != '0000-00-00 00:00' ? $cireviews_info['date_added'] : date('Y-m-d H:i:s'));
		} else {
			$data['date_added'] = date('Y-m-d H:i:s');
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($cireviews_info)) {
			$data['status'] = $cireviews_info['status'];
		} else {
			$data['status'] = '';
		}

		if (isset($this->request->post['comment'])) {
			$data['comment'] = $this->request->post['comment'];
		} elseif (!empty($cireviews_info)) {
			$data['comment'] = $cireviews_info['comment'];
		} else {
			$data['comment'] = '';
		}

		if (isset($this->request->post['rating'])) {
			$data['rating'] = $this->request->post['rating'];
			$data['cireview_rating_id'] = $this->request->post['cireview_rating_id'];
		} elseif (!empty($cireviews_info)) {
			$ratings = $this->model_cireviewpro_cireviews->getCiReviewRating($cireviews_info['review_id']);
			$data['rating'] = array();
			$data['cireview_rating_id'] = array();
			foreach($ratings as $rating) {
				$data['rating'][$rating['ciratingtype_id']] = $rating['rating'];
				$data['cireview_rating_id'][] = $rating['cireview_rating_id'];
			}
		} else {
			$data['rating'] = array();
			$data['cireview_rating_id'] = array();
		}



		if (isset($this->request->post['cireview_image'])) {
			$attach_images = array();
			if(!empty($this->request->post['cireview_image'])) {
				$attach_images = $this->model_cireviewpro_cireviews->getCiReviewImagesByIds($this->request->post['cireview_image']);	
			}
			
		} elseif (!empty($cireviews_info)) {
			$attach_images = $this->model_cireviewpro_cireviews->getCiReviewImages($cireviews_info['cireview_id']);
		} else {
			$attach_images = $this->model_cireviewpro_cireviews->getCiReviewImages();
		}
		
		$data['attach_images'] = array();
		$data['cireview_image'] = '';
		$cireview_image = array();

		$this->load->model('tool/image');

		$thumbwidth = (int)$this->config->get('cireviewpro_reviewimagesthumb_width');
		$thumbheight = (int)$this->config->get('cireviewpro_reviewimagesthumb_height');
		if(empty($thumbwidth) || is_null($thumbwidth) ) {
			$thumbwidth = 100;
		}
		if(empty($thumbheight) || is_null($thumbheight) ) {
			$thumbheight = 100;
		}
		
		$popupwidth = (int)$this->config->get('cireviewpro_reviewimagespopup_width');
		$popupheight = (int)$this->config->get('cireviewpro_reviewimagespopup_height');
		if(empty($popupwidth) || is_null($popupwidth) ) {
			$popupwidth = 500;
		}
		if(empty($popupheight) || is_null($popupheight) ) {
			$popupheight = 500;
		}

		foreach ($attach_images as $attach_image) {
			if(!empty($attach_image['image']) && file_exists(DIR_IMAGE . $attach_image['image'] )) {
				$thumb = $this->model_tool_image->resize($attach_image['image'], $thumbwidth, $thumbheight);
				$popup = $this->model_tool_image->resize($attach_image['image'], $popupwidth, $popupheight);
			} else {
				$thumb = $this->model_tool_image->resize('no_image.png', $thumbwidth, $thumbheight);
				$popup = $this->model_tool_image->resize('no_image.png', $popupwidth, $popupheight);
			}
			
			$cireview_image[] = $attach_image['cireview_image_id'];
			$data['attach_images'][] = array(
				'cireview_image_id' => $attach_image['cireview_image_id'],
				'thumb' => $thumb,
				'popup' => $popup,
			);
		}
		
		if($cireview_image) {
		$data['cireview_image'] = implode(",", $cireview_image);
		}


		$this->load->model('cireviewpro/ciratingtype');

		$filter_data = array(
			'filter_status' => 1,
			'sort' => 'p.sort_order',
			'order' => 'ASC',
		);
		$rating_types = $this->model_cireviewpro_ciratingtype->getCiRatingTypes($filter_data);
		$data['rating_types'] = array();
		foreach ($rating_types as $rating_type) {
			$data['rating_types'][] = array(
				'ciratingtype_id' => $rating_type['ciratingtype_id'],
				'name' => $rating_type['name'],
			);
		}




		if(!empty($cireviews_info)) {
			$abuses = $this->model_cireviewpro_cireviews->getCiReviewAbuses($cireviews_info['review_id']);			
		} else {
			$abuses = array();
		}

		$data['abuses'] = array();

		$this->load->model('cireviewpro/ciabreason');

		foreach ($abuses as $abuse) {
			$ciabreason_name = $abuse['ciabreason_name'];
			if(empty($ciabreason_name) && $abuse['ciabreason_id'] != 'OTHER') {
				$ciabreason = $this->model_cireviewpro_ciabreason->getCiAbReason($abuse['ciabreason_id']);
				if($ciabreason) {
					$ciabreason_name = $ciabreason['name'];
				}

			}
			$data['abuses'][] = array(
				'cireview_abuse_id' => $abuse['cireview_abuse_id'],
				'ciabreason_name' => $ciabreason_name,
				'text'	=> $abuse['text']
			);
		}


	
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('cireviewpro/cireviews_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'cireviewpro/cireviews')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}


		if (!$this->request->post['product_id']) {
			$this->error['product'] = $this->language->get('error_product');
		}

		// if ((utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 64)) {
		// 	$this->error['author'] = $this->language->get('error_author');
		// }

		// if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
		// 	$this->error['email'] = $this->language->get('error_email');
		// }

		// if (utf8_strlen($this->request->post['text']) < 1) {
		// 	$this->error['text'] = $this->language->get('error_text');
		// }

		if ($this->request->post['votes_up']=='') {
			$this->error['votes_up'] = $this->language->get('error_votes_up');
		}

		if ($this->request->post['votes_down']=='') {
			$this->error['votes_down'] = $this->language->get('error_votes_down');
		}

		if (!isset($this->request->post['rating'])) {
			//$this->error['rating'] = $this->language->get('error_rating');
		} else {
			foreach($this->request->post['rating'] as $ciratingtype_id => $value) {
				if($value < 0 || $value > 5) {
					$this->error['rating'][$ciratingtype_id] = $this->language->get('error_rating');
				}
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}


		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'cireviewpro/cireviews')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		return !$this->error;
	}

	public function autocomplete() {
		$json = array();

		if(isset($this->request->get['filter_title']) || isset($this->request->get['filter_author']) || isset($this->request->get['filter_email']) || isset($this->request->get['filter_store_id']) || isset($this->request->get['filter_rating']) || isset($this->request->get['filter_vote'])) {

			if(isset($this->request->get['filter_title'])) {
				$filter_title = $this->request->get['filter_title'];
			} else {
				$filter_title = null;
			}
			if(isset($this->request->get['filter_author'])) {
				$filter_author = $this->request->get['filter_author'];
			} else {
				$filter_author = null;
			}
			if(isset($this->request->get['filter_email'])) {
				$filter_email = $this->request->get['filter_email'];
			} else {
				$filter_email = null;
			}
			if(isset($this->request->get['filter_store_id'])) {
				$filter_store_id = $this->request->get['filter_store_id'];
			} else {
				$filter_store_id = null;
			}
			if(isset($this->request->get['filter_rating'])) {
				$filter_rating = $this->request->get['filter_rating'];
			} else {
				$filter_rating = null;
			}
			if(isset($this->request->get['filter_vote'])) {
				$filter_vote = $this->request->get['filter_vote'];
			} else {
				$filter_vote = null;
			}
			
			$this->load->model('cireviewpro/cireviews');

			$filter_data = array(
				'filter_title' => $filter_title,
				'filter_author' => $filter_author,
				'filter_email' => $filter_email,
				'filter_store_id' => $filter_store_id,
				'filter_rating' => $filter_rating,
				'filter_vote' => $filter_vote,
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_cireviewpro_cireviews->getCiReviews($filter_data);
			$old_email = array();
			foreach ($results as $result) {
				$json[] = array(
					'review_id'    => $result['review_id'],
					'title'            => strip_tags(html_entity_decode($result['title'], ENT_QUOTES, 'UTF-8')),
					'author'            => strip_tags(html_entity_decode($result['author'], ENT_QUOTES, 'UTF-8')),
					'email'            => $result['email'],
					'rating'            => $result['rating'],
					'votes_up' => $result['votes_up'],
					'votes_down' => $result['votes_down'],
				);
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function upload() {
		$json = array();
		$this->response->addHeader('Content-Type: application/json');
		$this->load->language('tool/upload');
		$this->load->language('cireviewpro/cireviews');

		if(!isset($this->request->post['cireview_images'])) {
			$json['error'] = $this->language->get('text_invalid');
			$this->response->setOutput(json_encode($json));
			$this->response->output();
			exit();
		}

		
		if (!empty($this->request->files['ciattachfile']['name']) && is_file($this->request->files['ciattachfile']['tmp_name'])) {
			// Sanitize the filename
			$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['ciattachfile']['name'], ENT_QUOTES, 'UTF-8')));

			// Validate the filename length
			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 64)) {
				$json['error'] = $this->language->get('error_filename');
			}

			// Allowed file extension types
			$allowed = array();

			$extension_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('cireviewpro_file_ext_allowed'));

			$filetypes = explode("\n", $extension_allowed);

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
			}

			// Allowed file mime types
			$allowed = array();

			$mime_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('cireviewpro_file_mime_allowed'));

			$filetypes = explode("\n", $mime_allowed);

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array($this->request->files['ciattachfile']['type'], $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
			}

			// Check to see if any PHP files are trying to be uploaded
			$content = file_get_contents($this->request->files['ciattachfile']['tmp_name']);

			if (preg_match('/\<\?php/i', $content)) {
				$json['error'] = $this->language->get('error_filetype');
			}

			// Return any upload error
			if ($this->request->files['ciattachfile']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['ciattachfile']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}

		if (!$json) {
			$dir = 'catalog/cireviewpro_images/';
			if(!is_dir(DIR_IMAGE . $dir)) {
				$oldmask = umask(0);
				mkdir(DIR_IMAGE .$dir, 0777);
				umask($oldmask);
			}

			$pathfinfo = pathinfo($filename);

			$filename = $pathfinfo['filename'] . time() .'.'. $pathfinfo['extension'];

			$file = $dir. $filename;


			move_uploaded_file($this->request->files['ciattachfile']['tmp_name'], DIR_IMAGE . $file);

			// hold all images for temporary
			$this->load->model('cireviewpro/cireviews');
			$this->load->model('tool/image');

			$cireviews_info = $this->model_cireviewpro_cireviews->getCiReview($this->request->get['review_id']);

			$cireview_id = 0;
			if($cireviews_info) {
				$$cireview_id = $cireviews_info['cireview_id'];
			}


			// id is cireview_image_id
			$this->model_cireviewpro_cireviews->addUpload($file, $cireview_id);
			
			$json['attach_images'] = array();


			$thumbwidth = (int)$this->config->get('cireviewpro_reviewimagesthumb_width');
			$thumbheight = (int)$this->config->get('cireviewpro_reviewimagesthumb_height');
			if(empty($thumbwidth) || is_null($thumbwidth) ) {
				$thumbwidth = 100;
			}
			if(empty($thumbheight) || is_null($thumbheight) ) {
				$thumbheight = 100;
			}
			
			$popupwidth = (int)$this->config->get('cireviewpro_reviewimagespopup_width');
			$popupheight = (int)$this->config->get('cireviewpro_reviewimagespopup_height');
			if(empty($popupwidth) || is_null($popupwidth) ) {
				$popupwidth = 500;
			}
			if(empty($popupheight) || is_null($popupheight) ) {
				$popupheight = 500;
			}
			$attach_images = $this->model_cireviewpro_cireviews->getUploadedImage($cireview_id);
			$ids = array();
			foreach($attach_images as $attach_image) {				
				$ids[] = $attach_image['cireview_image_id'];
				if(!empty($attach_image['image']) && file_exists(DIR_IMAGE .$attach_image['image'] )) {
					$thumb = $this->model_tool_image->resize($attach_image['image'], $thumbwidth, $thumbheight ) ;
					$popup = $this->model_tool_image->resize($attach_image['image'], $popupwidth, $popupheight ) ;
				} else {
					$thumb = $this->model_tool_image->resize('no_image.png', $thumbwidth, $thumbheight ) ;
					$popup = $this->model_tool_image->resize('no_image.png', $popupwidth, $popupheight ) ;
				}

				$json['attach_images'][] = array(
					'cireview_image_id' => $attach_image['cireview_image_id'],
					'thumb' => $thumb,
					'popup' => $popup,
				);	
				
			}

			$json['code'] = implode(",", $ids);
			$json['success'] = $this->language->get('text_upload');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function deleteAbuse() {
		$json = array();
		if(!empty($this->request->post['id'])) {
			$this->load->model('cireviewpro/cireviews');
			$this->load->language('cireviewpro/cireviews');

			$this->model_cireviewpro_cireviews->removeAbuse($this->request->post['id'], $this->request->get['review_id']);
			$json['success'] = $this->language->get('text_abuse_deleted');

		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function deleteImage() {
		$json = array();
		if(!empty($this->request->post['id'])) {
			$this->load->model('cireviewpro/cireviews');
			$this->load->model('tool/image');

			$this->model_cireviewpro_cireviews->removeUpload($this->request->post['id']);

			$json['success'] = $this->language->get('text_delete');;

			$json['attach_images'] = array();

			$cireviews_info = $this->model_cireviewpro_cireviews->getCiReview($this->request->get['review_id']);

			$cireview_id = 0;
			if($cireviews_info) {
				$$cireview_id = $cireviews_info['cireview_id'];
			}

			


			$thumbwidth = (int)$this->config->get('cireviewpro_reviewimagesthumb_width');
			$thumbheight = (int)$this->config->get('cireviewpro_reviewimagesthumb_height');
			if(empty($thumbwidth) || is_null($thumbwidth) ) {
				$thumbwidth = 100;
			}
			if(empty($thumbheight) || is_null($thumbheight) ) {
				$thumbheight = 100;
			}
			
			$popupwidth = (int)$this->config->get('cireviewpro_reviewimagespopup_width');
			$popupheight = (int)$this->config->get('cireviewpro_reviewimagespopup_height');
			if(empty($popupwidth) || is_null($popupwidth) ) {
				$popupwidth = 500;
			}
			if(empty($popupheight) || is_null($popupheight) ) {
				$popupheight = 500;
			}
			$attach_images = $this->model_cireviewpro_cireviews->getUploadedImage($cireview_id);
			$ids = array();
			foreach($attach_images as $attach_image) {
				if(!empty($attach_image['image']) && file_exists(DIR_IMAGE .$attach_image['image'] )) {
					$thumb = $this->model_tool_image->resize($attach_image['image'], $thumbwidth, $thumbheight ) ;
					$popup = $this->model_tool_image->resize($attach_image['image'], $popupwidth, $popupheight ) ;
				} else {
					$thumb = $this->model_tool_image->resize('no_image.png', $thumbwidth, $thumbheight ) ;
					$popup = $this->model_tool_image->resize('no_image.png', $popupwidth, $popupheight ) ;
				}

				$ids[] = $attach_image['cireview_image_id'];
				$json['attach_images'][] = array(
					'cireview_image_id' => $attach_image['cireview_image_id'],
					'thumb' => $thumb,
					'popup' => $popup,
				);
				
			}

			$json['code'] = '';
			if($ids) {	$json['code'] = implode(",", $ids); }

		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));	
	}
}
