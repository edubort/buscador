<?php
	namespace Utils;
	
	class FileUtils
	{
		public function incluir($strArquivo, $arr = null)
		{
			$strArquivo = normalizarCaminho($strArquivo);

			if(file_exists($strArquivo) == false)
				die('Arquivo não existe: ' . $strArquivo);

			if(is_array($arr))
				extract($arr);

			ob_start();
			require_once($strArquivo);
			return ob_get_clean();
		}
	}