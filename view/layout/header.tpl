
    <nav class="navbar navbar-expand-xl navbar-light bg-light topnav fixed-top">
        <div class="container-fluid topnav">
            <a href="index.php?controle=home&action=home" class="navbar-brand logo">
                <img src="ressources/assets/UMKC_logo.png" height="55" alt="Logo-UMKC">
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarCollapse">
                <div class="navbar-nav ms-auto">
                    <a href="index.php?controle=home&action=home" class="nav-item nav-link active text-light ">Home</a>
                    <a href="index.php?controle=article&action=displayAll" class="nav-item nav-link text-light">Publication</a>
                    

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                          Team
                        </a>
                        <ul class="dropdown-menu bg-primary drop" aria-labelledby="navbarScrollingDropdown">
                          <li><a class="dropdown-item" href="index.php?controle=team&action=showTeam">Presentation</a></li>
                          <li><a class="dropdown-item" href="index.php?controle=gallery&action=showGallery">Gallery</a></li>
                        </ul>
                    </li>

                    <a href="#" class="nav-item nav-link text-light">Teaching</a>
                    <a href="index.php?controle=news&action=allNews" class="nav-item nav-link text-light">News</a>
                    <a href="index.php?controle=location&action=locate" class="nav-item nav-link text-light">Location</a>
                </div>
                <div class="navbar-nav ms-auto">
                    <?php
                    //var_dump($_SESSION['profil']);
                        
						if(!isset($_SESSION['profil'])) {
                            echo("<a href=\"index.php?controle=access&action=login\" class=\"nav-item nav-link text-light border border-white rounded px-3 \">Login</a>");
                        }
                        else{
                            
                            echo("<a href=\"index.php?controle=access&action=bye\" class=\"nav-item nav-link text-light border border-white rounded px-3 \">Logout</a>");
                        }

                    ?>
                </div>
            </div>
        </div>
    </nav>
