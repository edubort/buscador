<?php 
extract($search_results);
?>

<?php if ($search_results['did_you_mean']){?>
	<div id="did_you_mean">
    <font color="#cc0200">
    <?php echo $sph_messages['DidYouMean'];?>:
    </font>
    <i>
      <a href="<?php print 'search.php?query='.quote_replace(addmarks($search_results['did_you_mean'])).'&search=1'?>"><?php print $search_results['did_you_mean_b']; ?></a>
    </i>
  </div>
<?php  }?>	

<?php if ($search_results['ignore_words']){?>
	<div id="common_report">
	<?php while ($thisword=each($ignore_words)) {
		$ignored .= " ".$thisword[1];
	}
  $strIgnoredWords = '<font color="#cc0200">Palavras comuns omitidas:</font> %ignored_words';
	$msg = str_replace ('%ignored_words', $ignored, $strIgnoredWords); 
	echo $msg; ?>
    </div>
<?php  }?>	


<?php if ($search_results['total_results']==0){?>
	<div id ="result_report" align="center">
		<?php 
    $strNoMatch = "<h3>O termo pesquisado (\"%query\") não encontrou resultados.</h3>";
		$msg = str_replace ('%query', $ent_query, $strNoMatch);
		echo $msg;
		?>
	</div>
<?php  }?>	


<?php if ($total_results != 0 && $from <= $to){?>
	<div id ="result_report" style="left: 50px;">
	<?php  
	$result = $sph_messages['Results'];
	$result = str_replace ('%from', $from, $result);
	$result = str_replace ('%to', $to, $result);
	$result = str_replace ('%all', $total_results, $result);
	$matchword = $sph_messages["matches"];
	if ($total_results== 1) {
		$matchword= $sph_messages["match"];
	} else {
		$matchword= $sph_messages["matches"];
	}

	$result = str_replace ('%matchword', $matchword, $result);	 
	$result = str_replace ('%secs', $time, $result);
	echo $result;
	?>
	</div>
<?php  }?>	


<?php if (isset($qry_results)) {
?>
<br>
<div id="results">

<!-- results listing -->

	<?php 
  
  foreach ($qry_results as $_key => $_row){
		$last_domain = $domain_name;
		extract($_row);
		if ($show_query_scores == 0) {
			$weight = '';
		} else {
			//$weight = "[$weight%]"; 
			$weight = "$weight%"; 
		}$weight
		?>
		<?php  if ($domain_name==$last_domain && $merge_site_results == 1 && $domain == "") {?>
		<div class="idented">
		<?php }?>
		<!--<b><?php print $num?>.</b> <?php print $weight?>-->
    
    <div style="position: relative; left: 0px">
      <?php
        if(substr($url2, 0, 2) == "//") {
          $arrExtensao = explode(".", $url2);
          $intCont = count($arrExtensao);
          
          if(file_exists("img/".$arrExtensao[$intCont-1].".png")) {
            echo "<img src='img/".$arrExtensao[$intCont-1].".png' border=0 width='30px'>";
          } else {
          	echo "<img src='img/binary.png' border=0 width='30px'>";
          }
          
          $url = str_replace("//", "/", $url);
          $arrPasta = explode("/", $url);
          
          $url = "arquivo:/" . substr($url, 0, strlen($url));
          
          #Exibe a pasta como link
          $intPasta = 1;
          $intCont = count($arrPasta);
          $strPasta = "arquivo:/";
          for($i=0; $i < $intCont-1; $i++) {
          
            $strPasta .= $arrPasta[$i] . "/";
          
          }
          
          #$strPasta .= '"';
          
          
        }
      ?>
    </div>
    <div style="position: relative; top: -30px; left: 35px;">
      <a href="<?php print $url?>" class="title">	<?php print ($title?$title:$sph_messages['Untitled'])?></a><br/>
      <div class="description"><?php print $fulltxt?></div>
      <div class="url"><?php print $url2?> - <?php print $page_size?></div>
      <?php  if ($domain_name==$last_domain && $merge_site_results == 1 && $domain == "") {?>
        [ <a href="<?php print 'search.php?query='.quote_replace(addmarks($query)).'&search=1&results='.$results_per_page.'&domain='.$domain_name?>">More results from <?php print $domain_name?></a> ]
        </div class="idented">
      <?php }?>
      <a href="<?php echo $strPasta; ?>">Abrir pasta de origem</a>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <b>Relevância: </b> <?php echo $weight; ?>
      <br/>
      <br/>

    </div>
    
	<?php  }?>
  
 </div>
 <br/>
<?php }?>

<!-- links to other result pages-->
<?php if (isset($other_pages)) {
	if ($adv==1) {
		$adv_qry = "&adv=1";
	}
	if ($type != "") {
		$type_qry = "&type=$type";
	}
?>
	<div id="other_pages">
	<?php print $sph_messages["Result page"]?>:
	<?php if ($start >1){?>
				<a href="<?php print 'search.php?query='.quote_replace(addmarks($query)).'&start='.$prev.'&search=1&results='.$results_per_page.$type_qry.$adv_qry.'&domain='.$domain?>"><?php print $sph_messages['Previous']?></a>
	<?php  }?>	

	<?php  foreach ($other_pages as $page_num) {
				if ($page_num !=$start){?>
					<a href="<?php print 'search.php?query='.quote_replace(addmarks($query)).'&start='.$page_num.'&search=1&results='.$results_per_page.$type_qry.$adv_qry.'&domain='.$domain?>"><?php print $page_num?></a>
				<?php } else {?>	
					<b><?php print $page_num?></b>
				<?php  }?>	
	<?php  }?>

	<?php if ($next <= $pages){?>	
			<a href="<?php print 'search.php?query='.quote_replace(addmarks($query)).'&start='.$next.'&search=1&results='.$results_per_page.$type_qry.$adv_qry.'&domain='.$domain?>"><?php print $sph_messages['Next']?></a>
	<?php  }?>	

	</div>

<?php }?>


<div class="divline">
</div>
