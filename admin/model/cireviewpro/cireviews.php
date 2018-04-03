<?php
class ModelCiReviewProCiReviews extends Model {

	public function getCiReviewAbuses($review_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview_abuse WHERE review_id='". (int)$review_id ."' AND status=1");
		return $query->rows;
	}	

	public function getCiReviewRating($review_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview_rating WHERE review_id='". (int)$review_id ."' AND status=1");
		return $query->rows;
		
	}

	public function deleteCiReview($review_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview WHERE review_id='". (int)$review_id ."'");

		if($query->num_rows) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE review_id='". (int)$review_id ."'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "cireview WHERE review_id='". (int)$review_id ."'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_rating WHERE review_id='". (int)$review_id ."'");
		
		$query2 = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview_image WHERE cireview_id='". (int)$query->row['cireview_id'] ."'");

		foreach($query2->rows as $cireview_image) {
			@unlink(DIR_IMAGE . $cireview_image['image']);
		}

		$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_image WHERE cireview_id='". (int)$query->row['cireview_id'] ."'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_vote WHERE review_id='". (int)$review_id ."'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_abuse WHERE review_id='". (int)$review_id ."'");
		}
	}

	public function getCiReviewImages($cireview_id=0) {
		$sql = "SELECT * FROM " . DB_PREFIX . "cireview_image WHERE status=1";

		if($cireview_id!=0) {
			$sql .= " AND cireview_id='". (int)$cireview_id ."' ";
		} else {
			$sql .= " AND session_id='". $this->db->escape($this->session->getId()) ."' AND cireview_id='0'";
		}
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getCiReviewImagesByIds($cireview_image_ids) {
		$sql = "SELECT * FROM " . DB_PREFIX . "cireview_image WHERE status=1 AND cireview_image_id IN(".  $cireview_image_ids .")";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function addUpload($image, $cireview_id) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "cireview_image SET image='". $this->db->escape($image) ."', session_id='". $this->db->escape($this->session->getId()) ."', status='1', cireview_id='".(int)$cireview_id ."'");
		return $this->db->getLastId();
	}

	public function getUploadedImage($cireview_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview_image WHERE cireview_id='".(int)$cireview_id ."' AND session_id='". $this->db->escape($this->session->getId()) ."' AND status=1");
		return $query->rows;
	}

	public function removeAbuse($cireview_abuse_id, $review_id) {

		$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_abuse WHERE cireview_abuse_id='".(int)$cireview_abuse_id ."' AND review_id='".(int)$review_id ."'");
	}

	public function removeUpload($cireview_image_id) {
		$cireview_image_info = $this->getCiReviewImage($cireview_image_id);
		if($cireview_image_info){
			@unlink(DIR_IMAGE . $cireview_image_info['image']);
			$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_image WHERE cireview_image_id='". $this->db->escape($cireview_image_id) ."'");
		}
	}

	public function getCiReviewImage($cireview_image_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview_image WHERE cireview_image_id='". (int)$cireview_image_id ."' AND status=1");
		return $query->row;
	}

	public function addCiReview($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['author']) . "', product_id = '" . (int)$data['product_id'] . "', status = '" . (int)$data['status'] . "', text = '" . $this->db->escape($data['text']) . "', date_added = '" . $this->db->escape($data['date_added']) . "'");

		$review_id = $this->db->getLastId();

		/*new update starts*/
		$this->db->query("INSERT INTO " . DB_PREFIX . "cireview SET email = '" . $this->db->escape($data['email']) . "', title = '" . $this->db->escape($data['title']) . "', store_id = '" .  (int)$data['store_id'] . "', comment = '" . $this->db->escape($data['comment']) . "', product_id = '" . (int)$data['product_id'] . "', review_id = '" . (int)$review_id . "'");
		/*new update ends*/
		$cireview_id = $this->db->getLastId();

		$this->db->query("UPDATE " . DB_PREFIX . "cireview_image SET cireview_id = '" . (int)$cireview_id . "' WHERE session_id = '" . $this->db->escape($this->session->getId()) . "' AND cireview_id='0'");

		if(!empty($data['cireview_image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "cireview_image SET cireview_id = '" . (int)$cireview_id . "' WHERE cireview_image_id IN(". $data['cireview_image'] .") AND cireview_id='0'");
		}


		if(isset($data['rating'])) {
			$rating = 0;
			$ratings = 0;

			$this->load->model('cireviewpro/ciratingtype');

			foreach($data['rating'] as $ciratingtype_id => $cirating) {
				$ratingtype_info = $this->model_cireviewpro_ciratingtype->getCiRatingTypeDescriptions($ciratingtype_id);
				if($ratingtype_info) {
				$ratings += $cirating;

				$ciratingtype_names = array();
				$ciratingtype_name = '';
				foreach ($ratingtype_info as $key => $value) {
					$ciratingtype_names[$value['language_id']] = $value['name'];
					if($value['language_id'] == $this->config->get('config_language_id')) {
						$ciratingtype_name = $value['name'];

					}
				}

				$this->db->query("INSERT INTO " . DB_PREFIX . "cireview_rating SET  product_id = '" . (int)$data['product_id'] . "', status = '1', rating = '" . (int)$cirating . "', review_id = '" . (int)$review_id . "', cireview_id = '" . (int)$cireview_id . "', ciratingtype_id = '" . (int)$ciratingtype_id . "', ciratingtype_name = '" . ($this->db->escape(json_encode($ciratingtype_names))) . "'");

				}
				
			}

			if($ratings) {
				$rating = $ratings / count($data['rating']);
			}

			$this->db->query("UPDATE " . DB_PREFIX . "review SET rating = '" . (int)$rating . "' WHERE review_id = '" . (int)$review_id . "'");

		}

		if(isset($data['votes_up'])) {
			$data['votes_up'] = intval($data['votes_up']);
			
			// get previous votes up and update only if news
			// if lesser votes_up admin want but we have more then delete extra
			// if greater votes_up admin want then add extras

			$cireview_vote_info = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview_vote WHERE review_id = '" . (int)$review_id . "' AND cireview_id = '" . (int)$cireview_id . "' AND vote=1 AND status=1");

// max_allowed_packet
// show variables like 'max_allowed_packet' 

			// 

// SET GLOBAL max_allowed_packet=524288000;


// Tuning bulk_insert_buffer_size may make the operation go faster, but will work regardless of the value.

// key_buffer_size has to do with read caching.

			$cireview_vote = $cireview_vote_info->rows;
			$cireviewvotes = $cireview_vote_info->rows;

			foreach ($cireviewvotes as &$value) {
				$value['product_id'] = $data['product_id'];
				if(empty($value['session_id'])) {
					$value['session_id'] = $this->session->getId();	
				}
			}

			$requirement = false;
			// we have more votes than admin want
			if(count($cireview_vote) > $data['votes_up']) {
				$cireview_vote = array_slice($cireview_vote, 0, (int)$data['votes_up']);
				if($cireview_vote) {
					foreach($cireview_vote as $cireviewvote) {
						$cireviewvote['product_id'] = $data['product_id'];
						$cireviewvotes[] = $cireviewvote;
					}
				} else {
					$cireviewvotes = array();
				}
			}

			// we have less votes than admin want
			if(count($cireview_vote) < $data['votes_up']) {
				$dummy = $data['votes_up'] - count($cireview_vote);
				$requirement = true;	
				for($i=0;$i<$dummy;$i++) {
					$cireviewvotes[] = array(
						'cireview_vote_id' => 0,
						'cireview_id' => $cireview_id,
						'review_id' => $review_id,
						'product_id' => $data['product_id'],
						'vote' => 1,
						'status' => 1,
						'session_id' => $this->session->getId(),
						'date_added' => date('Y-m-d H:i:s'),
						'date_modified' => date('Y-m-d H:i:s'),
					);
				}
			}


			$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_vote WHERE review_id = '" . (int)$review_id . "' AND cireview_id = '" . (int)$cireview_id . "' AND vote=1 AND status=1");
			foreach($cireviewvotes as $cireviewvote) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "cireview_vote SET cireview_vote_id = '" . (int)$cireviewvote['cireview_vote_id'] . "', cireview_id = '" . (int)$cireviewvote['cireview_id'] . "', review_id = '" . (int)$cireviewvote['review_id'] . "', product_id = '" . (int)$cireviewvote['product_id'] . "', status = '". (int)$cireviewvote['status'] ."', session_id = '" . $this->db->escape($cireviewvote['session_id']) . "', date_added='". $this->db->escape($cireviewvote['date_added']) ."', vote='". (int)$cireviewvote['vote'] ."'");
			}
			

		}

		if(isset($data['votes_down'])) {
			// get previous votes up and update only if news
			// if lesser votes_down admin want but we have more then delete extra
			// if greater votes_down admin want then add extras

			$cireview_vote_info = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview_vote WHERE review_id = '" . (int)$review_id . "' AND cireview_id = '" . (int)$cireview_id . "' AND vote=0 AND status=1");


			$cireview_vote = $cireview_vote_info->rows;
			$cireviewvotes = $cireview_vote_info->rows;

			foreach ($cireviewvotes as &$value) {
				$value['product_id'] = $data['product_id'];
				if(empty($value['session_id'])) {
					$value['session_id'] = $this->session->getId();	
				}
			}

			$requirement = false;
			// we have more votes than admin want
			if(count($cireview_vote) > $data['votes_down']) {
				$cireview_vote = array_slice($cireview_vote, 0, (int)$data['votes_down']);
				if($cireview_vote) {
					foreach($cireview_vote as $cireviewvote) {
						$cireviewvote['product_id'] = $data['product_id'];
						$cireviewvotes[] = $cireviewvote;
					}
				} else {
					$cireviewvotes = array();
				}
			}

			// we have less votes than admin want
			if(count($cireview_vote) < $data['votes_down']) {
				$dummy = $data['votes_down'] - count($cireview_vote);
				$requirement = true;	
				for($i=0;$i<$dummy;$i++) {
					$cireviewvotes[] = array(
						'cireview_vote_id' => 0,
						'cireview_id' => $cireview_id,
						'review_id' => $review_id,
						'product_id' => $data['product_id'],
						'vote' => 0,
						'status' => 1,
						'session_id' => $this->session->getId(),
						'date_added' => date('Y-m-d H:i:s'),
						'date_modified' => date('Y-m-d H:i:s'),
					);
				}
			}


			$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_vote WHERE review_id = '" . (int)$review_id . "' AND cireview_id = '" . (int)$cireview_id . "' AND vote=0 AND status=1");


			foreach($cireviewvotes as $cireviewvote) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "cireview_vote SET cireview_vote_id = '" . (int)$cireviewvote['cireview_vote_id'] . "', cireview_id = '" . (int)$cireviewvote['cireview_id'] . "', review_id = '" . (int)$cireviewvote['review_id'] . "', product_id = '" . (int)$cireviewvote['product_id'] . "', status = '". (int)$cireviewvote['status'] ."', session_id = '" . $this->db->escape($cireviewvote['session_id']) . "', date_added='". $this->db->escape($cireviewvote['date_added']) ."', vote='". (int)$cireviewvote['vote'] ."'");
				
			}
		}
		
	}

	public function editCiReview($review_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['author']) . "', product_id = '" . (int)$data['product_id'] . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', status = '" . (int)$data['status'] . "', date_added = '" . $this->db->escape($data['date_added']) . "', date_modified = NOW() WHERE review_id = '" . (int)$review_id . "'");

		$cireview_info = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview WHERE review_id = '" . (int)$review_id . "'");
		/*new update starts*/
		if($cireview_info->num_rows) {
			$cireview_id = $cireview_info->row['cireview_id'];
			$this->db->query("UPDATE " . DB_PREFIX . "cireview SET email = '" . $this->db->escape($data['email']) . "', title = '" . $this->db->escape($data['title']) . "', store_id = '" .  (int)$data['store_id'] . "', comment = '" . $this->db->escape($data['comment']) . "', product_id = '" . (int)$data['product_id'] . "' WHERE review_id = '" . (int)$review_id . "'");
		} else {
			$this->db->query("INSERT INTO " . DB_PREFIX . "cireview SET email = '" . $this->db->escape($data['email']) . "', title = '" . $this->db->escape($data['title']) . "', store_id = '" .  (int)$data['store_id'] . "', comment = '" . $this->db->escape($data['comment']) . "', product_id = '" . (int)$data['product_id'] . "', review_id = '" . (int)$review_id . "'");

			$cireview_id = $this->db->getLastId();
		}
		/*new update ends*/

		$this->db->query("UPDATE " . DB_PREFIX . "cireview_image SET cireview_id = '" . (int)$cireview_id . "' WHERE session_id = '" . $this->db->escape($this->session->getId()) . "' AND cireview_id='0'");

		if(!empty($data['cireview_image'])) {
			$this->db->query("UPDATE " . DB_PREFIX . "cireview_image SET cireview_id = '" . (int)$cireview_id . "' WHERE cireview_image_id IN(". $data['cireview_image'] .") AND cireview_id='0'");
		}

		if(isset($data['rating'])) {
			$rating = 0;
			$ratings = 0;

			$this->load->model('cireviewpro/ciratingtype');

			$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_rating WHERE review_id = '" . (int)$review_id . "'");

			foreach($data['rating'] as $ciratingtype_id => $cirating) {
				$ratingtype_info = $this->model_cireviewpro_ciratingtype->getCiRatingTypeDescriptions($ciratingtype_id);
				if($ratingtype_info) {
				$ratings += $cirating;

				$ciratingtype_names = array();
				$ciratingtype_name = '';
				foreach ($ratingtype_info as $key => $value) {
					$ciratingtype_names[$value['language_id']] = $value['name'];
					if($value['language_id'] == $this->config->get('config_language_id')) {
						$ciratingtype_name = $value['name'];

					}
				}

				$this->db->query("INSERT INTO " . DB_PREFIX . "cireview_rating SET cireview_rating_id='". (isset($data['cireview_rating_id'][$ciratingtype_id]) ? $data['cireview_rating_id'][$ciratingtype_id] : 0) ."', product_id = '" . (int)$data['product_id'] . "', status = '1', rating = '" . (int)$cirating . "', review_id = '" . (int)$review_id . "', cireview_id = '" . (int)$cireview_id . "', ciratingtype_id = '" . (int)$ciratingtype_id . "', ciratingtype_name = '" . ($this->db->escape(json_encode($ciratingtype_names))) . "'");

				}
				
			}

			if($ratings) {
				$rating = $ratings / count($data['rating']);
			}

			$this->db->query("UPDATE " . DB_PREFIX . "review SET rating = '" . (int)$rating . "' WHERE review_id = '" . (int)$review_id . "'");
		}


		if(isset($data['votes_up'])) {
			$data['votes_up'] = intval($data['votes_up']);
			
			// get previous votes up and update only if news
			// if lesser votes_up admin want but we have more then delete extra
			// if greater votes_up admin want then add extras

			$cireview_vote_info = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview_vote WHERE review_id = '" . (int)$review_id . "' AND cireview_id = '" . (int)$cireview_id . "' AND vote=1 AND status=1");

// max_allowed_packet
// show variables like 'max_allowed_packet' 

			// 

// SET GLOBAL max_allowed_packet=524288000;


// Tuning bulk_insert_buffer_size may make the operation go faster, but will work regardless of the value.

// key_buffer_size has to do with read caching.

			$cireview_vote = $cireview_vote_info->rows;
			$cireviewvotes = $cireview_vote_info->rows;

			foreach ($cireviewvotes as &$value) {
				$value['product_id'] = $data['product_id'];
				if(empty($value['session_id'])) {
					$value['session_id'] = $this->session->getId();	
				}
			}

			$requirement = false;
			// we have more votes than admin want
			if(count($cireview_vote) > $data['votes_up']) {
				$cireview_vote = array_slice($cireview_vote, 0, (int)$data['votes_up']);
				if($cireview_vote) {
					foreach($cireview_vote as $cireviewvote) {
						$cireviewvote['product_id'] = $data['product_id'];
						$cireviewvotes[] = $cireviewvote;
					}
				} else {
					$cireviewvotes = array();
				}
			}

			// we have less votes than admin want
			if(count($cireview_vote) < $data['votes_up']) {
				$dummy = $data['votes_up'] - count($cireview_vote);
				$requirement = true;	
				for($i=0;$i<$dummy;$i++) {
					$cireviewvotes[] = array(
						'cireview_vote_id' => 0,
						'cireview_id' => $cireview_id,
						'review_id' => $review_id,
						'product_id' => $data['product_id'],
						'vote' => 1,
						'status' => 1,
						'session_id' => $this->session->getId(),
						'date_added' => date('Y-m-d H:i:s'),
						'date_modified' => date('Y-m-d H:i:s'),
					);
				}
			}


			$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_vote WHERE review_id = '" . (int)$review_id . "' AND cireview_id = '" . (int)$cireview_id . "' AND vote=1 AND status=1");
			foreach($cireviewvotes as $cireviewvote) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "cireview_vote SET cireview_vote_id = '" . (int)$cireviewvote['cireview_vote_id'] . "', cireview_id = '" . (int)$cireviewvote['cireview_id'] . "', review_id = '" . (int)$cireviewvote['review_id'] . "', product_id = '" . (int)$cireviewvote['product_id'] . "', status = '". (int)$cireviewvote['status'] ."', session_id = '" . $this->db->escape($cireviewvote['session_id']) . "', date_added='". $this->db->escape($cireviewvote['date_added']) ."', vote='". (int)$cireviewvote['vote'] ."'");
			}
			

		}

		if(isset($data['votes_down'])) {
			// get previous votes up and update only if news
			// if lesser votes_down admin want but we have more then delete extra
			// if greater votes_down admin want then add extras

			$cireview_vote_info = $this->db->query("SELECT * FROM " . DB_PREFIX . "cireview_vote WHERE review_id = '" . (int)$review_id . "' AND cireview_id = '" . (int)$cireview_id . "' AND vote=0 AND status=1");


			$cireview_vote = $cireview_vote_info->rows;
			$cireviewvotes = $cireview_vote_info->rows;

			foreach ($cireviewvotes as &$value) {
				$value['product_id'] = $data['product_id'];
				if(empty($value['session_id'])) {
					$value['session_id'] = $this->session->getId();	
				}
			}

			$requirement = false;
			// we have more votes than admin want
			if(count($cireview_vote) > $data['votes_down']) {
				$cireview_vote = array_slice($cireview_vote, 0, (int)$data['votes_down']);
				if($cireview_vote) {
					foreach($cireview_vote as $cireviewvote) {
						$cireviewvote['product_id'] = $data['product_id'];
						$cireviewvotes[] = $cireviewvote;
					}
				} else {
					$cireviewvotes = array();
				}
			}

			// we have less votes than admin want
			if(count($cireview_vote) < $data['votes_down']) {
				$dummy = $data['votes_down'] - count($cireview_vote);
				$requirement = true;	
				for($i=0;$i<$dummy;$i++) {
					$cireviewvotes[] = array(
						'cireview_vote_id' => 0,
						'cireview_id' => $cireview_id,
						'review_id' => $review_id,
						'product_id' => $data['product_id'],
						'vote' => 0,
						'status' => 1,
						'session_id' => $this->session->getId(),
						'date_added' => date('Y-m-d H:i:s'),
						'date_modified' => date('Y-m-d H:i:s'),
					);
				}
			}


			$this->db->query("DELETE FROM " . DB_PREFIX . "cireview_vote WHERE review_id = '" . (int)$review_id . "' AND cireview_id = '" . (int)$cireview_id . "' AND vote=0 AND status=1");


			foreach($cireviewvotes as $cireviewvote) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "cireview_vote SET cireview_vote_id = '" . (int)$cireviewvote['cireview_vote_id'] . "', cireview_id = '" . (int)$cireviewvote['cireview_id'] . "', review_id = '" . (int)$cireviewvote['review_id'] . "', product_id = '" . (int)$cireviewvote['product_id'] . "', status = '". (int)$cireviewvote['status'] ."', session_id = '" . $this->db->escape($cireviewvote['session_id']) . "', date_added='". $this->db->escape($cireviewvote['date_added']) ."', vote='". (int)$cireviewvote['vote'] ."'");
				
			}
		}

	}
	/*new update starts*/
	public function getCiReview($review_id) {

		$query = $this->db->query("SELECT r.*, cr.store_id, cr.email, cr.title, cr.comment, cr.coupon_code, cr.cireview_id, pd.name as product_name, p.image as product_image, SUM(crv.vote=1) as votes_up, SUM(crv.vote=0) as votes_down FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "cireview cr ON (r.review_id = cr.review_id) LEFT JOIN " . DB_PREFIX . "cireview_vote crv ON (cr.cireview_id = crv.cireview_id) LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE r.review_id>0 AND pd.language_id='". (int)$this->config->get('config_language_id') ."' AND r.review_id='". (int)$review_id ."'");
		return $query->row;
	}
	/*new update ends*/
	/*new update starts*/
	public function getCiReviews($data = array()) {
		$sql = "SELECT r.*, cr.email, cr.store_id, cr.title, cr.comment, cr.coupon_code, cr.cireview_id, pd.name as product_name, p.image as product_image, SUM(crv.vote=1) as votes_up, SUM(crv.vote=0) as votes_down FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "cireview cr ON (r.review_id = cr.review_id) LEFT JOIN " . DB_PREFIX . "cireview_vote crv ON (cr.cireview_id = crv.cireview_id) LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE r.review_id>0 AND pd.language_id='". (int)$this->config->get('config_language_id') ."'";

		if (isset($data['filter_store_id']) && !is_null($data['filter_store_id'])) {
			$sql .= " AND cr.store_id='" . (int)$data['filter_store_id'] . "'";
		}
		/*new update ends*/
		if (!empty($data['filter_title'])) {
			$sql .= " AND cr.title LIKE '" . $this->db->escape($data['filter_title']) . "%'";
		}
		
		if (!empty($data['filter_email'])) {
			$sql .= " AND cr.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}
		
		if (!empty($data['filter_author'])) {
			$sql .= " AND r.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
		}

		if (!empty($data['filter_rating'])) {
			$sql .= " AND r.rating = '" . $this->db->escape($data['filter_rating']) . "'";
		}

		if (!empty($data['filter_product_id'])) {
			$sql .= " AND r.product_id = '" . $this->db->escape($data['filter_product_id']) . "'";
		}

		if (!empty($data['filter_product'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
		}

		if (isset($data['filter_vote']) && !is_null($data['filter_vote'])) {
			$sql .= " AND crv.vote = '" . $this->db->escape($data['filter_vote']) . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND r.status = '" . (int)$data['filter_status'] . "'";
		}
		
		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		$sql .= " GROUP BY r.review_id";
		

		

		$sort_data = array(
			'r.author',
			'r.status',
			'r.rating',
			'r.date_added',
			'cr.email',
			'cr.title',			
			/*new update starts*/'cr.store_id',/*new update ends*/			
			'votes_down',
			'votes_up',
			'product_name',
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY r.date_added";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalCiReviews($data = array()) {
		/*new update starts*/$sql = "SELECT COUNT(DISTINCT r.review_id) AS total FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "cireview cr ON (r.review_id = cr.review_id) LEFT JOIN " . DB_PREFIX . "cireview_vote crv ON (cr.cireview_id = crv.cireview_id) LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE r.review_id>0 AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (isset($data['filter_store_id']) && !is_null($data['filter_store_id'])) {
			$sql .= " AND cr.store_id='" . (int)$data['filter_store_id'] . "'";
		}
		/*new update ends*/
		if (!empty($data['filter_title'])) {
			$sql .= " AND cr.title LIKE '" . $this->db->escape($data['filter_title']) . "%'";
		}
		
		if (!empty($data['filter_email'])) {
			$sql .= " AND cr.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}
		
		if (!empty($data['filter_author'])) {
			$sql .= " AND r.author LIKE '" . $this->db->escape($data['filter_author']) . "%'";
		}

		if (!empty($data['filter_rating'])) {
			$sql .= " AND r.rating = '" . $this->db->escape($data['filter_rating']) . "'";
		}

		if (!empty($data['filter_product_id'])) {
			$sql .= " AND r.product_id = '" . $this->db->escape($data['filter_product_id']) . "'";
		}

		if (!empty($data['filter_product'])) {
			$sql .= " AND pd.name LIKE '" . $this->db->escape($data['filter_product']) . "%'";
		}

		if (isset($data['filter_vote']) && !is_null($data['filter_vote'])) {
			$sql .= " AND crv.vote = '" . $this->db->escape($data['filter_vote']) . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$sql .= " AND r.status = '" . (int)$data['filter_status'] . "'";
		}
		
		if (!empty($data['filter_date_added'])) {
			$sql .= " AND DATE(r.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
}