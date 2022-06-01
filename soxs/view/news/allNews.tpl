	<?php
		$msg=isset($_SESSION['msgErr'])?$_SESSION['msgErr']:'';

		$currentDate = '2038-01-10';
		$begin = true;
		
		//var_dump($_SESSION['profil']);
			if(isset($_SESSION['profil'])) {
				echo("			
				
				<div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
				<div class=\"modal-dialog modal-xl\">
					<div class=\"modal-content\">
					<div class=\"modal-header\">
						<h5 class=\"modal-title\" id=\"exampleModalLabel\">New Publication</h5>
						<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
					</div>
					<div class=\"modal-body\">
						<form action=\"controller/news.php\" method=\"post\" enctype=\"multipart/form-data\">
						<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Title</label>
								<input name=\"title\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>
						
						<div class=\"mb-3\">
							<label for=\"recipient-name\" class=\"col-form-label\">Content</label>
                            <textarea name=\"content\" class=\"form-control contentArea\" id=\"message-text\"></textarea>
						</div>

						<button id=\"newsAdd\" type=\"button\" class=\"btn btn-info btn-sm\" >Add Link</button>

						<div class=\"mb-3\">
							<label for=\"message-text\" class=\"col-form-label\">Date</label>
							<input name=\"date\" required type=\"date\" class=\"form-control\" id=\"recipient-name\">
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
				<div class=\"modal-dialog modal-xl\">
					<div class=\"modal-content\">
					<div class=\"modal-header\">
						<h5 class=\"modal-title\" id=\"exampleModalLabel\">Modify Publication</h5>
						<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
					</div>
					<div class=\"modal-body\">
						<form action=\"controller/modifyNews.php\" method=\"post\" enctype=\"multipart/form-data\">
							<input type=\"hidden\" id=\"recipient-id-modify\" name=\"id\" value=\"\">
							<div class=\"mb-3\">
									<label for=\"recipient-name\" class=\"col-form-label\">Title</label>
									<input name=\"title\" required type=\"text\" class=\"form-control\" id=\"recipient-title-modify\">
							</div>
							
							<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Content</label>
								<textarea name=\"content\" class=\"form-control contentArea\" id=\"recipient-content-modify\"></textarea>
							</div>

							<button id=\"newsAddModify\" type=\"button\" class=\"btn btn-info btn-sm\" >Add Link</button>

							<div class=\"mb-3\">
								<label for=\"message-text\" class=\"col-form-label\">Date</label>
								<input name=\"date\" required type=\"date\" class=\"form-control\" id=\"recipient-date-modify\">
							</div>
							
							<div class=\"d-flex justify-content-between mt-2\">
								<button type=\"submit\" name=\"submit\" class=\"btn btn-primary\" value=\"Start Upload\">Publish</button>
								<button type=\"button\" class=\"btn btn-secondary flex-directi\" data-bs-dismiss=\"modal\">Cancel</button>
							</div>
						</form>
					</div>
					
					</div>
				</div>
				</div>");
			}

		
		echo("<div class=\"pubArray d-flex flex-column justify-content-center mx-auto\" >");

		if(isset($_SESSION['profil'])) {
			echo("<button type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" >Add Publication</button>");
		}

		echo("<h2 class=\"my-4 ms-5 border-bottom border-dark w-25 pb-3 \">News</h2>");

		echo("<div class=\"mx-5\">
		<table class=\"table mt-4 mx-auto rounded border border-white\" style=\" width: 99%;\">");
		
		foreach($_SESSION['news'] as $news) {

			$date1 = strtotime($news['date']);
			$date2 = strtotime($currentDate);
			
			if (date("Y", $date1) < date("Y", $date2)) {
				echo("</ul>");
				$currentDate = $news['date'];
				echo("<h5 class=\"homeTitle\" >". date("Y", $date1) ."</h5>");
				echo("<ul>");
			}

			echo("
						
				<li class=\"news\">". $news['date'] ." <bold class=\"fw-bold \">". $news['title'] .": </bold> </a> " .
				$news['content']);
				if (isset($_SESSION['profil'])) {
					echo("<button id=\"modifyNews\" onclick=\"modifyNews(".  $news['id'] .");\" type=\"button\" class=\"btn mx-auto\" data-bs-toggle=\"modal\" data-bs-target=\"#modifModal\" ><i class=\"bi bi-pencil\"></i></button>
						<button id=\"delete\" onclick=\" deleteArticle(".  $news['id'] .", 'news');\" type=\"button\" class=\"btn\" ><i class=\"bi bi-trash\"></i></button>");
				}
				echo("</li>");
				
		}
		echo("</ul></table></div>");
	?>