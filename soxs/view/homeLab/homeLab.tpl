<div class="pubArray d-flex flex-column justify-content-center mx-auto py-1">
    <div class="d-flex flex-rom justify-content-evenly">
    <div class="d-flex flex-column w-100 ps-5">
            
            <?php
            
            
            $admin = $_SESSION["adminBio"];

            echo("<div class=\"modal fade\" id=\"jsonModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
            <div class=\"modal-dialog modal-xl\">
                <div class=\"modal-content\">
                <div class=\"modal-header\">
                    <h5 class=\"modal-title\" id=\"exampleModalLabel\">Modify Bio</h5>
                    <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
                </div>
                <div class=\"modal-body\">
                    <form action=\"controller/updateBio.php\" method=\"post\" enctype=\"multipart/form-data\">
                        <div class=\"mb-3\">
                            <label for=\"message-text\" class=\"col-form-label\">Message:</label>
                            <textarea name=\"bio\"  rows=\"20\" cols=\"90\" value=\"\" class=\"form-control\" id=\"JsonContent\"></textarea>
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

                echo("<div class=\" d-flex flex-rom pb-4\" style=\" width: 100%;\">
											
                    <div class=\"px-1 bd-highlight\">
                        <img src=\"./ressources/profilPicture/" . $admin['pictureName']. "\" alt=\"PP\" width=\"150\" height=\"150\"/>
                    </div>
            
                    <div class=\" d-flex flex-column flex-fill\">
                        
                        <p class=\"openSans\"> ". $admin['firstName'] ." ". $admin['lastName'] ."</p>
                        <ul>");

                foreach($admin["title"] as $title) {
                    echo("<li>" . $title ." </li>");
                }
                
                echo("</ul>
                        <p> Contact:".  $admin['eMail'] ."</p>
                        <a href=\"ressources/". $admin["CV"]  ."\" target=\"_blank\"> Here is my CV </a>
                        
                                                   
                </div>
                        
              </div>");
              
            foreach($admin["content"] as $content) {


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
            }
            ?>
        </div>
        <div class="d-flex flex-column w-100 pe-5">
            
            <div class="d-flex flex-column mb-5">
                <h5 class="homeTitle flex-fill">Last News</h5>
                <?php
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
                                    <li class=\"my-1\">". $news['date'] ." \" ". $news['title'] ." </a><br> " .
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

