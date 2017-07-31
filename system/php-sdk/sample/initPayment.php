<?php
header('Content-Type: text/html; charset=UTF-8');

// Miqpay data
$publicKey = 'application-24';
$secretKey = 'c984d1705f4dc1873cf9d24da5d9d252';

// Order params
$params['amount'] = 1;
$params['currency'] = 'RUB';
$params['orderId'] = 1;
$params['paymentType'] = 'app';
$params['payment'] = 'ALL';

require_once('../MiqPay.php');

$miqPay = new MiqPay($publicKey,$secretKey);
$response = $miqPay->api('initPayment', $params);

if(!empty($response->result->payUrl)){
    header("Location: " . $response->result->payUrl);
}
