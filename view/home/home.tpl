<div class="pubArray d-flex flex-column justify-content-center mx-auto py-1"  >
    <div class="d-flex flex-rom justify-content-evenly">
    <div class="d-flex flex-column w-100 ps-5">
            
            <?php
            
            
            $admin = $_SESSION["bio"];

            if(isset($_SESSION['profil'])) {    //Modal to modify the bio, send the data to home.php with POST method
                echo("<div class=\"modal fade\" id=\"ServicesModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
                <div class=\"modal-dialog modal-xl\">
                    <div class=\"modal-content\">
                    <div class=\"modal-header\">
                        <h5 class=\"modal-title\" id=\"exampleModalLabel\">Modify Content</h5>
                        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
                    </div>
                    <div class=\"modal-body\">
                        <form action=\"controller/home.php\" method=\"post\" enctype=\"multipart/form-data\">
                        <input type=\"hidden\" id=\"recipient-id\" name=\"idixi\" value=\"". $_SESSION['content'][3]['id'] ."\">
                            <button id=\"addLink\" type=\"button\" class=\"btn btn-info btn-sm\" >Add Link</button>
                            <button id=\"addList\" type=\"button\" class=\"btn btn-info btn-sm\" >Add List</button>
                            <button id=\"addTitle\" type=\"button\" class=\"btn btn-info btn-sm\" >Add Title</button>
                            <button id=\"addBr\" type=\"button\" class=\"btn btn-info btn-sm\" >Add Line Break</button>
                            <button id=\"addParagraph\" type=\"button\" class=\"btn btn-info btn-sm\" >Add Paragraph</button>
        
                            <div class=\"mb-3\">
                                <label for=\"message-text\" class=\"col-form-label\">Content:</label>
                                <textarea name=\"content\"  rows=\"20\" cols=\"90\" class=\"form-control\" id=\"message-text\" value=\"\"></textarea>
                                
                            </div>
                            <div class=\"d-flex justify-content-between mt-2\">
                                    <button type=\"submit\" name=\"submit\" class=\"btn btn-primary\" value=\"Start Upload\">Modify</button>
                                    <button type=\"button\" class=\"btn btn-secondary flex-directi\" data-bs-dismiss=\"modal\">Cancel</button>
                            </div>
                            
                        </form>
                    </div>
                    
                    </div>
                </div>");
                //Modal to update the profile, send the data to modifyAdmin.php with POST Method
                echo("</div>    
                <div class=\"modal fade\" id=\"modifBio\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
				<div class=\"modal-dialog  modal-xl\">
					<div class=\"modal-content\">
						<div class=\"modal-header\">
							<h5 class=\"modal-title\" id=\"modifModalLabel\">Modify Publication</h5>
							<button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
						</div>
					<div class=\"modal-body\">
						<form action=\"controller/modifyAdmin.php\" method=\"post\" enctype=\"multipart/form-data\">
                            <input type=\"hidden\" id=\"recipient-id\" name=\"idixi\" value=\"1\">
							<input type=\"hidden\" id=\"recipient-id-modify\" name=\"idif\" value=\"\">

                            <input type=\"hidden\" id=\"recipient-fileCV\" name=\"recipient-fileCV\" value=\"". $_SESSION['bio'][0]['cv'] ."\">
                            <input type=\"hidden\" id=\"recipient-filePic\" name=\"recipient-filePic\" value=\"". $_SESSION['bio'][0]['pictureName'] ."\">
							<div class=\"mb-3\">
								<label for=\"recipient-name\" class=\"col-form-label\">Name</label>
								<input name=\"name\" value=\"\" required type=\"text\" class=\"form-control\" id=\"recipient-name-modify\">
							</div>
							<div class=\"mb-3\">
								<label for=\"recipient-title\" class=\"col-form-label\">Title</label>
								<input name=\"title\" required type=\"text\" class=\"form-control\" id=\"recipient-title-modify\">
							</div>
							<div class=\"mb-3\">
								<label for=\"recipient-contact\" class=\"col-form-label\">Contact</label>
								<textarea name=\"contact\" class=\"form-control\" id=\"recipient-contact-modify\"></textarea>

							</div>
							<div class=\"mb-3\">
                                <label for=\"recipient-contact\" class=\"col-form-label\">File Profile Picture</label>
                                <br>
								<input type=\"file\" name=\"the_filePic\" id=\"fileToUploadPic\">
								
							</div>
                            <div class=\"mb-3\">
                                <label for=\"recipient-contact\" class=\"col-form-label\">File CV</label>
                                <br>
								<input type=\"file\" name=\"the_fileCV\" id=\"fileToUploadCV\">
								
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
                //Button to open the modal above
                echo("<div>
                        <button onclick=\"modifyContent(".  $_SESSION['content'][3]['id'] .");\" type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#ServicesModal\" >Update Bio</button>
                        <button onclick=\"modifyProfile();\" type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#modifBio\" >Update Profile</button>
                      </div>");
            }
                //Left side of the screen, profile of the admin, picture and short information
                echo("<div class=\" d-flex flex-rom pb-4\" style=\" width: 100%;\">
											
                    <div class=\"pe-2 bd-highlight\">
                        <img src=\"./ressources/profilPicture/" . $admin[0]['pictureName']. "\" alt=\"PP\" width=\"150\" height=\"150\"/>
                    </div>
            
                    <div class=\" d-flex flex-column flex-fill\">
                        <p class=\"openSans\">   <bold class=\"fw-bold\">   ". $admin[0]['name'] ."</bold></p>
                        <ul>");
                $res = explode(',', $admin[0]['title']);
                
                foreach($res as $title) {
                    echo("<li>" . $title ." </li>");
                }
                
                echo("</ul>
                        <p>Contact: ".  $admin[0]['contact'] ."</p>
                        <a href=\"ressources/". $admin[0]["cv"]  ."\" target=\"_blank\"> Here is my CV </a>
                        
                                                   
                </div>
                        
              </div>");
                //Bio of the admin, under the profile
              echo("<div id=\"bioDesc\" class=\"mx-1\">
                    
                    ". ($_SESSION['content'][3]['content']) ."
                </div>");

            ?>
        </div>
        <!-- right side of the screen -->
        <div class="d-flex flex-column w-100 pe-4">
            
            <div class="d-flex flex-column mb-5">
                <h5 class="homeTitle flex-fill">Last News</h5>
                <?php
                    //display the 5 last news
                    $currentDate = '2038-01-10';
                    $begin = true;
                    $i = 0;
                    foreach($_SESSION['news'] as $news) {
                        $i++;
                        if ($i>5) {
                            break;
                        }
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
                                        
                                        <th class=\"table-primary\" scope=\"col\"></th>
                                        
                                        
                                    </tr>
                                </thead>
                                <tbody>");
                        }
                        
                        echo("
                            
                            <tr>
                                
                                <td class=\"space\">
                                    <ul>
                                        <li class=\"my-1\">". $news['date'] ." ". $news['title'] ." </a><br> " .
                                        $news['content'] ."</li>
                                    </ul>
                                <td>
                            </tr>");
                            
                    }
                    
                    
                    echo("</tbody>
                    </table>
                    ");
                ?>
                <a href="http://localhost/UMKC-Researche-Lab/soxs/index.php?controle=news&action=allNews">See more...</a> <!-- send to the page news -->
                <div class="me-4"> <!-- Twitter feed of the UMKC -->
                    <a class="twitter-timeline" data-height="800" href="https://twitter.com/UMKC?ref_src=twsrc%5Etfw">Tweets by UMKC</a>
                    <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
            </div>
        </div>

        
    </div>
</div>

