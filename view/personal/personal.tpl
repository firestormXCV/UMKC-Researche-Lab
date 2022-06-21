<div class="pubArray d-flex flex-column justify-content-center mx-auto">

    <?php

    if(isset($_SESSION['profil'])) {
        echo("<div class=\"modal fade\" id=\"ServicesModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
        <div class=\"modal-dialog modal-xl\">
            <div class=\"modal-content\">
            <div class=\"modal-header\">
                <h5 class=\"modal-title\" id=\"exampleModalLabel\">Modify Personal</h5>
                <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
            </div>
            <div class=\"modal-body\">
                <form action=\"controller/personal.php\" method=\"post\" enctype=\"multipart/form-data\">
                <input type=\"hidden\" id=\"recipient-id\" name=\"idix\" value=\"". $_SESSION['content'][2]['id'] ."\">
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
        </div>
        </div>");
		echo("<button onclick=\"modifyContent(".  $_SESSION['content'][2]['id'] .");\" type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#ServicesModal\" >Update Personal</button>");
	}

    echo("<div class=\"mx-5\">
       ". nl2br($_SESSION['content'][2]['content']) ."
    </div>");

    ?>

</div>

