<?php
/**
 * MiqPay Payment Module
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 *
 * @category        MiqPay
 * @package         miqpay/miqpay
 * @version         1.0.0
 * @author          MiqPay
 * @copyright       Copyright (c) 2017 MiqPay
 * @license         http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 *
 */

class MiqPay
{
    private $supportedMiqpayMethods = array('initPayment', 'getPayment', 'refundPayment');
    private $requiredMiqpayMethodsParams = array(
        'initPayment' => array('amount', 'currency', 'orderId', 'paymentType','payment'),
        'getPayment' => array('transactionId'),
        'refundPayment' => array('transactionId','refundAmount'),
    );

    private $supportedMiqpayIp = array(
        '87.236.16.172',
        '127.0.0.1' // for debug
    );

    private $apiUrl = 'http://miqpay.devpastet.ru/api/';
    private $publicKey;
    private $secretKey;

    public function __construct($publicKey = null, $secretKey = null)
    {
        $this->publicKey = $publicKey;
        $this->secretKey = $secretKey;
    }

    /**
     * Return IP address
     */
    protected function getIp()
    {
        return $_SERVER['REMOTE_ADDR'];
    }

    /**
     * Call API
     */
    public function api($method, $params = array())
    {
        $ip = $this->getIp();
        if (!in_array($method, $this->supportedMiqpayMethods)) {
            throw new UnexpectedValueException('Method is not supported');
        }
        if (isset($this->requiredMiqpayMethodsParams[$method])) {
            foreach ($this->requiredMiqpayMethodsParams[$method] as $rParam) {
                if (!isset($params[$rParam])) {
                    throw new InvalidArgumentException('Param '.$rParam.' is null');
                }
            }
        }

        $params['secretKey'] = $this->secretKey;
        if (empty($params['secretKey'])) {
            throw new InvalidArgumentException('SecretKey is null');
        }

        $params['publicKey'] = $this->publicKey;
        if (empty($params['publicKey'])) {
            throw new InvalidArgumentException('PublicKey is null');
        };

        /*if (!in_array($ip, $this->supportedMiqpayIp)) {
            throw new InvalidArgumentException('IP address Error');
        }*/

        $requestUrl = $this->apiUrl.$method.'?'.http_build_query($params);

        $response = json_decode(file_get_contents($requestUrl));
        if (!is_object($response)) {
            throw new InvalidArgumentException('Temporary server error. Please try again later.');
        }

        return $response;

    }

}