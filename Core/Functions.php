<?php
	define('STORAGE_TEMPLATES', 'Core/Storage/Templates/');
	define('TEMPLATES', 'templates/');
	define('ROTA_APELIDO', '');
	define('SHOW_ALL_ERRORS', false);

	/*
	*@description carrega sozinho o arquivo quando é instanciado uma classe
	*@ex: $obj = new \Utils\Teste(); faz: require(Utils\Teste.php)
	*/
	function __autoload($str)
	{
		if(file_exists($str . ".php"))
			require_once($str . ".php");
	}

	use Utils\ResourceUtils;

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