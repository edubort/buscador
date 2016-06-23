<?php
  $database="searchin";
  $mysql_user = "admin";
  $mysql_password = "admin";
  #$mysql_host = "192.168.56.1";
  $mysql_host = "192.168.33.117";
  #$mysql_host = "127.0.0.1";
  $mysql_table_prefix = "";

  $con = mysql_pconnect($mysql_host, $mysql_user, $mysql_password);
  if (!$con)
    die ("<b>Houve um problema ao tentar conectar-se com o banco de dados. Verifique sua conexão com o banco e tente novamente.</b>");
    $success = mysql_select_db ($database) or die(mysql_error());
    mysql_set_charset('latin1', $con);
  if (!$success){
    print "<b>Schema não selecionado ou não existente.";
    die();
  }
?>

