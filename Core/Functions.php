<?php
	//namespace Core;

	define('STORAGE_TEMPLATES', 'Core/Storage/Templates/');
	define('TEMPLATES', 'templates/');
	define('ROTA_APELIDO', '');
	define('SHOW_ALL_ERRORS', false);

	use Utils\ResourceUtils;

	/*
	*@description carrega sozinho o arquivo quando é instanciado uma classe
	*@ex: $obj = new \Utils\Teste(); faz: require(Utils\Teste.php)
	*/
	spl_autoload_register(function($str){

		$str = preg_replace("/\\\/", "/", $str);

		if(file_exists($str . ".php"))
			require_once($str . ".php");
	});

	/*
	*@description Carrega a URL raiz do site + o passado
	*@ex: url('/home') saida: localhost/home
	*/
	function url($strParam = null)
	{
		$objResource = new ResourceUtils();
		$strHost = $objResource->getHost();
		$strApelidoRota = ROTA_APELIDO;

		if($strApelidoRota != '')
			$strHost .= "/".$strApelidoRota;

		return $strHost.$strParam;
	}

	if(SHOW_ALL_ERRORS == true)
	{
		error_reporting(E_ALL ^ E_NOTICE ^ E_WARNING);
		ini_set('display_errors', 1);
	}
	else{
		error_reporting(0);	
	}