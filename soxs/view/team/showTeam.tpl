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

						<div class=\"form-check form-check-inline\">
								<input required class=\"form-check-input\" type=\"radio\" name=\"grade\" id=\"inlineRadio1\" value=\"PhD\">
								<label class=\"form-check-label\" for=\"inlineRadio1\">PhD</label>
						</div>
						<div class=\"form-check form-check-inline\">
								<input required class=\"form-check-input\" type=\"radio\" name=\"grade\" id=\"inlineRadio2\" value=\"MSC\">
								<label class=\"form-check-label\" for=\"inlineRadio2\">MSC</label>
						</div>
						<div class=\"form-check form-check-inline\">
								<input required class=\"form-check-input\" type=\"radio\" name=\"grade\" id=\"inlineRadio3\" value=\"BSC\">
								<label class=\"form-check-label\" for=\"inlineRadio3\">BSC</label>
						</div>
						<div class=\"form-check form-check-inline\">
								<input required class=\"form-check-input\" type=\"radio\" name=\"grade\" id=\"inlineRadio4\" value=\"Other\">
								<label class=\"form-check-label\" for=\"inlineRadio4\">Other</label>
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

						<div class=\"form-check form-check-inline\">
								<input class=\"form-check-input\" type=\"radio\" name=\"grade\" id=\"inlineRadio1\" value=\"PhD\">
								<label class=\"form-check-label\" for=\"inlineRadio1\">PhD</label>
						</div>
						<div class=\"form-check form-check-inline\">
								<input class=\"form-check-input\" type=\"radio\" name=\"grade\" id=\"inlineRadio2\" value=\"MSC\">
								<label class=\"form-check-label\" for=\"inlineRadio2\">MSC</label>
						</div>
						<div class=\"form-check form-check-inline\">
								<input class=\"form-check-input\" type=\"radio\" name=\"grade\" id=\"inlineRadio3\" value=\"BSC\">
								<label class=\"form-check-label\" for=\"inlineRadio3\">BSC</label>
						</div>
						<div class=\"form-check form-check-inline\">
								<input class=\"form-check-input\" type=\"radio\" name=\"grade\" id=\"inlineRadio4\" value=\"Other\">
								<label class=\"form-check-label\" for=\"inlineRadio4\">Other</label>
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

		
		echo("<div class=\"pubArray d-flex flex-column mx-auto ps-1\" >");
		
		
		if(isset($_SESSION['profil'])) {
			echo("<button type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" >Add Team Member</button>");
		}
		
		echo("<div class=\"mx-5\">");
		echo("<h5 styles=\"font-size = 14 !important;\" class=\"mt-1\">Current Members</h5>");
		
		$former = false;
		// Display professor Farid card
		foreach($_SESSION['team'] as $team) {
			if ($team['name'] == 'Farid' && $team['famillyName'] == 'Naït-Abdesselam') {
				echo("
			
				<div class=\"teams\">
					<img class=\"m-3 rounded-circle\" src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"100\" height=\"100\"/>
					<p>   <bold class=\"fw-bold\">   ". $team['name'] ." ". $team['famillyName'] ."</bold></p>
					<p>	  ".  $team['grade'] ."</p> 
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
		}
		
		

		$count = 0;
		// Display current PhD team Member
		foreach($_SESSION['team'] as $team) {
			
			if ($team['pictureName'] == "NULL") {
				$team['pictureName'] = "nobody.jpg";
			}
			if ($team['endDate'] == "0000-00-00" && $team['name'] != 'Farid' && $team['famillyName'] != 'Naït-Abdesselam' && $team['grade'] == 'PhD') {
				if ($count == 0) {
					echo("<div class=\"d-flex grid-container\">");
				} else if ($count == 7){
					echo("</div>
						<div class=\"d-flex grid-container\">");
						$count = 0;
				}
				$count++;
				echo("
			
				<div class=\"grid-item\">
					<img class=\"m-3 rounded-circle\" src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"100\" height=\"100\"/>
					<p>   <bold class=\"fw-bold\">   ". $team['name'] ." ". $team['famillyName'] ."</bold></p>
					<p>	  ".  $team['grade'] ."</p> 
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
				echo("</div>");
			} else {
				$former = true;
			}
			
		}
		echo("</div>");

		$count = 0;
		// Display current MSC team Member
		foreach($_SESSION['team'] as $team) {
			
			if ($team['pictureName'] == "NULL") {
				$team['pictureName'] = "nobody.jpg";
			}
			if ($team['endDate'] == "0000-00-00" && $team['name'] != 'Farid' && $team['famillyName'] != 'Naït-Abdesselam' && $team['grade'] == 'MSC') {
				if ($count == 0) {
					echo("<div class=\"d-flex grid-container\">");
				} else if ($count == 7){
					echo("</div>
						<div class=\"d-flex grid-container\">");
						$count = 0;
				}
				$count++;
				echo("
			
				<div class=\"grid-item\">
					<img class=\"m-3 rounded-circle\" src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"100\" height=\"100\"/>
					<p>   <bold class=\"fw-bold\">   ". $team['name'] ." ". $team['famillyName'] ."</bold></p>
					<p>	  ".  $team['grade'] ."</p> 
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
				echo("</div>");
			} else {
				$former = true;
			}
			
		}
		echo("</div>");
		
		$count = 0;
		// Display current BSC team Member
		foreach($_SESSION['team'] as $team) {
			
			if ($team['pictureName'] == "NULL") {
				$team['pictureName'] = "nobody.jpg";
			}
			if ($team['endDate'] == "0000-00-00" && $team['name'] != 'Farid' && $team['famillyName'] != 'Naït-Abdesselam' && $team['grade'] == 'BSC') {
				if ($count == 0) {
					echo("<div class=\"d-flex grid-container\">");
				} else if ($count == 7){
					echo("</div>
						<div class=\"d-flex grid-container\">");
						$count = 0;
				}
				$count++;
				echo("
			
				<div class=\"grid-item\">
					<img class=\"m-3 rounded-circle\" src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"100\" height=\"100\"/>
					<p>   <bold class=\"fw-bold\">   ". $team['name'] ." ". $team['famillyName'] ."</bold></p>
					<p>	  ".  $team['grade'] ."</p> 
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
				echo("</div>");
			} else {
				$former = true;
			}
			
		}
		echo("</div>");
		// Display Former team Member
		if ($former) {
			echo("<h5 class=\"mt-2\">Alumni (Phd)</h5>");

			$count = 0;
			// Display Former PhD team Member
			
			foreach($_SESSION['team'] as $team) {
				if ($team['pictureName'] == "NULL") {
					$team['pictureName'] = "nobody.jpg";
				}
				if ($team['endDate'] != "0000-00-00" && $team['name'] != 'Farid' && $team['famillyName'] != 'Naït-Abdesselam' && $team['grade'] == 'PhD') {
					if ($count == 0) {
						echo("<div class=\"d-flex grid-container\">");
					} else if ($count == 7){
						echo("</div>
							<div class=\"d-flex grid-container\">");
							$count = 0;
					}
					$count++;
				echo("
				
					<div class=\"grid-item\">
						<img class=\"m-3 rounded-circle\" src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"100\" height=\"100\"/>
						<p>   <bold class=\"fw-bold\">   ". $team['name'] ." ". $team['famillyName'] ."</bold></p>
						<p>	  ".  $team['grade'] ."</p> 
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
				} else {
					$former = true;
				}
			}
			echo("</div>");

			echo("<h5 class=\"mt-2\">Alumni (MSC)</h5>");

			$count = 0;
			// Display Former MSC team Member
			
			foreach($_SESSION['team'] as $team) {
				if ($team['pictureName'] == "NULL") {
					$team['pictureName'] = "nobody.jpg";
				}
				if ($team['endDate'] != "0000-00-00" && $team['name'] != 'Farid' && $team['famillyName'] != 'Naït-Abdesselam' && $team['grade'] == 'MSC') {
					if ($count == 0) {
						echo("<div class=\"d-flex grid-container\">");
					} else if ($count == 7){
						echo("</div>
							<div class=\"d-flex grid-container\">");
							$count = 0;
					}
					$count++;
				echo("
				
					<div class=\"grid-item\">
						<img class=\"m-3 rounded-circle\" src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"100\" height=\"100\"/>
						<p>   <bold class=\"fw-bold\">   ". $team['name'] ." ". $team['famillyName'] ."</bold></p>
						<p>	  ".  $team['grade'] ."</p> 
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
				} else {
					$former = true;
				}
			}
			echo("</div>");

			$count = 0;
			// Display Former BSC team Member
			echo("<h5 class=\"mt-2\">Alumni (BSC)</h5>");
			
			foreach($_SESSION['team'] as $team) {
				if ($team['pictureName'] == "NULL") {
					$team['pictureName'] = "nobody.jpg";
				}
				if ($team['endDate'] != "0000-00-00" && $team['name'] != 'Farid' && $team['famillyName'] != 'Naït-Abdesselam' && $team['grade'] == 'BSC') {
					if ($count == 0) {
						echo("<div class=\"d-flex grid-container\">");
					} else if ($count == 7){
						echo("</div>
							<div class=\"d-flex grid-container\">");
							$count = 0;
					}
					$count++;
				echo("
				
					<div class=\"grid-item\">
						<img class=\"m-3 rounded-circle\" src=\"./ressources/profilPicture/" . $team['pictureName']. "\" alt=\"PP\" width=\"100\" height=\"100\"/>
						<p>   <bold class=\"fw-bold\">   ". $team['name'] ." ". $team['famillyName'] ."</bold></p>
						<p>	  ".  $team['grade'] ."</p> 
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
				} else {
					$former = true;
				}
			}
			echo("</div>");
		}

		echo("<h5 class=\"mt-2\">Other</h5>");
		echo("<ul>");
		// Display Former Other team Member
		foreach($_SESSION['team'] as $team) {
			if ($team['grade'] == "Other") {
				echo("<li>
				<bold class=\"fw-bold\">".$team['name']." ". $team['famillyName'] ." </bold> - ".$team['diploma']." - " . $team['researchInterest'] .
				 " - " . $team['startDate']);
				 if ($team['endDate'] != '0000-00-00') {
					echo ($team['endDate']);
				 } 
				 if ($team['email'] != 'NULL') {
					echo($team['email']);
				 }
				 if ($team['homepage'] != 'NULL')  {
				 	echo($team['homepage']);
				 }
				echo("</li>");
			}
		}
		echo("<ul>");
		echo("
				</div>
				</div>");
		
		
		echo("
		</div>
		</div>");
	?>
