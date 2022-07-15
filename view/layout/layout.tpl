<?php 
	//The Layout is the base of the website
	global $controle;  //accès aux variables globales 
	global $action; 	//nécessaire car layout inclus au sein d'une fonction-action
?>

<html> <!-- This tag is compulsory for any HTML document. -->   
	<head>
		<script src="view/style/js/script.js"></script>																<!-- include the JS Script -->
		<link href="view/style/css/header.css?v=<?php echo time(); ?>" rel="stylesheet">							<!-- include the CSS + force refresh the style (delete the php part once the development finish) -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >		<!--  -->
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" ></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>  <!-- Bootstrap, framework responsive -->
		<link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css'>
		<link rel="preconnect" href="https://fonts.googleapis.com">													<!-- Include Font -->
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>										<!-- Include Font -->
		<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@350&display=swap" rel="stylesheet">		<!-- Include Font-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>					<!-- Include JQuery to send request from JS to PHP files (client to server)-->

		
  
	</head>  
	<body onload="initNews()" > 			<!-- Start the initialization function from the JS files (cf there) -->
		
			<?php  require ("./view/layout/header.tpl"); ?>	<!-- Call the Header/Navbar-->
		

		<div id ="main">
			<button onclick="topFunction()" id="myBtn" title="Go to top"><i class="bi bi-arrow-up"></i></button>
			<?php  require ("./view/" . $controle . "/" . $action . ".tpl"); ?>  									<!-- Call the content of the page depending the controle and action variable-->
		</div>
			<?php  require ("./view/layout/footer.tpl"); ?>	<!-- Call the Footer-->
	</body>  
</html>  