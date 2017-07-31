<?php
class ModelExtensionPaymentMiqpay extends Model {
    public function getMethod($address) {
        $this->load->language('extension/payment/miqpay');

        if ($this->config->get('miqpay_status')) {
            $status = TRUE;
        } else {
            $status = FALSE;
        }

        $method_data = array();

        if ($status) {
            $method_data = array(
                'code'         => 'miqpay',
                'title'      => $this->language->get('text_title'),
                'terms'      => '',
                'sort_order' => 0
            );
        }

        return $method_data;
    }
}
?>