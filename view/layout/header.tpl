
    <nav class="navbar navbar-expand-xl navbar-light bg-light topnav fixed-top">
        <div class="container-fluid topnav mx-5 px-5 py-1">

            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="index.php?controle=home&action=home" class="nav-item nav-link active text-dark "><bold class="fw-bold ">Home</bold></a>
                    <a href="soxs/index.php?controle=homeLab&action=homeLab" class="nav-item nav-link text-dark"><bold class="fw-bold">Research</bold></a>
                    <a href="index.php?controle=teaching&action=teaching" class="nav-item nav-link text-dark"><bold class="fw-bold">Teaching</bold></a>
                    <a href="index.php?controle=article&action=displayAll" class="nav-item nav-link text-dark"><bold class="fw-bold">Publication</bold></a>
                    <a href="index.php?controle=services&action=services" class="nav-item nav-link text-dark"><bold class="fw-bold">Services</bold></a>
                    <a href="index.php?controle=personal&action=personal" class="nav-item nav-link text-dark"><bold class="fw-bold">Personal</bold></a>
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
