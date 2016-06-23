<?php
	namespace Utils;
	
	class FileUtils
	{
		public function incluir($strArquivo, $arr = null)
		{
			if(file_exists($strArquivo) == false)
				die('Arquivo n�o existe: ' . $strArquivo);

			if(is_array($arr))
				extract($arr);

			ob_start();
			require_once($strArquivo);
			return ob_get_clean();
		}
	}