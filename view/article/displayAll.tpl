	<?php
		$msg=isset($_SESSION['msgErr'])?$_SESSION['msgErr']:'';

		$currentDate = '2038-01-10';
		$begin = true;
		
		//var_dump($_SESSION['profil']);
			if(isset($_SESSION['profil'])) {
				echo("			
				
				<div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
				<div class=\"modal-dialog  modal-xl\">
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
							<label for=\"recipient-name\" class=\"col-form-label\">Bibtex</label>
							<textarea name=\"bibtex\" class=\"form-control\" id=\"recipient-name\"></textarea>
						</div>
						<select name=\"type\" id=\"recipient-name\" class=\"form-select\" aria-label=\"Default select example\">
						  	<option selected>Open this select menu</option>
						  	<option value=\"1\">book</option>
						  	<option value=\"2\">book chapter</option>
						  	<option value=\"3\">news paper</option>
							<option value=\"4\">conference</option>
							<option value=\"5\">archive</option>
							<option value=\"6\">report</option>
						</select>
						<div class=\"mb-3\">
							<label for=\"recipient-name\" class=\"col-form-label\">Place</label>
							<input name=\"place\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>
						<div class=\"mb-3\">
							<label for=\"message-text\" class=\"col-form-label\">Date</label>
							<input name=\"date\" required type=\"date\" class=\"form-control\" id=\"recipient-name\">
						</div>
						<div class=\"mb-3\">
							<input type=\"file\" name=\"the_file\" id=\"fileToUpload\">
							
						</div>
						<div class=\"d-flex justify-content-between mt-2\">
							<button type=\"submit\" name=\"submit\" class=\"btn btn-primary\" value=\"Start Upload\">Publish</button>
							<button type=\"button\" class=\"btn btn-secondary flex-directi\" data-bs-dismiss=\"modal\">Cancel</button>
						</div>
						</form>
					</div>
					
					</div>
				</div>
				</div>
			
			
			
				<div class=\"modal fade\" id=\"modifModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
				<div class=\"modal-dialog  modal-xl\">
					<div class=\"modal-content\">
						<div class=\"modal-header\">
							<h5 class=\"modal-title\" id=\"modifModalLabel\">Modify Publication</h5>
							<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
						</div>
					<div class=\"modal-body\">
						<form action=\"controller/modifyArticle.php\" method=\"post\" enctype=\"multipart/form-data\">
							<input type=\"hidden\" id=\"recipient-id-modify\" name=\"id\" value=\"\">
							<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Title</label>
								<input name=\"title\" value=\"\" required type=\"text\" class=\"form-control\" id=\"recipient-title-modify\">
							</div>
							<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Autor</label>
								<input name=\"autor\" required type=\"text\" class=\"form-control\" id=\"recipient-autor-modify\">
							</div>
							<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Bibtex</label>
								<textarea name=\"bibtex\" class=\"form-control\" id=\"recipient-bibtex-modify\"></textarea>

							</div>
							<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Type</label>
								<select class=\"form-select\" id=\"recipient-type-modify\" name=\"type\" aria-label=\"Type of publication\">
									<option selected>-- Select Type --</option>
									<option value=\"book\">Book</option>
									<option value=\"book chapter\">Book chapter</option>
									<option value=\"conference\">Conference</option>
									<option value=\"report\">Report</option>
									<option value=\"archive\">Archive</option>
									<option value=\"new paper\">News paper</option>
								</select>
							</div>
							<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Place</label>
								<input name=\"place\" required type=\"text\" class=\"form-control\" id=\"recipient-place-modify\">
							</div>
							<div class=\"mb-3\">
								<label for=\"message-text\" class=\"col-form-label\">Date</label>
								<input name=\"date\" required type=\"date\" class=\"form-control\" id=\"recipient-date-modify\">
							</div>
							<div class=\"mb-3\">
								<input type=\"file\" name=\"the_file\" id=\"fileToUpload\">
								
							</div>
							<div class=\"d-flex justify-content-between mt-2\">
								<button type=\"submit\" name=\"submit\" class=\"btn btn-primary\" value=\"Start Upload\">Modify</button>
								<button type=\"button\" class=\"btn btn-secondary flex-directi\" data-bs-dismiss=\"modal\">Cancel</button>
							</div>
						</form>
					</div>
					
					</div>
				</div>
				</div>");
			}

		
		echo("<div class=\"pubArray d-flex flex-column justify-content-center mx-auto\"  >");
		if(isset($_SESSION['profil'])) {
			echo("<button type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" >Add Publication</button>");
		}
		
		echo("<h2 class=\"my-4 ms-5 border-bottom border-dark w-25 pb-3 \">Publication</h2>");

		echo("<div class=\"mx-5\">
			<table class=\"table mt-4 mx-auto rounded border border-white\" style=\" width: 99%;\">");
		
		foreach($_SESSION['articles'] as $article) {

			$date1 = strtotime($article['date']);
			$date2 = strtotime($currentDate);
			
			if (date("Y", $date1) < date("Y", $date2)) {
				echo("</ul>");
				$currentDate = $article['date'];
				echo("<h5 class=\"homeTitle\" >". date("Y", $date1) ."</h5>");
				echo("<ul>");
			}

			echo("
			
				<li>");
				if (!isset($_SESSION['profil'])) {
					echo("<div class=\"py-1\">");
				}
					echo(" ". $article['autor'] ." \" <a href=\"ressources/publication/" .
					$article['fileName'] ."\" target=\"_blank\"> ". $article['title'] ." </a> \" "
					. $article['date'] . " ". $article['type'] ." " . $article['place'] ."
					<a class=\"\" data-bs-toggle=\"collapse\" href=\"#bibtex". $article['id'] ."\" role=\"button\" aria-expanded=\"false\" aria-controls=\"collapseExample\">
					[bibtex]
					</a>
					<div class=\"collapse\" id=\"bibtex". $article['id'] ."\">
						<div class=\"card card-body\">
							". nl2br($article['bibtex']) ."
						</div>
					</div>
					<a href=\"ressources/publication/" .
					$article['fileName'] ."\" class='bi bi-file-pdf' style='color: red' target=\"_blank\"></a>");

				if (isset($_SESSION['profil'])) {
					echo("</div>");
				}
				
				if (isset($_SESSION['profil'])) {
					echo("<button id=\"tootoo\" onclick=\"modify(".  $article['id'] ."	);\" type=\"button\" class=\"btn\" data-bs-toggle=\"modal\" data-bs-target=\"#modifModal\" ><i class=\"bi bi-pencil\"></i></button>
						  <button id=\"delete\" onclick=\" deleteArticle(".  $article['id'] .", 'publication');\" type=\"button\" class=\"btn\" ><i class=\"bi bi-trash\"></i></button>");
				} 
				echo("</li>
			");
				
		}
	?>

</tbody>
</table>
</div>
</div>