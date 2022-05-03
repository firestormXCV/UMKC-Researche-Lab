	<?php
		$msg=isset($_SESSION['msgErr'])?$_SESSION['msgErr']:'';

		$currentDate = '2038-01-10';
		$begin = true;
		
		//var_dump($_SESSION['profil']);
			if(isset($_SESSION['profil'])) {
				echo("			
				
				<div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
				<div class=\"modal-dialog\">
					<div class=\"modal-content\">
					<div class=\"modal-header\">
						<h5 class=\"modal-title\" id=\"exampleModalLabel\">New Publication</h5>
						<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
					</div>
					<div class=\"modal-body\">
						<form action=\"controller/team.php\" method=\"post\" enctype=\"multipart/form-data\">

						<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">First Name</label>
								<input name=\"firstName\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>
						
                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Last Name</label>
								<input name=\"lastName\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>

                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">EMail</label>
								<input name=\"eMail\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>

                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Homepage</label>
								<input name=\"homepage\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>

                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Diploma</label>
								<input name=\"diploma\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>

						<div class=\"mb-3\">
							<label for=\"recipient-name\" class=\"col-form-label\">Research Interest</label>
                            <textarea name=\"researchInterest\" class=\"form-control\" id=\"message-text\"></textarea>
						</div>

						<div class=\"mb-3\">
							<label for=\"message-text\" class=\"col-form-label\"> Start Date</label>
							<input name=\"startDate\" required type=\"date\" class=\"form-control\" id=\"recipient-name\">
						</div>

                        <div class=\"mb-3\">
                            <label for=\"message-text\" class=\"col-form-label\"> End Date</label>
                            <input name=\"endDate\" required type=\"date\" class=\"form-control\" id=\"recipient-name\">
                        </div>
						
                        <div class=\"mb-3\">
							<input type=\"file\" name=\"the_file\" id=\"fileToUpload\">
							
						</div>

						<div class=\"d-flex justify-content-between mt-2\">
							<button type=\"submit\" name=\"submit\" class=\"btn btn-primary\" value=\"Start Upload\">Add</button>
							<button type=\"button\" class=\"btn btn-secondary flex-directi\" data-bs-dismiss=\"modal\">Cancel</button>
						</div>
						</form>
					</div>
					
					</div>
				</div>
				</div>");
			}

		
		echo("<div class=\"pubArray d-flex flex-column justify-content-center mx-auto\"  style=\" width: 75%; margin-top: 100px,\">");

		if(isset($_SESSION['profil'])) {
			echo("<button type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" >Add Team Member</button>");
		}	
		echo("<table class=\"table mt-4 mx-auto rounded border border-white\" style=\" width: 99%;\">");
		
		foreach($_SESSION['news'] as $news) {

			$date1 = strtotime($news['date']);
			$date2 = strtotime($currentDate);
			
			if (date("Y", $date1) < date("Y", $date2)) {

				

				$currentDate = $news['date'];

				if (!$begin) {
					echo("</tbody>");
				} else {
					$begin = false;
				}
				echo("<thead class=\"border border-white\">
						<tr>
							<th class=\"table-primary \" scope=\"col\">". date("Y", $date1) ."</th>
							<th class=\"table-primary\" scope=\"col\"></th>
							
							
						</tr>
					</thead>
					<tbody>");
			}
			
			echo("
				
				<tr>
					
					<td>
						<ul>
							<li>". $news['date'] ." \" ". $news['title'] ." </a><br> \" " .
							$news['content'] ."</li>
						</ul>
					<td>
				</tr>");
				
		}
		
		
		echo("</tbody>
		</table>
		</div>");

	?>