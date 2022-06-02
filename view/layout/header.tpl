
    <nav class="navbar navbar-expand-xl navbar-light bg-light topnav fixed-top">
        <div class="container-fluid topnav mx-5 px-5 py-1">

            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="index.php?controle=home&action=home" class="nav-item nav-link active text-dark border border-dark rounded px-3">Home</a>
                    <a href="soxs/index.php?controle=homeLab&action=homeLab" class="nav-item nav-link text-dark border border-dark rounded px-3">Research</a>
                    <a href="index.php?controle=teaching&action=teaching" class="nav-item nav-link text-dark border border-dark rounded px-3">Teaching</a>
                    <a href="index.php?controle=article&action=displayAll" class="nav-item nav-link text-dark border border-dark rounded px-3">Publication</a>
                    <a href="index.php?controle=services&action=services" class="nav-item nav-link text-dark border border-dark rounded px-3">Services</a>
                    <a href="index.php?controle=personal&action=personal" class="nav-item nav-link text-dark border border-dark rounded px-3">Personal</a>
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
