<?php
$msg=isset($_SESSION['msgErr'])?$_SESSION['msgErr']:'';

echo("			
				
<div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">
<div class=\"modal-dialog modal-xl\">
    <div class=\"modal-content\">
    <div class=\"modal-header\">
        <h5 class=\"modal-title\" id=\"exampleModalLabel\">New Picture</h5>
        <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>
    </div>
    <div class=\"modal-body\">
        <form action=\"controller/gallery.php\" method=\"post\" enctype=\"multipart/form-data\">
        <div class=\"mb-3\">
                <label for=\"recipient-name\" class=\"col-form-label\">Caption</label>
                <input name=\"caption\" required type=\"text\" class=\"form-control\" id=\"recipient-name\">
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
</div>");

echo("<div class=\"pubArray d-flex flex-column justify-content-center mx-auto\"  >");

if(isset($_SESSION['profil'])) {
    echo("<button type=\"button\" class=\"btn btn-primary  mt-4 mb-2 mx-auto \" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\" >Add Picture</button>");
}



function beliefmedia_grid_gallery($dir = 'ressources/gallery', $columns = '5', $url = false, $width = '450,560,960') {
  $width = explode(',', $width);
  $transient = md5(serialize(func_get_args()));
  $style = '
<style>
    .bm-grid-' . $transient . ' {
      background: #ffffff;
      -webkit-column-count: 1;
      -webkit-column-gap: 10px;
      -webkit-column-fill: auto;
      -moz-column-count: 1;
      -moz-column-gap: 10px;
      -moz-column-fill: auto;
      column-count: 1;
      column-gap: 15px;
      column-fill: auto;
    }

    .bm-grid-item-' . $transient . ' {
      display: inline-block;
      background: #F8F8F8;
      margin: 0 0 10px;
      padding: 15px;
      padding-bottom: 5px;
      -webkit-column-break-inside: avoid;
      -moz-column-break-inside: avoid;
      column-break-inside: avoid;
    }
 
    .bm-hr-grid-' . $transient . ' {
      display: block;
      height: 1px;
      border: 0;
      border-top: 1px solid #ccc;
      margin: .5em 10px;
      padding: 0;
    }
 
    .bm-grid-img-' . $transient . ' {
      width: 100%
    }

    .bm_p_grid-' . $transient . ' {
      margin: 10px;
      font-size: .8em;
      font-family: arial;
    line-height: 1.5em;
    }

    @media (min-width: ' . $width['0'] . 'px) {
      .bm-grid-' . $transient . ' {
        -webkit-column-count: 2;
        -moz-column-count: 2;
        column-count: 2;
      }
    }
 
    @media (min-width: ' . $width['1'] . 'px) {
      .bm-grid-' . $transient . ' {
        -webkit-column-count: 3;
        -moz-column-count: 3;
        column-count: 3;
      }
    }

    @media (min-width: ' . $width['2'] . 'px) {
      .bm-grid-' . $transient . ' {
        -webkit-column-count: ' . $columns . ';
        -moz-column-count: ' . $columns . ';
        column-count: ' . $columns . ';
      }
    }
    </style>
';
  /* Scan all images in the image directory */
  $image_array = glob(rtrim($dir, '/') . '/*.{jpg,jpeg,png,gif}', GLOB_BRACE);
  $return = '';
  echo("<div class=\"mx-4\">");
  foreach ($_SESSION['pictures'] AS $image) {
    
    $return .= '<div class="bm-grid-item-' . $transient . '"><img class="bm-grid-img-' . $transient . '" src="ressources/gallery/' . $image['namePicture'] . '"><p>'. $image['caption'].'</p></div>';
  }
$return = '<div class="bm-grid-' . $transient . '">' . $style . $return . '</div>';
 return $return;
}

echo beliefmedia_grid_gallery();
echo("</div>
</div>");

?>