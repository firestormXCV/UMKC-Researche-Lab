<div class="pubArray d-flex flex-column justify-content-center mx-auto py-1"  >
    <div class="d-flex flex-rom justify-content-evenly">
    <div class="d-flex flex-column w-100 ps-5">
            
            <?php
            
            
            $admin = $_SESSION["bio"];

            if(isset($_SESSION['profil'])) {
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
                </div>
                </div>
                <div class=\"modal fade\" id=\"modifBio\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
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
                echo("<div>
                        <button onclick=\"modifyContent(".  $_SESSION['content'][3]['id'] .");\" type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#ServicesModal\" >Update Bio</button>
                        <button onclick=\"modifyContent(".  $_SESSION['content'][3]['id'] .");\" type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#modifBio\" >Update Profile</button>
                      </div>");
            }

                echo("<div class=\" d-flex flex-rom pb-4\" style=\" width: 100%;\">
											
                    <div class=\"px-2 bd-highlight\">
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
                        <p>   <bold class=\"fw-bold \">Contact: </bold>".  $admin[0]['contact'] ."</p>
                        <a href=\"ressources/". $admin[0]["cv"]  ."\" target=\"_blank\"> Here is my CV </a>
                        
                                                   
                </div>
                        
              </div>");

              echo("<div class=\"mx-1\">
                    
                    ". ($_SESSION['content'][3]['content']) ."
                </div>");

            /*foreach($admin["content"] as $content) {

                

                  echo("<h5 class=\"homeTitle\">" . $content["title"]. " ");
                  if(isset($_SESSION['profil'])) {
                      echo("<button id=\"tootoo\" onclick=\"jsonDisplay();\" type=\"button\" class=\"btn\" data-bs-toggle=\"modal\" data-bs-target=\"#jsonModal\" ><i class=\"bi bi-plus-lg\"></i></button></h5>");
                  } else {
                      echo("</h5>");
                  }
                  

                if (count($content["content"]) > 1) {
                    foreach($content["content"] as $inside) {
                        
                        echo("<ul>");
                        echo(
                        "<li class=\"home\">". $inside . "</li>");
                        echo("</ul>"); 
                    }                   
                } else {
                    echo("<p class=\"ms-3\">". $content["content"][0] . "</p>");
                }                
            }*/
            ?>
        </div>
        <div class="d-flex flex-column w-100 pe-4">
            
            <div class="d-flex flex-column mb-5">
                <h5 class="homeTitle flex-fill">Last News</h5>
                <?php
                    $currentDate = '2038-01-10';
                    $begin = true;
                    $i = 0;
                    foreach($_SESSION['news'] as $news) {
                        $i++;
                        if ($i>10) {
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
                                        <li class=\"my-1\"><bold class=\"fw-bold \">". $news['date'] ."</bold> \" ". $news['title'] ." </a><br> " .
                                        $news['content'] ."</li>
                                    </ul>
                                <td>
                            </tr>");
                            
                    }
                    
                    
                    echo("</tbody>
                    </table>
                    ");
                ?>
                <div class="me-4">
                    <a class="twitter-timeline" data-height="800" href="https://twitter.com/UMKC?ref_src=twsrc%5Etfw">Tweets by UMKC</a>
                    <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
                </div>
            </div>
        </div>

        
    </div>
</div>

