<?php
/*
 * SOFIO - Search Office For Intranet Organization  
 * @Site:   www.sofio.com.br
 * @File:   setup.php
 * @Title:  Página de configuração
 * @Author: Eduardo Henrique Bortolotti
 * @email:  edubort@live.com
 */

 function getmicrotime(){
    list($usec, $sec) = explode(" ",microtime());
    return ((float)$usec + (float)$sec);
}

function poweredby(){
	global $sph_messages;
}

function saveToLog ($query, $elapsed, $results) {
        global $mysql_table_prefix;
    if ($results =="") {
        $results = 0;
    }
    $query =  "insert into ".$mysql_table_prefix."query_log (query, time, elapsed, results) values ('$query', now(), '$elapsed', '$results')";
	mysql_query($query);
	
	echo mysql_error();
}

$include_dir = "./include"; 
include ("$include_dir/commonfuncs.php");

//extract(getHttpVars());

if (isset($_GET['query']))
	$query = $_GET['query'];
if (isset($_GET['search']))
	$search = $_GET['search'];
if (isset($_GET['domain'])) 
	$domain = $_GET['domain'];
if (isset($_GET['type'])) 
	$type = $_GET['type'];
if (isset($_GET['catid'])) 
	$catid = $_GET['catid'];
if (isset($_GET['category'])) 
	$category = $_GET['category'];
if (isset($_GET['results'])) 
	$results = $_GET['results'];
if (isset($_GET['start'])) 
	$start = $_GET['start'];
if (isset($_GET['adv'])) 
	$adv = $_GET['adv'];

	
$include_dir = "./include";
$template_dir = "./templates"; 
$settings_dir = "./settings"; 
$language_dir = "./languages";


require_once("$settings_dir/conf.php");
require_once("$settings_dir/database.php");
require_once("$language_dir/en-language.php");
require_once("$include_dir/searchfuncs.php");
require_once("$include_dir/categoryfuncs.php");


require "./Utils/TemplateUtils.php";
require "./Utils/FileUtils.php";

use Utils\TemplateUtils;
use Utils\FileUtils;

$objFileUtils = new FileUtils();
$objTemplateUtils = new TemplateUtils();

//include "$template_dir/$template/header.html";
include "$language_dir/$language-language.php";





if ($type != "or" && $type != "and" && $type != "phrase") { 
	#$type = "and";
	$type = "or"; # ALTERADO PARA AUMENTAR A AMPLITUDE DA BUSCA.
}

if (preg_match("/[^a-z0-9-.]+/", $domain)) {
	$domain="";
}


if ($results != "") {
	$results_per_page = $results;
}

if (get_magic_quotes_gpc()==1) {
	$query = stripslashes($query);
} 

if (!is_numeric($catid)) {
	$catid = "";
}

if (!is_numeric($category)) {
	$category = "";
} 

if ($catid && is_numeric($catid)){
	$tpl_['category'] = sql_fetch_all('SELECT category FROM '.$mysql_table_prefix.'categories WHERE category_id='.(int)$_REQUEST['catid']);
}

$count_level0 = sql_fetch_all('SELECT count(*) FROM '.$mysql_table_prefix.'categories WHERE parent_num=0');
$has_categories = 0;

if ($count_level0) {
	$has_categories = $count_level0[0][0];
}

//require_once("$template_dir/$template/search_form.html");

	switch ($search)
	{
		case 1:
			if (isset($results) == false){
				$results = "";
			}
			
			$search_results = get_search_results($query, $start, $category, $type, $results, $domain);
			
			$objConteudoBusca = $objFileUtils->incluir('templates\standard\search\search_results.php',
			[
				'search_results' => $search_results,
				'sph_messages' => $sph_messages
			]);
			//require("$template_dir/$template/search_results.html");
		break;
		
		default:

			if ($show_categories)
			{

				if ($_REQUEST['catid']  && is_numeric($catid)){
					$cat_info = get_category_info($catid);
				}else{
					$cat_info = get_categories_view();
				}
				
				$objConteudoBusca = $objFileUtils->incluir('templates/standard/search/categories.php',
				[
					'catid' => $catid,
					'cat_info' => $cat_info,
					'sph_messages' => $sph_messages,
					'cat_info' => $cat_info,
					'cat_info' => $cat_info,
					'cat_info' => $cat_info,
				]);

				//require("$template_dir/$template/categories.html");
			}
		break;
	}

	$objTemplateUtils->loadView('/standard/search/index.php', 
	[
		'query' => $query,
		'sph_messages' => $sph_messages,
		'type' => $type,
		'catid' => $catid,
		'tpl_' => $tpl_,
		'search' => $search,
		'has_categories' => $has_categories,
		'show_categories' => $show_categories,
		'objConteudoBusca' => $objConteudoBusca
	]);

//include "$template_dir/$template/footer.html";
?>
