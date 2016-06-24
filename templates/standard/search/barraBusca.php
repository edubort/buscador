	<img src="img/logo.png" border=0>
	
	<form action="search.php" method="get">
		<input class="searchBar" type="text" name="query" id="query" size="40" value="<?php   print quote_replace($query);?>" action="include/js_suggest/suggest.php" columns="2" autocomplete="off" delay="1500">
		<input class="searchButton" type="submit" value="<?php echo $sph_messages['Search']; ?>">

		<div id="divOpBusca" class="divOpBusca">
		  <a href="#" onClick="$('#DivAdvancedSearch').show()">Opções de busca</a>
		</div>
		
		<div id="DivAdvancedSearch" class="advancedSearch">
			<b>Opções disponíveis:</b>
		  <br>
			<?php
			  
			  if($_REQUEST['type'] == "and") {
				$checkOR = "";
				$checkAND = "checked";
				$checkPH = "";
			  } elseif($_REQUEST['type'] == "phrase") {
				$checkOR = "";
				$checkAND = "";
				$checkPH = "checked";
			  } else {
				$checkOR = "checked";
				$checkAND = "";
				$checkPH = "";
			  }
			?>
			<!--<input type="radio" name="type" value="or" <?php print $_REQUEST['type']=='or'?'checked':$checkedOR?>><?php print $sph_messages['orSearch']?></td></tr>-->
				<input type="radio" name="type" value="or" <?php print $type=='or'?'checked':$checkedOR?>>Busca aberta (Termo 1 "OU" Termo 2 "OU" Termo N)<BR>
				<!--<input type="radio" name="type" value="and" <?php print $type=='and'?'checked':$checkedAND?>><?php print $sph_messages['andSearch']?></td>-->
				<input type="radio" name="type" value="and" <?php print $_REQUEST['type']=='and'?'checked':$checkedAND?>>Busca exata (Termo 1 "E" Termo 2 "E" Termo N)<BR>
				<!--<input type="radio" name="type" value="phrase" <?php print $_REQUEST['type']=='phrase'?'checked':$checkedPH?>><?php print $sph_messages['phraseSearch']?></td>-->
				<input type="radio" name="type" value="phrase" <?php print $_REQUEST['type']=='phrase'?'checked':$checkedPH?>>Busca por frase<BR>
				<br>
			<b>Resultados por página</b>
					<select name='results'>
					  <option <?php  if ($results_per_page==10) echo "selected";?>>10</option>
					  <option <?php  if ($results_per_page==20) echo "selected";?>>20</option>
					  <option <?php  if ($results_per_page==50) echo "selected";?>>50</option>
					  <option <?php  if ($results_per_page==100) echo "selected";?>>100</option>
					</select>
					<?php print $sph_messages['resultsPerPage']?>   
			<BR>
			<BR>
			<center>
			  <button id="btnFechar" class="searchButtonREd" onClick="$('#DivAdvancedSearch').hide()">OK</button>
			</center>
		</div>
		
		<?php if ($catid<>0){ ?>
			<center><b><?php print $sph_messages['Search']?></b>: <input type="radio" name="category" value="<?php print $catid?>"><?php print $sph_messages['Only in category']?> "<?php print $tpl_['category'][0]['category']?>'" <input type="radio" name="category" value="-1" checked><?php print $sph_messages['All sites']?></center>
		<?php }?>
		
		<input type="hidden" name="search" value="1">
	</form>