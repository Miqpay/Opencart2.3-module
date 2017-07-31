<?php
header('Content-Type: text/html; charset=UTF-8');

// Miqpay data
$publicKey = 'application-24';
$secretKey = 'c984d1705f4dc1873cf9d24da5d9d252';

// Order params
$params['transactionId'] = 1206;
$params['refundAmount'] = 1;

require_once('../MiqPay.php');

$miqPay = new MiqPay($publicKey,$secretKey);
$response = $miqPay->api('refundPayment', $params);

print_r($response);