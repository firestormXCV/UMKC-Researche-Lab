<?php
	$msg=isset($_SESSION['msgErr'])?$_SESSION['msgErr']:'';

	$currentDate = '2038-01-10';
	$begin = true;
	
	//var_dump($_SESSION['profil']);
		if(isset($_SESSION['profil'])) {
			echo("
			<button type=\"button\" class=\"btn btn-primary  mt-4 mx-5 \" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\">Add Publication</button>
			
			
			<div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
			  <div class=\"modal-dialog\">
				<div class=\"modal-content\">
				  <div class=\"modal-header\">
					<h5 class=\"modal-title\" id=\"exampleModalLabel\">New Publication</h5>
					<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
				  </div>
				  <div class=\"modal-body\">
					<form action=\"controller/addArticle.php\" method=\"post\" enctype=\"multipart/form-data\">
					  <div class=\"mb-3\">
							<label for=\"recipient-name\" class=\"col-form-label\">Title</label>
					  		<input name=\"title\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
				  	  </div>
					  <div class=\"mb-3\">
						<label for=\"recipient-name\" class=\"col-form-label\">Autor</label>
						<input name=\"autor\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
					  </div>
					  <div class=\"mb-3\">
						<label for=\"message-text\" class=\"col-form-label\">Date</label>
						<input name=\"date\" required type=\"date\" class=\"form-control\" id=\"recipient-name\">
					  </div>
					  <div class=\"mb-3\">
					  	<input type=\"file\" name=\"the_file\" id=\"fileToUpload\">
					  	
					  </div>
					  <button type=\"submit\" name=\"submit\" class=\"btn btn-primary\" value=\"Start Upload\">Publish</button>
					  
					</form>
				  </div>
				  <div class=\"modal-footer\">
					<button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Cancel</button>
				  </div>
				</div>
			  </div>
			</div>");
		}

	
	echo("<div class=\"pubArray \">
			<table class=\"table mt-4 mx-auto rounded border border-primary\" style=\"width: 80%; margin-top: 100px;\">");
	foreach($_SESSION['articles'] as $article) {

		$date1 = strtotime($article['date']);
		$date2 = strtotime($currentDate);
		
		if (date("Y", $date1) < date("Y", $date2)) {

			

			$currentDate = $article['date'];

			if (!$begin) {
				echo("</tbody>");
			} else {
				$begin = false;
			}
			echo("<thead>
					<tr>
			  			<th class=\"table-primary\" scope=\"col\">". date("Y", $date1) ."</th>
						<th class=\"table-primary\" scope=\"col\"></th>
						
						
					</tr>
		  		</thead>
		  		<tbody>");
		}

		echo("<tr>
				
				<td>". $article['autor'] ." \" <a href=\"ressources/publication/" .
				 $article['fileName'] ."\" target=\"_blank\"> ". $article['title'] ." </a> \" "
				 . $article['date'] . " <td>
			</tr>");
			
	}
	
	
	echo("</tbody>
	</table>
	</div>");

?>