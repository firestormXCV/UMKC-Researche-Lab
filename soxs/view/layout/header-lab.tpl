
    <nav class="navbar navbar-expand-xl navbar-light bg-light topnav fixed-top text-center">
        <div class="container-fluid topnav mx-5 px-5 ">
            <a href="index.php?controle=homeLab&action=homeLab" class="navbar-brand logo">
                <img src="ressources/assets/UMKC_logo_bleu.png" height="55" alt="Logo-UMKC">
            </a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarCollapse">
                <div class="navbar-nav ">
                    <a href="index.php?controle=homeLab&action=homeLab" class="nav-item nav-link active text-dark "><bold class="fw-bold ">Home</bold></a>
                    <a class="dropdown-item text-dark" href="index.php?controle=team&action=showTeam"><bold class="fw-bold">Team</bold></a>
                    <a href="index.php?controle=article&action=displayAll" class="nav-item nav-link text-dark"><bold class="fw-bold">Publication</bold></a>
                    <a href="index.php?controle=news&action=allNews" class="nav-item nav-link text-dark"><bold class="fw-bold">News</bold></a>
                    <a class="dropdown-item text-dark" href="index.php?controle=gallery&action=showGallery"><bold class="fw-bold">Gallery</bold></a>    
                    <a href="index.php?controle=location&action=locate" class="nav-item nav-link text-dark"><bold class="fw-bold">Location</bold></a>
                </div>
                <div class="navbar-nav ms-auto">
                    <?php
                    //var_dump($_SESSION['profil']);
                        
						if(!isset($_SESSION['profil'])) {
                            echo("<a href=\"index.php?controle=access&action=login\" class=\"nav-item nav-link text-dark border border-dark rounded px-3 \">Login</a>");
                        }
                        else{
                            
                            echo("<a href=\"index.php?controle=access&action=bye\" class=\"nav-item nav-link text-dark border border-dark rounded px-3 \">Logout</a>");
                        }

                    ?>
                </div>
            </div>
        </div>
    </nav>
