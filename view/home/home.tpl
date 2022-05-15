<div class="pubArray d-flex flex-column justify-content-center mx-auto py-5"  style=" width: 92%; margin-top: 100px; margin-bottom: 50px">
    <div class="d-flex flex-rom justify-content-evenly">
    <div class="d-flex flex-column w-100 ps-5">
            
            <?php

            
            $admin = $_SESSION["adminBio"];

            
                echo("<div class=\" d-flex flex-rom pb-4\" style=\" width: 100%;\">
											
                    <div class=\"px-2 bd-highlight\">
                        <img src=\"./ressources/profilPicture/" . $admin['pictureName']. "\" alt=\"PP\" width=\"200\" height=\"200\"/>
                    </div>
            
                    <div class=\" d-flex flex-column flex-fill\">
                        <p>   <bold class=\"fw-bold\">   ". $admin['firstName'] ." ". $admin['lastName'] ."</bold></p>
                        <ul>");

                foreach($admin["title"] as $title) {
                    echo("<li>" . $title ." </li>");
                }
                
                echo("</ul>
                        <p>   <bold class=\"fw-bold \">Contact: </bold>".  $admin['eMail'] ."</p>
                        <a href=\"ressources/". $admin["CV"]  ."\" target=\"_blank\"> Here is my CV </a>
                        
                                                   
                </div>
                        
              </div>");
              
            foreach($admin["content"] as $content) {


                  echo("<h5 class=\"homeTitle\">" . $content["title"]. "</h5>");

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
            <div class="d-flex flex-rom homeNews mb-3">
                <img class="align-self-center pb-2 ps-3" src="ressources/assets/UMKC_logo.png" height="80" alt="Logo-UMKC">
            </div>
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
                                        <th class=\"table-primary \" scope=\"col\">". date("Y", $date1) ."</th>
                                        <th class=\"table-primary\" scope=\"col\"></th>
                                        
                                        
                                    </tr>
                                </thead>
                                <tbody>");
                        }
                        
                        echo("
                            
                            <tr>
                                
                                <td class=\"space\">
                                    <ul>
                                        <li>". $news['date'] ." \" ". $news['title'] ." </a><br> " .
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
