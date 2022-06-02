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
						<form action=\"controller/team.php\" method=\"post\" enctype=\"multipart/form-data\">
						
						<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">First Name *</label>
								<input name=\"firstName\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>
						
                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Last Name *</label>
								<input name=\"lastName\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>

                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">EMail</label>
								<input name=\"eMail\"  type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>

                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Homepage</label>
								<input name=\"homepage\" type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>

                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Diploma *</label>
								<input name=\"diploma\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
						</div>

						<div class=\"mb-3\">
							<label for=\"recipient-name\" class=\"col-form-label\">Research Interest *</label>
                            <textarea name=\"researchInterest\" class=\"form-control\" id=\"message-text\"></textarea>
						</div>

						<div class=\"mb-3\">
							<label for=\"message-text\" class=\"col-form-label\"> Start Date *</label>
							<input name=\"startDate\" required type=\"date\" class=\"form-control\" id=\"recipient-name\">
						</div>

                        <div class=\"mb-3\">
                            <label for=\"message-text\" class=\"col-form-label\"> End Date</label>
                            <input name=\"endDate\" type=\"date\" class=\"form-control\" id=\"recipient-name\">
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
				</div>
				
				<div class=\"modal fade\" id=\"modifyModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
				<div class=\"modal-dialog modal-xl\">
					<div class=\"modal-content\">
					<div class=\"modal-header\">
						<h5 class=\"modal-title\" id=\"exampleModalLabel\">Modify Team Member</h5>
						<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
					</div>
					<div class=\"modal-body\">
						<form action=\"controller/modifyTeam.php\" method=\"post\" enctype=\"multipart/form-data\">
						<input type=\"hidden\" id=\"recipient-id-modify\" name=\"id\" value=\"\">
						<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">First Name *</label>
								<input name=\"firstName\" required type=\"text\" class=\"form-control\" id=\"recipient-firstName-modify\">
						</div>
						
                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Last Name *</label>
								<input name=\"lastName\" required type=\"text\" class=\"form-control\" id=\"recipient-lastName-modify\">
						</div>

                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">EMail</label>
								<input name=\"eMail\"  type=\"text\" class=\"form-control\" id=\"recipient-email-modify\">
						</div>

                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Homepage</label>
								<input name=\"homepage\" type=\"text\" class=\"form-control\" id=\"recipient-homepage-modify\">
						</div>

                        <div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Diploma *</label>
								<input name=\"diploma\" required type=\"text\" class=\"form-control\" id=\"recipient-diploma-modify\">
						</div>

						<div class=\"mb-3\">
							<label for=\"recipient-name\" class=\"col-form-label\">Research Interest *</label>
                            <textarea name=\"researchInterest\" class=\"form-control\" id=\"recipient-researchInterest-modify\"></textarea>
						</div>

						<div class=\"mb-3\">
							<label for=\"message-text\" class=\"col-form-label\"> Start Date *</label>
							<input name=\"startDate\" required type=\"date\" class=\"form-control\" id=\"recipient-startDate-modify\">
						</div>

                        <div class=\"mb-3\">
                            <label for=\"message-text\" class=\"col-form-label\"> End Date</label>
                            <input name=\"endDate\" type=\"date\" class=\"form-control\" id=\"recipient-endDate-modify\">
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

		
		echo("<div class=\"pubArray d-flex flex-column justify-content-center mx-auto\" >");
		
		if(isset($_SESSION['profil'])) {
			echo("<button type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" >Add Team Member</button>");
		}
		echo("<h2 class=\"my-4 ms-5 border-bottom border-dark w-25 pb-3 \">Team</h2>");





		echo("<div class=\"mx-5\">
				<center>
				<div class=\"container\">
				<div class=\"row\">");
		
		
		foreach($_SESSION['team'] as $team) {
			if ($team['pictureName'] == "NULL") {
				$team['pictureName'] = "nobody.jpg";
			}
			echo("
			
			<div class=\"col teams\">
				<img class=\"m-3\" src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"100\" height=\"100\"/>
				<p>   <bold class=\"fw-bold\">   ". $team['name'] ." ". $team['famillyName'] ."</bold></p>
				<p>   ".  $team['diploma'] ."</p>
				<p>   ".  $team['startDate'] ."</p>
				<p>   ".  $team['researchInterest'] ."</p>");
				if ($team['email'] != 'NULL') {
					echo("<p>   ".  $team['email'] ."</p>");
				}
				if ($team['homepage'] != 'NULL') {
										
					echo("<p>   
										
					<a href=\"" . $team['homepage'] ."\" target=\"_blank\"> ".  $team['homepage'] ." </a>  </p>");
				}
				if(isset($_SESSION['profil'])) {
					echo("<button id=\"tootoo\" onclick=\"modifyTeam(".  $team['id'] ."	);\" type=\"button\" class=\"btn\" data-bs-toggle=\"modal\" data-bs-target=\"#modifyModal\" ><i class=\"bi bi-pencil\"></i></button>");
				}
			echo("</div>
			");
		}


		echo("</center>
				</div>
				</div>
		<table class=\"table mt-4 mx-auto rounded border border-white\" style=\" width: 99%;\">");

		if (!$begin) {
			echo("</tbody>");
		} else {
			$begin = false;
		}
		echo("<thead class=\"border border-white\">
				<tr>
					<th class=\" homeTitle \" scope=\"col\">Current Member</th>
					<th class=\"homeTitle\" scope=\"col\"></th>
					
					
				</tr>
			</thead>
			<tbody>");
		$former = false;
		foreach($_SESSION['team'] as $team) {
			if ($team['pictureName'] == "NULL") {
				$team['pictureName'] = "nobody.jpg";
			}
			if ($team['endDate'] == "0000-00-00") {
				echo("	
					<tr>				
						<td>
							<ul>
								<div class=\" d-flex flex-rom space\">
											
									<div class=\"p-2 bd-highlight\">
										<img src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"200\" height=\"200\"/>
									</div>

									<div class=\" d-flex flex-column \">
										<p>   <bold class=\"fw-bold space\">   ". $team['name'] ." ". $team['famillyName'] ."</bold></p>
										<p>   <bold class=\"fw-bold space\">Diploma: </bold>".  $team['diploma'] ."</p>
										<p>   <bold class=\"fw-bold space\">Date: </bold>".  $team['startDate'] ."</p>
										<p>   <bold class=\"fw-bold space\">Research Interest: </bold>".  $team['researchInterest'] ."</p>");
										if ($team['email'] != 'NULL') {
											echo("<p>   <bold class=\"fw-bold space\">EMail: </bold>".  $team['email'] ."</p>");
										}
										if ($team['homepage'] != 'NULL') {
											
											echo("<p>   <bold class=\"fw-bold space\">Homepage: </bold> 
											<a href=\"" . $team['homepage'] ."\" target=\"_blank\"> ".  $team['homepage'] ." </a>  </p>");
										}
										if(isset($_SESSION['profil'])) {
											echo("<button id=\"tootoo\" onclick=\"modifyTeam(".  $team['id'] ."	);\" type=\"button\" class=\"btn\" data-bs-toggle=\"modal\" data-bs-target=\"#modifyModal\" ><i class=\"bi bi-pencil\"></i></button>");
										}
										
									echo("
									</div>
			
								</div>
							</ul>
						<td>
					</tr>");
			} else {
				$former = true;
			}
		}

		if ($former) {
			echo("<thead class=\"border border-white\">
					<tr>
						<th class=\"homeTitle\" scope=\"col\">Former Member</th>
						<th class=\"homeTitle\" scope=\"col\"></th>
						
						
					</tr>
				</thead>");
			foreach($_SESSION['team'] as $team) {
				if ($team['pictureName'] == "NULL") {
					$team['pictureName'] = "nobody.jpg";
				}

				

				if ($team['endDate'] != "0000-00-00") {
					echo("	
						<tr>				
							<td>
								<ul>
									<div class=\" d-flex flex-rom space\">
										
										<div class=\"p-2 bd-highlight\">
										<img src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"200\" height=\"200\"/>
										</div>

										<div class=\" d-flex flex-column \">
											<p>   <bold class=\"fw-bold space\">   ". $team['name'] ." ". $team['famillyName'] ."</bold></p>
											<p>   <bold class=\"fw-bold space\">Diploma: </bold>".  $team['diploma'] ."</p>
											<p>   <bold class=\"fw-bold space\">Date: </bold>".  $team['startDate'] ."   to   ". $team['endDate'] ."</p>
											<p>   <bold class=\"fw-bold space\">Research Interest: </bold>".  $team['researchInterest'] ."</p>");
											if ($team['email'] != 'NULL') {
												echo("<p>   <bold class=\"fw-bold space\">EMail: </bold>".  $team['email'] ."</p>");
											}
											if ($team['homepage'] != 'NULL') {
												echo("<p>   <bold class=\"fw-bold space\">Homepage: </bold> 
											<a href=\"" . $team['homepage'] ."\" target=\"_blank\"> ".  $team['homepage'] ." </a>  </p>");
											}
											if(isset($_SESSION['profil'])) {
												echo("<button id=\"tootoo\" onclick=\"modifyTeam(".  $team['id'] ."	);\" type=\"button\" class=\"btn\" data-bs-toggle=\"modal\" data-bs-target=\"#modifyModal\" ><i class=\"bi bi-pencil\"></i></button>");
											}
										echo("
										</div>
					
									</div>
								</ul>
							<td>
						</tr>");
				} 
			}
		}
		
		
		echo("</tbody>
		</table>
		</div>
		</div>");
		//<img src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"200\" height=\"200\"
		//							<li>". $team['name'] ." \" ". $team['famillyName'] ." </a> " .
		//							$team['diploma'] ."  " . $team['endDate']  . "</li>
	?>
